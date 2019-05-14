var table = null;

var updateData = null;
$(document).ready(function () {

    table = $("#teamTable").DataTable({
        "retrieve":true,
        "select":true, //开启选择
        "searching":true,
        "responsive":true,
        "ajax": {
            url:"/sports/admin/team/list",
            dataSrc:""
        },
        "columns": [
            {"data":"id"},
            {"data":"name"},
            {"data":"user"},
            {"data":"password"},
            {"data":"isSign"},
            {"data":"isHost"}
        ],
        "columnDefs": [{
            //隐藏第一列 id
            "targets":0,
            "searchable":false,
            "visible":false
        },{
            "targets":1,
            //TODO 根据 isHost 设置不同颜色
            "createdCell": function (td, cellData, rowData, row, col) {
                if (cellData == "1") {
                    $(td).addClass('host');
                }
            }
        },{
            //对 password 关闭搜索功能
            "targets":3,
            "searchable":false
        },{
            //隐藏第六列 isHost
            "targets":5,
            "searchable":false,
            "visible":false,

            // "className":function (data, row, type) {
            //     if(data.isHost == 1)
            //         return "host";
            //     else
            //         return "";
            // }
        },]
    });

    $('#teamTable tbody').on( 'click', 'tr', function () {
        $(this).toggleClass('selected');
        $(this).toggleClass('table-active');
    } );

    $("#deleteBtn").click(function () {
        var len = table.rows(".selected").data().length;
        var selectCount = $("#confirmDelete");
        var alert = $("#selectAlert");
        var modal = $("#deleteModal");
        if(len == 0){
            $("#selectAlert strong").text("Cannot delete: Your haven't select a team yet !");
            alertReport(alert);

        }else if(len == 1){
            selectCount.text("team");
            modal.modal("show");
        }else{
            selectCount.text(len + " teams");
            modal.modal("show");
        }

    });

    refreshHost();

});

//添加教练表单
$("#addTeam").submit(function (event) {
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
            console.log("form data flow: ");
            console.log($form.serialize());

            add.children("strong").text("Add team success !!!");
            add.removeClass("alert-danger").addClass("alert-success");
            table.ajax.reload();//刷新DataTable
            $form[0].reset();
        },
        error : function() {
            add.children("strong").text("Add team fail !!!");
            add.removeClass("alert-danger").addClass("alert-success");
        },
        complete:function () {
            $("#addModal").modal("hide");
            alertReport(add);
        }
    });
});

//更新按钮 判断
function updateBtn(){
    var update = $("#updateAlert");
    var coach = table.rows(".selected").data();
    if(coach.length == 0){
        update.removeClass("alert-danger").removeClass("alert-success").addClass("alert-warning");
        update.children("strong").text("You haven't selected a team to update yet !!!");
        alertReport(update);
    }else if(coach.length > 1){
        update.removeClass("alert-danger").removeClass("alert-success").addClass("alert-warning");
        update.children("strong").text("You have selected more than one team to update !!!");
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

        //用于比较是否更改了表单
        updateData = [coach[0].name,coach[0].phone,$("#maleradioUpdate").prop("checked"),coach[0].coachID];
    }
}
//设置主办方按钮 判断
function setHost(){
    var update = $("#updateAlert");
    var team = table.rows(".selected").data();
    if(team.length == 0){
        update.removeClass("alert-danger").removeClass("alert-success").addClass("alert-warning");
        update.children("strong").text("You haven't selected a team to be the host yet !!!");
        alertReport(update);
    }else if(team.length > 1){
        update.removeClass("alert-danger").removeClass("alert-success").addClass("alert-warning");
        update.children("strong").text("You have selected more than one team to be the host !!!");
        alertReport(update);
    }else if(team.length == 1){
        $.ajax({
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/sports/admin/team/host/" + team[0].id,
            success: function (result) {
                console.log(result, status);//打印服务端返回的数据(调试用)

                update.children("strong").text("Set team host success !!!");
                update.removeClass("alert-danger").removeClass("alert-warning").addClass("alert-success");
                table.ajax.reload();
            },
            error : function() {
                update.children("strong").text("Set team host fail !!!");
                update.addClass("alert-danger").removeClass("alert-success").removeClass("alert-warning");
            },
            complete:function () {
                $("#updateModal").modal("hide");
                alertReport(update);

            }
        });
    }
}

//更新教练表单
$("#updateTeam").submit(function (event) {
    event.preventDefault();
    console.log(updateData);
    console.log($("#nameUpdate").val());
    console.log($("#phoneUpdate").val());
    console.log($("#maleradioUpdate").prop("checked"));
    console.log($("#IDUpdate").val());

    if(updateData[0] == $("#nameUpdate").val() && updateData[1] == $("#phoneUpdate").val()
        && updateData[2] == $("#maleradioUpdate").prop("checked") && updateData[3] == $("#IDUpdate").val()){
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

                update.children("strong").text("Update team success !!!");
                update.removeClass("alert-danger").removeClass("alert-warning").addClass("alert-success");
                table.ajax.reload();//刷新DataTable
            },
            error : function() {
                update.children("strong").text("Update team fail !!!");
                update.addClass("alert-danger").removeClass("alert-success").removeClass("alert-warning");
            },
            complete:function () {
                $("#updateModal").modal("hide");
                alertReport(update);

            }
        });
    }

});
/*TODO 没有刷新成功*/
function refreshHost() {
    var tr = $(".host").parent();
    console.log(tr);
    console.log(table.rows(0).data()[0]);
    tr.addClass("bg-success").addClass("text-white");
}

//删除教练
function deleteTeam(btn){

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
        url: "/sports/admin/team/delete",
        success: function (result) {
            console.log(result, status);//打印服务端返回的数据(调试用)

            del.children("strong").text("Delete operation success !!!");
            del.removeClass("alert-danger").addClass("alert-success");
            table.ajax.reload();//刷新DataTable

            refreshHost();
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

