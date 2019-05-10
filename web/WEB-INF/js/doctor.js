var table = null;

var updateData = null;
$(document).ready(function () {

    table = $("#docDataTable").DataTable({
        // "retrieve":true,

        "select":true, //开启选择
        "searching":true,
        "responsive":true,
        "ajax": {
            url:"doctor/list", //TODO 需要改成 session
            dataSrc:""
        },
        "columns": [
            {"data":"id"},
            {"data":"name"},
            {"data":"phone"},
            {"data":"docID"}
        ],
        "columnDefs": [{
            //隐藏第一列 id
            "targets":0,
            "searchable":false,
            "visible":false
        },{
            //对 docID 关闭搜索功能
            "targets":3,
            "searchable":false
        }]

    });

    $('#docDataTable tbody').on( 'click', 'tr', function () {
        $(this).toggleClass('selected');
        $(this).toggleClass('table-active');
    } );

    $("#deleteBtn").click(function () {
        var len = table.rows(".selected").data().length;
        var selectCount = $("#confirmDelete");
        var alert = $("#selectAlert");
        var modal = $("#deleteModal");
        if(len == 0){
            $("#selectAlert strong").text("Cannot delete: Your haven't select a doctor yet !");
            alertReport(alert);

        }else if(len == 1){
            selectCount.text("doctor");
            modal.modal("show");
        }else{
            selectCount.text(len + " doctors");
            modal.modal("show");
        }

    })

});

//进行相关操作后用警告框通知前端
function alertReport($alert) {
    $alert.removeAttr("hidden").show();
    //设置为 5 秒后自动关闭警告框
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

//添加医生表单
$("#addDoc").submit(function (event) {
    event.preventDefault();
    var $form = $(this);
    var add = $("#addAlert");

    $.ajax({
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        url: $form.attr("action"),
        data: $form.serialize(),
        success: function (result) {
            console.log(result, status);//打印服务端返回的数据(调试用)
            console.log(result);

            add.children("strong").text("Add doctor success !!!");
            add.removeClass("alert-danger").addClass("alert-success");
            table.ajax.reload();//刷新DataTable
            $form[0].reset();
        },
        error : function() {
            add.children("strong").text("Add doctor fail !!!");
            add.removeClass("alert-danger").addClass("alert-success");
        },
        complete:function () {
            $("#addModal").modal("hide");
            alertReport(add);
        }
    });
})

//更新按钮 判断
function updateBtn(){
    var update = $("#updateAlert");
    var doc = table.rows(".selected").data();
    if(doc.length == 0){
        update.removeClass("alert-danger").removeClass("alert-success").addClass("alert-warning");
        update.children("strong").text("You haven't selected a doctor to update yet !!!");
        alertReport(update);
    }else if(doc.length > 1){
        update.removeClass("alert-danger").removeClass("alert-success").addClass("alert-warning");
        update.children("strong").text("You have selected more than one doctor to update !!!");
        alertReport(update);
    }else if(doc.length == 1){
        $("#updateModal").modal("show");

        //填充表单数据
        $("#doc_idUpdate").val(doc[0].id);
        $("#nameUpdate").val(doc[0].name);
        $("#phoneUpdate").val(doc[0].phone);;
        $("#IDUpdate").val(doc[0].docID);

        //用于比较是否更改了表单
        updateData = [doc[0].name,doc[0].phone,doc[0].docID];
    }
}

//更新医生表单
$("#updateDoc").submit(function (event) {
    event.preventDefault();
    console.log(updateData);
    console.log($("#nameUpdate").val());
    console.log($("#phoneUpdate").val());
    console.log($("#IDUpdate").val());

    if(updateData[0] == $("#nameUpdate").val() && updateData[1] == $("#phoneUpdate").val()
        && updateData[2] == $("#IDUpdate").val()){
        //表单未更新
        alertReport($("#uAlert"));

    }else {
        var $form = $(this);
        var data = $form.serialize();
        console.log(data);
        // var send = JSON.parse(data);
        // console.log(send);
        var url = $form.attr("action");
        console.log(url);
        var update = $("#updateAlert");

        $.ajax({
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: url,
            traditional:true,
            data: data,
            success: function (result) {
                console.log(result, status);//打印服务端返回的数据(调试用)

                update.children("strong").text("Update doctor success !!!");
                update.removeClass("alert-danger").removeClass("alert-warning").addClass("alert-success");
                table.ajax.reload();//刷新DataTable
            },
            error : function() {
                update.children("strong").text("Update doctor fail !!!");
                update.addClass("alert-danger").removeClass("alert-success").removeClass("alert-warning");
            },
            complete:function () {
                $("#updateModal").modal("hide");
                alertReport(update);

            }
        });
    }

});

//删除医生表单
function deleteDoc(btn){

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
        url: "/sports/team/doctor/delete",
        success: function (result) {
            console.log(result, status);//打印服务端返回的数据(调试用)

            del.children("strong").text("Delete operation success !!!");
            del.removeClass("alert-danger").addClass("alert-success");
            table.ajax.reload();//刷新DataTable

        },
        error : function() {
            del.children("strong").text("Delete operation fail !!!");
            del.addClass("alert-danger").removeClass("alert-success");
        },
        complete:function () {
            $("#deleteModal").modal("hide");
            alertReport(del);
        }
    });
}

