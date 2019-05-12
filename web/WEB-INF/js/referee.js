var table = null;

var updateData = null;
$(document).ready(function () {

    table = $("#refereeDataTable").DataTable({
        // "retrieve":true,

        "select":true, //开启选择
        "searching":true,
        "responsive":true,
        "ajax": {
            url:"referee/list", //TODO 需要改成 session
            dataSrc:""
        },
        "columns": [
            {"data":"id"},
            {"data":"name"},
            {"data":"phone"},
            {"data":"refID"},
            {"data":"user"},
            {"data":null} //Operation 列
        ],
        "columnDefs": [{
            //隐藏第一列 id
            "targets":0,
            "searchable":false,
            "visible":false
        },{
            //对 refID 关闭搜索功能
            "targets":3,
            "searchable":false
        },{
            "targets": 5,//操作按钮目标列
            "data": null,
            "select":null,
            "render": function (data, type, row) {
                var id = '"' + row.id + '"';
                var html = "<a href='/sports/team/referee/" + data.id + " ' class='delete btn btn-default btn-xs' ><i class='fa fa-file-alt'></i>查看</a>";
                html += "<a href='javascript:void(0)' class='up btn btn-default btn-xs' onclick='updateRef(this)'><i class='fa fa-edit'></i>编辑</a>";
                return html;
            }
        }]

    });

    $('#refereeDataTable tbody').on( 'click', 'td', function () {
        console.log($(this).children("a"));
        if($(this).children("a").length == 0){
            $(this).parent().toggleClass('selected');
            $(this).parent().toggleClass('table-active');
        }

    } );


    $("#deleteBtn").click(function () {
        var len = table.rows(".selected").data().length;
        var selectCount = $("#confirmDelete");
        var alert = $("#selectAlert");
        var modal = $("#deleteModal");
        if(len == 0){
            $("#selectAlert strong").text("Cannot delete: Your haven't select a referee yet !");
            alertReport(alert);

        }else if(len == 1){
            selectCount.text("referee");
            modal.modal("show");
        }else{
            selectCount.text(len + " referees");
            modal.modal("show");
        }

    });

});

//编辑裁判按钮链接
function updateRef(alink) { //TODO 解决hover问题

    var tr = $(alink).parent().parent();
    console.log(tr);

    var data = table.rows(tr).data()[0];
    console.log(data);

    $("#updateModal").modal("show");

    //更新表单 的数据填充
    $("#ref_idUpdate").val(data.id);
    $("#nameUpdate").val(data.name);
    $("#phoneUpdate").val(data.phone);
    $("#IDUpdate").val(data.refID);

    updateData = [data.name,data.phone,data.refID];
}

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

//添加裁判表单
$("#addReferee").submit(function (event) {
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

            add.children("strong").text("Add referee success !!!");
            add.removeClass("alert-danger").addClass("alert-success");
            table.ajax.reload();//刷新DataTable
            $form[0].reset();
        },
        error : function() {
            add.children("strong").text("Add referee fail !!!");
            add.removeClass("alert-danger").addClass("alert-success");
        },
        complete:function () {
            $("#addModal").modal("hide");
            alertReport(add);
        }
    });
})

//更新裁判表单
$("#updateReferee").submit(function (event) {
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

                update.children("strong").text("Update referee success !!!");
                update.removeClass("alert-danger").removeClass("alert-warning").addClass("alert-success");
                table.ajax.reload();//刷新DataTable
            },
            error : function() {
                update.children("strong").text("Update referee fail !!!");
                update.addClass("alert-danger").removeClass("alert-success").removeClass("alert-warning");
            },
            complete:function () {
                $("#updateModal").modal("hide");
                alertReport(update);

            }
        });
    }

});

//删除裁判
function deleteReferee(btn){

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
        traditional:true,////这里设置为true,使传递参数变成 data: 1
        url: "/sports/team/referee/delete",
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

