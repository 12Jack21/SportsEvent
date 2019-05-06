// Call the dataTables jQuery plugin
$(document).ready(function () {
    $('.dataTableDefault').DataTable();
    $("#dataTable").DataTable();

    $('#dataTableRef').DataTable({
        "columnDefs": [{
            // 定义操作列,######以下是重点########
            "targets": 5,//操作按钮目标列
            "data": null,
            "render": function (data, type, row) {
                var id = '"' + row.id + '"';
                var html = "<a href='javascript:void(0);'  class='delete btn btn-default btn-xs'  ><i class='fa fa-file-alt'></i> 查看</a>";
                html += "<a href='javascript:void(0);' class='up btn btn-default btn-xs'><i class='fa fa-edit'></i> 编辑</a>";
                // html += "<a href='javascript:void(0);'   onclick='deleteThisRowPapser(" + id + ")'  class='down btn btn-default btn-xs'><i class='fa fa-trash'></i> 删除</a>"
                return html;
            }
        }]
    });
    $('#dataTableOfSign').DataTable({
        "columnDefs": [{
            // 定义操作列,######以下是重点########
            "targets": 5,//操作按钮目标列
            "data": null,
            "render": function (data, type, row) {
                var id = '"' + row.id + '"';
                var html = "<a href='javascript:void(0);' class='delete btn btn-default btn-xs' data-toggle='modal' data-target='#signModal'>" +
                    "<i class='fa fa-file-alt'></i> 报名</a>";
                return html;
            }
        }]
    });

    $('#dataTableNormalRef').DataTable({
        "columnDefs": [{
            // 定义操作列,######以下是重点########
            "targets": 5,//操作按钮目标列
            "data": null,
            "render": function (data, type, row) {
                var id = '"' + row.id + '"';
                var html = "<form  style='width: 300px;'><div class='form-inline'><input class='form-control' style='width: 100px;' type='number' step='0.01' name='score' id='athScore'>" +
                    "<button type='submit' class='btn btn-primary'>给分</button>";
                html += "<a href='javascript:void(0);' class='up btn btn-default btn-xs'  data-toggle='modal' data-target='#scoreModal'>" +
                    "<i class='fa fa-edit'></i> 查看记录</a>";
                html += "</div></form>";
                return html;
            }
        }]
    });

    $('#dataTableMajorRef').DataTable({
        "columnDefs": [{
            // 定义操作列,######以下是重点########
            "targets": 3,//操作按钮目标列
            "data": null,
            "render": function (data, type, row) {
                var id = '"' + row.id + '"';
                var html = "<a href='__majorConfirm.html' class='up btn btn-default btn-xs' >" +
                    "<i class='fa fa-edit'></i> 查看给分</a>";
                return html;
            }
        }]
    });

    $('#dataTableMajorConfirm').DataTable({
        "columnDefs": [{
            // 定义操作列,######以下是重点########
            "targets": 4,//操作按钮目标列
            "data": null,
            "render": function (data, type, row) {
                var id = '"' + row.id + '"';
                var html = "<a href='javascript:void(0);' class='up btn btn-default btn-xs text-success' >" +
                    "<i class='fa fa-edit'></i> Accept</a>";
                html += "<a href='javascript:void(0);' class='up btn btn-default btn-xs text-danger'>" +
                    "<i class='fa fa-edit'></i> Reject</a>";
                html += "<a href='javascript:void(0);' class='up btn btn-default btn-xs'  data-toggle='modal' data-target='#scoreModal'>" +
                    "<i class='fa fa-edit'></i> 查看记录</a>";
                return html;
            }
        }]
    });

    //管理员界面的裁判表
    $('#dataTableOfAdminRef').DataTable({
        "columnDefs": [{
            // 定义操作列,######以下是重点########
            "targets": 6,//操作按钮目标列
            "data": null,
            "render": function (data, type, row) {
                var id = '"' + row.id + '"';
                var html = "<form  style='width: 250px;'><div class='form-inline'><input class='form-control' style='width: 150px;' type='text' step='0.01' name='user' id='refUser'>" +
                    "<button type='submit' class='btn btn-primary'>设置</button>";
                html += "</div></form>";
                return html;
            }
        }]
    });

    //管理员界面的比赛表
    $('#dataTableOfAdminCompetition').DataTable({
        "columnDefs": [{
            // 定义操作列,######以下是重点########
            "targets": 6,//操作按钮目标列
            "data": null,
            "render": function (data, type, row) {
                var id = '"' + row.id + '"';
                var html = "<a href='__adminGroup.html'><button type='submit' class='btn btn-primary'>设置分组</button></a>";
                return html;
            }
        }]
    });

});
