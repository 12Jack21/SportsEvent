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
    <title>Referee</title>
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
                <!--面包屑导航-->
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="__athlete.html">Athlete List</a></li>
                        <li class="breadcrumb-item"><a href="#">Library</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Data</li>
                    </ol>
                </nav>

                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h4 class="m-0 font-weight-bold text-primary">Referee DataTable</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover display"
                                   id="refereeDataTable" style="width: 100%;">
                                <thead>
                                <tr>
                                    <th>id</th>
                                    <th>Name</th>
                                    <th>Phone</th>
                                    <th>ID</th>
                                    <th>User</th>
                                    <th>Operation</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>id</th>
                                    <th>Name</th>
                                    <th>Phone</th>
                                    <th>ID</th>
                                    <th>User</th>
                                    <th>Operation</th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>

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


            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->
        
        <!--对裁判的操作按钮-->
        <div class="position-fixed btn-group" id="operateBtn"
             style="right: 2%;bottom: 9%;transition-duration: 0.8s;z-index: 3">
            <div class="myOperate myAdd" data-toggle="modal" data-target="#addModal">
                <i class="fa fa-plus" style="margin-top: 10%;"></i>
            </div>
            <div class="myOperate myDelete" id="deleteBtn">
                <i class="fa fa-trash" style="margin-top: 10%;"></i>
            </div>
        </div>
        
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

<!--添加裁判-->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel"
     aria-hidden="true">
    <div class="modal-dialog " role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-primary" id="addModalLabelTitle">New Referee information</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body text-lg">
                <form id="addReferee" action="${pageContext.request.contextPath}/team/referee/add">
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
                        <input type="text" class="form-control" id="IDAdd" placeholder="your ID" name="refID">
                    </div>
                    <button type="submit" class="btn btn-lg btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!--修改裁判-->
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
                <form id="updateReferee" action="${pageContext.request.contextPath}/team/referee/update">
                    <div class="form-group">
                        <input type="hidden" name="id" id="ref_idUpdate">
                    </div>
                    <div class="form-group">
                        <label for="nameUpdate">Name</label>
                        <input type="text" class="form-control" id="nameUpdate" placeholder="your name" name="name">
                    </div>
                    <div class="form-group">
                        <label for="phoneUpdate">Phone</label>
                        <input type="text" class="form-control" id="phoneUpdate" placeholder="age" name="phone">
                    </div>
                    <div class="form-group">
                        <label for="IDUpdate">ID</label>
                        <input type="text" class="form-control" id="IDUpdate" placeholder="your id" name="refID">
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

<!--删除裁判-->
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
                <button class="btn btn-danger" type="button" onclick="deleteReferee(this)">Delete</button>
            </div>
        </div>
    </div>
</div>


</body>

<script src="/sports/js/referee.js"></script>
</html>
