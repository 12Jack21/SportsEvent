<%--
  Created by IntelliJ IDEA.
  User: Johnson
  Date: 2019/5/14
  Time: 9:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AdminReferee</title>
    <jsp:include page="commom_css_js.jsp"></jsp:include>
</head>
<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <jsp:include page="adminSidebar.jsp"></jsp:include>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <jsp:include page="teamTopbar.jsp"></jsp:include>

            <!-- Begin Page Content -->
            <div class="container-fluid">
                <!--update警告框-->
                <div class="alert fade show" role="alert" id="updateAlert" hidden="hidden">
                    <button type="button" class="close" aria-label="Close" onclick="hideAlert(this)">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <strong></strong>
                </div>
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h4 class="m-0 font-weight-bold text-primary">Referee DataTable</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover" id="dataTableOfAdminRef">
                                <thead>
                                <tr>
                                    <th>id</th>
                                    <th>Team</th>
                                    <th>Name</th>
                                    <th>Phone</th>
                                    <th>ID</th>
                                    <th>User</th>
                                    <th>Operation</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; Your Website 2019</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->


</div>
<!-- End of Page Wrapper -->

<script>
    var table = null;
    $(document).ready(function () {
        table = $("#dataTableOfAdminRef").DataTable({
            // "retrieve": true,
            "select": false, //开启选择
            "searching": true,
            "responsive": true,
            "ajax": {
                url: "/sports/admin/referee/list",
                dataSrc: ""
            },
            "columns": [
                {"data": "id"},
                {"data": "team.name"},
                {"data": "name"},
                {"data": "phone"},
                {"data": "refID"},
                {"data": "user"},
                {"data": null}
            ],
            "columnDefs": [{
                //隐藏第一列 id
                "targets": 0,
                "searchable": false,
                "visible": false
            }, {
                //对 refID 关闭搜索功能
                "targets": 4,
                "searchable": false
            }, {
                "targets": 6,//操作按钮目标列
                "data": null,
                "render": function (data, type, row) {
                    var id = '"' + row.id + '"';
                    var html = "<form  style='width: 250px;'><div class='form-inline'>" +
                        "<input class='form-control' style='width: 150px;' type='text'  name='user'>" +
                        "<button type='button' class='btn btn-primary' onclick='setUser(this," + data.id + ")'>设置</button>";
                    html += "</div></form>";
                    return html;
                }
            }]


        })
    });

    function setUser(btn,id) {
        var form = $(btn).parent().parent();
        var user = form.children().children("input").val();


        console.log("user:  ...");
        console.log(user);

        var update = $("#updateAlert");

        if(user.trim().length == 0){
            update.removeClass("alert-danger").removeClass("alert-success").addClass("alert-warning");
            update.children("strong").text("You haven't input user to set yet !!!");
            alertReport(update);
        }
        else {
            $.ajax({
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/sports/admin/referee/update",
                traditional: true,
                data: {
                    id:id,
                    user:user
                },
                success: function (result) {
                    console.log(result, status);//打印服务端返回的数据(调试用)

                    update.children("strong").text("Update referee user success !!!");
                    update.removeClass("alert-danger").removeClass("alert-warning").addClass("alert-success");
                    table.ajax.reload();//刷新DataTable
                },
                error: function () {
                    update.children("strong").text("Update referee user fail !!!");
                    update.addClass("alert-danger").removeClass("alert-success").removeClass("alert-warning");
                },
                complete: function () {
                    alertReport(update);
                }
            });

        }
    }
</script>


</body>

</html>
