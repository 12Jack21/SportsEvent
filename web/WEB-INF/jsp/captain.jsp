<%--
  Created by IntelliJ IDEA.
  User: Johnson
  Date: 2019/5/10
  Time: 9:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Captain</title>
    <jsp:include page="commom_css_js.jsp"></jsp:include>
</head>
<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <jsp:include page="teamSidebar.jsp"></jsp:include>

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
                <div class="card shadow mb-12">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-2 d-flex flex-row align-items-center justify-content-between">
                        <h3 class="m-0 font-weight-bold text-primary">Information</h3>
                        <div class="dropdown no-arrow">
                            <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                 aria-labelledby="dropdownMenuLink">
                                <div class="dropdown-header">Dropdown Header:</div>
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Something else here</a>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-3 ">
                                <div class="">
                                    <img src="../img/avatar-2.jpg" alt="avatra-2"
                                         style="border-radius: 50%;overflow: auto;"/>
                                </div>
                            </div>
                            <div class="col-lg-6 offset-md-1 offset-lg-0" id="capInf">
                                <div style="margin-bottom: 4%">
                                    <h3 style="float: left;margin-right: 1%">${captain.name}</h3>
                                    <!--修改信息-->
                                    <button class="btn" data-toggle="modal"><i
                                            class="fas fa-lg fa-edit" id="editBtn"></i></button>
                                </div>
                                <div>
                                    <span class="text-lg float-left">Phone: </span>
                                    <p class="text-lg " style="margin-left: 22%">
                                        ${captain.phone}
                                    </p>
                                </div>
                                <div>
                                    <span class="text-lg float-left">ID: </span>
                                    <p class="text-lg " style="margin-left: 22%">
                                        ${captain.capID}
                                    </p>
                                </div>
                            </div>
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

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="defaultPage/login.html">Logout</a>
            </div>
        </div>
    </div>
</div>

<!--修改队长-->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel"
     aria-hidden="true">
    <div class="modal-dialog " role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-primary" id="addModalLabelTitle">New captain information</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body text-lg">
                <form id="updateCaptain" action="${pageContext.request.contextPath}/team/captain/update">
                    <input name="id" value="${captain.id}" hidden="hidden">
                    <div class="form-group">
                        <label for="nameUpdate">Name</label>
                        <input type="text" class="form-control" id="nameUpdate" placeholder="your name" name="name">
                    </div>
                    <div class="form-group">
                        <label for="phoneUpdate">Phone</label>
                        <input type="text" class="form-control" id="phoneUpdate" placeholder="phone number" name="phone">
                    </div>
                    <div class="form-group">
                        <label for="IDUpdate">ID</label>
                        <input type="text" class="form-control" id="IDUpdate" placeholder="your id" name="capID">
                    </div>
                    <button type="submit" class="btn btn-lg btn-primary ">Submit</button>
                    <hr style="height: 10%;">
                    <!--未更改表单的警告框-->
                    <div class="alert alert-warning fade show" role="alert" id="uAlert" hidden="hidden">
                        <button type="button" class="close" aria-label="Close" onclick="hideAlert(this)">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <strong>You should change some form attributes before you update.</strong>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    var updateData = null;
    $(document).ready(function () {

        $("#editBtn").click(function (e) {
            var name = $("#capInf div h3").text().trim();
            var phone = $("#capInf div:nth-child(2) p").text().trim();
            var capID = $("#capInf div:nth-child(3) p").text().trim();

            console.log(capID);

            $("#nameUpdate").val(name);
            $("#phoneUpdate").val(phone);
            $("#IDUpdate").val(capID);

            updateData = [name,phone,capID];
            $("#editModal").modal("show");
        })

    });

    $("#updateCaptain").submit(function (event) {
        event.preventDefault();
        var name = $("#nameUpdate").val();
        var phone = $("#phoneUpdate").val();
        var capID = $("#IDUpdate").val();

        console.log(updateData);
        if (updateData[0] == name && updateData[1] == phone
            && updateData[2] == capID) {
            //表单未更新
            alertReport($("#uAlert"));

        } else {
            var $form = $(this);
            var data = $form.serialize();
            console.log(data);
            var url = $form.attr("action");
            console.log(url);
            var update = $("#updateAlert");

            $.ajax({
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: url,
                traditional: true,
                data: data,
                success: function (result) {
                    console.log(result, status);//打印服务端返回的数据(调试用)

                    update.children("strong").text("Update captain success !!!");
                    update.removeClass("alert-danger").removeClass("alert-warning").addClass("alert-success");

                    //刷新队长信息
                    $("#capInf div h3").text(name);
                    $("#capInfdiv:nth-child(2) p").text(phone);
                    $("#capInf div:nth-child(3) p").text(capID);
                },
                error: function () {
                    update.children("strong").text("Update captain fail !!!");
                    update.addClass("alert-danger").removeClass("alert-success").removeClass("alert-warning");
                },
                complete: function () {
                    $("#editModal").modal("hide");
                    alertReport(update);

                }
            });
        }

    });
</script>

</body>

</html>
