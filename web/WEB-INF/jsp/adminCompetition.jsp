<%--
  Created by IntelliJ IDEA.
  User: Johnson
  Date: 2019/5/6
  Time: 22:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>AdminCompetition</title>
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
                <!--delete警告框-->
                <div class="alert fade show" role="alert" id="deleteAlert" hidden="hidden">
                    <button type="button" class="close" aria-label="Close" onclick="hideAlert(this)">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <strong></strong>
                </div>
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h4 class="m-0 font-weight-bold text-primary">Competition DataTable</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover" id="dataTableOfAdminCompetition">
                                <thead>
                                <tr>
                                    <th>id</th>
                                    <th>Project</th>
                                    <th>SexGroup</th>
                                    <th>AgeGroup</th>
                                    <th>Place</th>
                                    <th>Date</th>
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

        <!--对比赛的操作按钮-->
        <div class="position-fixed btn-group" style="right: 2%;bottom: 9%;transition-duration: 0.8s;z-index: 3">
            <div class="myOperate myAdd" data-toggle="modal" data-target="#addModal" >
                <i class="fa fa-plus" ></i>
            </div>
            <div class="myOperate myDelete" data-toggle="modal"  id="deleteBtn">
                <i class="fa fa-trash"></i>
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

<!--添加比赛-->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel"
     aria-hidden="true">
    <div class="modal-dialog " role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-primary" id="addModalLabelTitle">New Competition Information</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body text-lg">
                <form id="addForm" action="">
                    <div class="form-group">
                        <label for="projectAdd">Project</label>
                        <input type="text" class="form-control" id="projectAdd" placeholder="your name" name="id">
                    </div>
                    <div class="form-group">
                        <label style="margin-right: 20px">SexGroup</label>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" id="maleradioAdd" value="1" name="sex">
                            <label class="form-check-label" for="maleradioAdd">Male</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" id="femaleradioAdd" value="0" name="sex">
                            <label class="form-check-label" for="femaleradioAdd">Female</label>
                        </div>
                    </div>
                    <hr class="col-lg-8">
                    <div class="form-group">
                        <label style="margin-right: 20px;display: block !important;">AgeGroup</label>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" id="ageGroup0Add" value="0"
                                   name="agegroup">
                            <label class="form-check-label" for="ageGroup0Add">7-8 year old</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" id="ageGroup1Add" value="1"
                                   name="agegroup">
                            <label class="form-check-label" for="ageGroup1Add">9-10 year old</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" id="ageGroup2Add" value="2"
                                   name="agegroup">
                            <label class="form-check-label" for="ageGroup2Add">11-12 year old</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="placeAdd">Place</label><!--TODO 选择框 select-->
                        <input type="text" class="form-control" id="placeAdd" placeholder="place to hold" name="place">
                    </div>
                    <div class="form-group">
                        <label for="dateAdd">Date</label>
                        <input type="date" class="form-control" id="dateAdd" name="date">
                    </div>
                    <button type="submit" class="btn btn-lg btn-primary ">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!--删除比赛-->
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
                <a class="btn btn-danger" onclick="deleteComp(this)">Delete</a>
            </div>
        </div>
    </div>
</div>


<!-- Bootstrap core JavaScript-->
<script src="../vendor/jquery/jquery.min.js"></script>

<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="../js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="../vendor/datatables/jquery.dataTables.min.js"></script>
<script src="../vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="../js/demo/datatables-demo.js"></script>

</body>

</html>
