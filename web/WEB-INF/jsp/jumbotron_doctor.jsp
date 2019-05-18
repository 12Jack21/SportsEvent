<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Johnson
  Date: 2019/5/6
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String prefix = "/sports"; %>

<html>
<head>
    <title>Jumbotron_doctor</title>
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
                <!--add警告框-->
                <div class="alert fade show" role="alert" id="addAlert" hidden="hidden">
                    <button type="button" class="close" aria-label="Close" onclick="hideAlert(this)">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <strong></strong>
                </div>

                <div class="jumbotron" >
                    <div class="container" style="margin-top: 5%;margin-bottom: 5%;transition-duration: 0.8s;">
                        <h1>There is no ${role} here, please add a new ${role}</h1>
                        <div class="position-relative">
                            <div class="newAdd " data-toggle="modal" data-target="#addModal" >
                                <i class="fa fa-3x fa-plus myPlus"></i>
                                <div class="btnContent">
                                    Add
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
                    <span>Copyright &copy; My Manage Website 2019</span>
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

<!--添加医生-->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel"
     aria-hidden="true">
    <div class="modal-dialog " role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-primary" id="addModalLabelTitle">New doctor information</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body text-lg">
                <form id="addDoc" action="${pageContext.request.contextPath}/team/doctor">
                    <div class="form-group">
                        <label for="nameAdd">Name</label>
                        <input type="text" class="form-control" id="nameAdd" placeholder="your name" name="name">
                    </div>
                    <div class="form-group">
                        <label for="phoneAdd">Phone</label>
                        <input type="text" class="form-control" id="phoneAdd" placeholder="phone number" name="phone">
                    </div>
                    <div class="form-group">
                        <label for="IDAdd">ID</label>
                        <input type="text" class="form-control" id="IDAdd" placeholder="your id" name="docID">
                    </div>

                    <button type="submit" class="btn btn-lg btn-primary" >Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>

</body>

<script>
    $(document).ready(function () {

        $("#addDoc").submit(function (e) {
            e.preventDefault();
            var $form = $(this);
            var url = "/sports/team/doctor/add";
            $.ajax({
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: url,
                data: $form.serialize(),
                success: function (result) {
                    console.log(result, status);//打印服务端返回的数据(调试用)
                    if(result == true){
                        alert("Add success!");
                        window.location.href = $form.attr("action");
                    }
                },
                error: function () {
                    alert("Add fail !!!");
                },
            });

            return false;
        })

    });

</script>
</html>
