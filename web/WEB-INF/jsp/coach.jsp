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
    <title>Coach</title>
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
                <!--select警告框-->
                <div class="alert alert-warning fade show" role="alert" id="selectAlert" hidden="hidden">
                    <button type="button" class="close" aria-label="Close" onclick="hideAlert(this)">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <strong></strong>
                </div>

                <!--add警告框-->
                <div class="alert fade show" role="alert" id="addAlert" hidden="hidden">
                    <button type="button" class="close" aria-label="Close" onclick="hideAlert(this)">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <strong></strong>
                </div>

                <!--update警告框-->
                <div class="alert fade show" role="alert" id="updateAlert" hidden="hidden">
                    <button type="button" class="close" aria-label="Close" onclick="hideAlert(this)">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <strong></strong>
                </div>

                <!--delete警告框-->
                <div class="alert fade show" role="alert" id="deleteAlert" hidden="hidden">
                    <button type="button" class="close" aria-label="Close" onclick="hideAlert(this)">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <strong></strong>
                </div>

                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h4 class="m-0 font-weight-bold text-primary">Coach DataTable</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <!--加了 width 后表格才实现了 自适应-->
                            <table class="table table-bordered table-hover active responsive no-wrap display"
                                   style="width: 100%;" id="coachDataTable" >
                                <thead>
                                <tr>
                                    <th>id</th>
                                    <th>Name</th>
                                    <th>Gender</th>
                                    <th>Phone</th>
                                    <th>ID</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>id</th>
                                    <th>Name</th>
                                    <th>Gender</th>
                                    <th>Phone</th>
                                    <th>ID</th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!--对教练的操作按钮-->
        <div class="position-fixed btn-group" style="right: 2%;bottom: 9%;transition-duration: 0.8s;z-index: 3">
            <div class="myOperate myAdd" data-toggle="modal" data-target="#addModal">
                <i class="fa fa-plus" style="margin-top: 10%;"></i>
            </div>
            <div class="myOperate myUpdate" onclick="updateBtn()">
                <i class="fa fa-wrench" style="margin-top: 10%;"></i>
            </div>
            <div class="myOperate myDelete" id="deleteBtn">
                <i class="fa fa-trash" style="margin-top: 10%;"></i>
            </div>
        </div>
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

<!--添加教练-->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel"
     aria-hidden="true">
    <div class="modal-dialog " role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-primary" id="addModalLabelTitle">New Coach information</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body text-lg">
                <form id="addCoach" action="${pageContext.request.contextPath}/team/coach/add">
                    <div class="form-group">
                        <label for="nameAdd">Name</label>
                        <input type="text" class="form-control" id="nameAdd" placeholder="your name" name="name">
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" id="maleradioAdd" value="1" name="sex">
                        <label class="form-check-label" for="maleradioAdd">Male</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" id="femaleradioAdd" value="0" name="sex">
                        <label class="form-check-label" for="femaleradioAdd">Female</label>
                    </div>
                    <div class="form-group">
                        <label for="phoneAdd">Phone</label>
                        <input type="text" class="form-control" id="phoneAdd" placeholder="phone number" name="phone">
                    </div>
                    <div class="form-group">
                        <label for="IDUpdate">ID</label>
                        <input type="text" class="form-control" id="IDAdd" placeholder="your id" name="coachID">
                    </div>
                    <button type="submit" class="btn btn-lg btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!--修改教练-->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel"
     aria-hidden="true">
    <div class="modal-dialog " role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-warning" id="editModalLabel">Update information</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body text-lg">
                <form id="updateCoach" action="${pageContext.request.contextPath}/team/coach/update">
                    <div class="form-group">
                        <input type="hidden" name="id" id="coach_idUpdate">
                    </div>
                    <div class="form-group">
                        <label for="nameUpdate">Name</label>
                        <input type="text" class="form-control" id="nameUpdate" placeholder="your name" name="name">
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" id="maleradioUpdate" value="1" name="sex">
                        <label class="form-check-label" for="maleradioUpdate">Male</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" id="femaleradioUpdate" value="0" name="sex">
                        <label class="form-check-label" for="femaleradioUpdate">Female</label>
                    </div>
                    <div class="form-group">
                        <label for="phoneUpdate">Phone</label>
                        <input type="text" class="form-control" id="phoneUpdate" placeholder="age" name="phone">
                    </div>
                    <div class="form-group">
                        <label for="IDUpdate">ID</label>
                        <input type="text" class="form-control" id="IDUpdate" placeholder="your id" name="coachID">
                    </div>
                    <button type="submit" class="btn btn-lg btn-warning ">Submit</button>

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

<!--删除教练-->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabelTitle">Sure to delete?</h5>
            </div>
            <div class="modal-body">Select "Delete" below if you are ready to delete the
                <span class="text-danger" id="confirmDelete"></span> you select.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <button class="btn btn-danger" type="button" onclick="deleteCoach(this)">Delete</button>
            </div>
        </div>
    </div>
</div>


</body>

<script src="/sports/js.action/coach.js"></script>
</html>
