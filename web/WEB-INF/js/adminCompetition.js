var table = null;

$(document).ready(function () {

    table = $("#dataTableOfAdminCompetition").DataTable({
        // "retrieve": true,
        "select": true, //开启选择
        "searching": true,
        "responsive": true,
        "ajax": {
            url: "competition/list",
            dataSrc: ""
        },
        "columns": [
            {"data": "id"},
            {"data": "project"},
            {"data": "sexgroup"},
            {"data": "agegroup"},
            {"data": "place"},
            {"data": "date"},
            {"data": null}
        ],
        "columnDefs": [{
            //隐藏第一列 id
            "targets": 0,
            "searchable": false,
            "visible": false
        },{
            // 定义操作列,######以下是重点########
            "targets": 6,//操作按钮目标列
            "data": null,
            "render": function (data, type, row) {
                var id = '"' + row.id + '"';
                var html = "<a href='/sports/admin/group/ " + data.id + " '>" +
                    "<button type='submit' class='btn btn-primary'>设置分组</button></a>";
                return html;
            }
        }]

    });

    $('#dataTableOfAdminCompetition tbody').on('click', 'tr', function () {
        $(this).toggleClass('selected');
        $(this).toggleClass('table-active');
    });

    $("#deleteBtn").click(function () {
        var len = table.rows(".selected").data().length;
        var selectCount = $("#confirmDelete");
        var alert = $("#selectAlert");
        var modal = $("#deleteModal");
        if (len == 0) {
            $("#selectAlert strong").text("Cannot delete: Your haven't select a competition yet !");
            alertReport(alert);

        } else if (len == 1) {
            selectCount.text("competition");
            modal.modal("show");
        } else {
            selectCount.text(len + " competitions");
            modal.modal("show");
        }

    })

});


//添加比赛表单
$("#addForm").submit(function (event) {
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

            add.children("strong").text("Add competition success !!!");
            add.removeClass("alert-danger").addClass("alert-success");
            table.ajax.reload();//刷新DataTable
            $form[0].reset();
        },
        error: function () {
            add.children("strong").text("Add competition fail !!!");
            add.removeClass("alert-success").addClass("alert-danger");
        },
        complete: function () {
            $("#addModal").modal("hide");
            alertReport(add);
        }
    });
});

function updateBtnComp(){
    var update = $("#updateAlert");
    var comp = table.rows(".selected").data();
    if(comp.length == 0){
        update.removeClass("alert-danger").removeClass("alert-success").addClass("alert-warning");
        update.children("strong").text("You haven't selected a competition to update yet !!!");
        alertReport(update);
    }else if(comp.length > 1){
        update.removeClass("alert-danger").removeClass("alert-success").addClass("alert-warning");
        update.children("strong").text("You have selected more than one competition to update !!!");
        alertReport(update);
    }else if(comp.length == 1){
        $("#updateModal").modal("show");

        //填充表单数据
        $("#placeUpdate").val(comp[0].place);
        $("#dateUpdate").val(comp[0].date);

        $("#updateId").val(comp[0].id);

        // //用于比较是否更改了表单
        // updateData = [comp[0].name,comp[0].phone,$("#maleradioUpdate").prop("checked"),comp[0].coachID];
    }
}

//更新比赛表单
$("#updateForm").submit(function (event) {
    event.preventDefault();
    var $form = $(this);
    var update = $("#updateAlert");

    $.ajax({
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        url: $form.attr("action"),
        data: $form.serialize(),
        success: function (result) {
            console.log(result, status,"...");//打印服务端返回的数据(调试用)

            if(result == true){
                update.children("strong").text("Update competition success !!!");
                update.removeClass("alert-danger").removeClass("alert-warning").addClass("alert-success");
                table.ajax.reload();//刷新DataTable
                $form[0].reset();
            }else{
                update.children("strong").text("Update competition fail !!!");
                update.removeClass("alert-success").removeClass("alert-warning").addClass("alert-danger");
            }

        },
        error: function () {
            update.children("strong").text("Update competition fail !!!");
            update.removeClass("alert-success").removeClass("alert-warning").addClass("alert-danger");
        },
        complete: function () {
            $("#updateModal").modal("hide");
            alertReport(update);
        }
    });
});

//删除比赛
function deleteComp(btn) {

    var selection = table.rows(".selected").data();
    console.log(selection);
    var deleteIds = [];
    for (var i = 0; i < selection.length; i++) {
        deleteIds.push(selection[i].id);
    }
    var del = $("#deleteAlert");
    var url = "/delete";
    $.ajax({
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        data: {
            data: deleteIds
        },
        traditional: true,////这里设置为true,使传递参数变成 data:1
        url: "/sports/team/coach/delete",
        success: function (result) {
            console.log(result, status);//打印服务端返回的数据(调试用)

            del.children("strong").text("Delete operation success !!!");
            del.removeClass("alert-danger").addClass("alert-success");
            table.ajax.reload();//刷新DataTable


        },
        error: function () {
            del.children("strong").text("Delete operation fail !!!");
            del.addClass("alert-danger").removeClass("alert-success");
        },
        complete: function () {
            $("#deleteModal").modal("hide");
            alertReport(del);
        }
    });
}
