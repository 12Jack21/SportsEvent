var table = null;
$(document).ready(function () {
    var selectAlert = $("#selectAlert");
    var operateAlert = $("#operateAlert");

    table = $("#coachDataTable").DataTable({
        // "retrieve":true,
        "select":true, //开启选择
        "searching":true,
        "ajax": {
            url:"list/1",
            dataSrc:""
        },
        "columns": [
            {"data":"id"},
            {"data":"name"},
            {"data":"sex"},
            {"data":"phone"},
            {"data":"coachID"}
        ]
    });

    $('#coachDataTable tbody').on( 'click', 'tr', function () {
        $(this).toggleClass('selected');
        $(this).toggleClass('table-active');
    } );

    $("#deleteBtn").click(function () {
        var len = table.rows(".selected").data().length;
        var selectCount = $("#confirmDelete");
        var alert = $("#selectAlert");
        var modal = $("#deleteModal");
        if(len == 0){
            $("#selectAlert strong").text("Cannot delete: Your haven't select a coach yet !");
            alertReport(alert);

        }else if(len == 1){
            selectCount.text("coach");
            modal.modal("show");
        }else{
            selectCount.text(len + " coaches");
            modal.modal("show");
        }

    })

});

//进行相关操作后用警告框通知前端
function alertReport($alert) {
    $alert.removeAttr("hidden").show();
    return setTimeout(function () {
        $alert.hide();
    },5000);
}

//关闭警告框
function hideAlert(ele){
    var alert = $(ele).parent();
    console.log(alert);
    alert.hide();
}

//添加教练表单
$("#addCoach").submit(function (event) {
    event.preventDefault();
    var $form = $(this);
    var urlll = $form.attr("action");
    var add = $("#addAlert");

    $.ajax({
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        url: $form.attr("action"),//url
        data: $form.serialize(),
        success: function (result) {
            console.log(result, status);//打印服务端返回的数据(调试用)
            console.log(result);

            add.children("strong").text("Add coach success !!!");
            add.removeClass("alert-danger").addClass("alert-success");
            $("#addModal").modal("hide");
            table.ajax.reload();//刷新DataTable
            $form[0].reset();
        },
        error : function() {
            add.children("strong").text("Add coach fail !!!");
            add.removeClass("alert-danger").addClass("alert-success");
        },
        complete:function () {
            alertReport(add);
        }
    });
})

//更新按钮 判断
function updateBtn(){
    var update = $("#updateAlert");
    var coach = table.rows(".selected").data();
    if(coach.length == 0){
        update.removeClass("alert-danger").removeClass("alert-success").addClass("alert-warning");
        update.children("strong").text("You haven't selected a coach to update yet !!!");
        alertReport(update);
    }else if(coach.length > 1){
        update.removeClass("alert-danger").removeClass("alert-success").addClass("alert-warning");
        update.children("strong").text("You have selected more than one coach to update !!!");
        alertReport(update);
    }else if(coach.length == 1){
        $("#updateModal").modal("show");

        //填充表单数据
        $("#coach_idUpdate").val(coach[0].id);
        $("#nameUpdate").val(coach[0].name);
        $("#phoneUpdate").val(coach[0].phone);
        if(coach[0].sex == 0)
            $("#femaleradioUpdate").attr("checked",true);
        else
            $("#maleradioUpdate").attr("checked",true);
        $("#IDUpdate").val(coach[0].coachID);

    }
}

//更新教练表单
$("#updateCoach").submit(function (event) {
    event.preventDefault();
    var $form = $(this);
    var url = $form.attr("action");
    var update = $("#updateAlert");

    $.ajax({
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        url: url,
        traditional:true,
        data: {
            data:$form.serialize()
        },
        success: function (result) {
            console.log(result, status);//打印服务端返回的数据(调试用)
            var as1 = status;

            update.children("strong").text("Update coach success !!!");
            update.removeClass("alert-danger").removeClass("alert-warning").addClass("alert-success");
            $("#updateModal").modal("hide");
            table.ajax.reload();//刷新DataTable
            $form[0].reset();
        },
        error : function() {
            update.children("strong").text("Update coach fail !!!");
            update.addClass("alert-danger").removeClass("alert-success").removeClass("alert-warning");
        },
        complete:function () {
            alertReport(update);
        }
    });
});

//删除教练表单
function deleteCoach(btn){

    var selection = table.rows(".selected").data();
    console.log(selection);
    var deleteIds = [];
    for(var i=0;i<selection.length;i++){
        deleteIds.push(selection[i].id);
    }
    var del = $("#deleteAlert");
    var url = "/delete";
    $.ajax({
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        data:{
          data:deleteIds
        },
        traditional:true,////这里设置为true,使传递参数变成 data:1
        url: "/sports/json/coach/delete",
        success: function (result) {
            console.log(result, status);//打印服务端返回的数据(调试用)
            var as1 = status;

            del.children("strong").text("Delete operation success !!!");
            del.removeClass("alert-danger").addClass("alert-success");
            $("#deleteModal").modal("hide");
            table.ajax.reload();//刷新DataTable
        },
        error : function() {
            del.children("strong").text("Delete operation fail !!!");
            del.addClass("alert-danger").removeClass("alert-success");
        },
        complete:function () {
            alertReport(del);
        }
    });
}

