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
