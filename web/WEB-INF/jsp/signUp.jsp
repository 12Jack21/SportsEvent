<%--
  Created by IntelliJ IDEA.
  User: Johnson
  Date: 2019/5/13
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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

                <!--sign警告框-->
                <div class="alert fade show" role="alert" id="signAlert" hidden="hidden">
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
                            <table class="table table-bordered table-hover dataTableOfSign display" id="compDataTable" width="100%">
                                <thead>
                                <tr >
                                    <th>id</th>
                                    <th>Project</th>
                                    <th>SexGroup</th>
                                    <th>AgeGroup</th>
                                    <th>isSign</th>
                                    <th>Operation</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->



        <div class="position-fixed btn-group" style="right: 2%;bottom: 9%;transition-duration: 0.8s;z-index: 3">
            <!--TODO 上传附件,增加一个报名完成的按钮-->
            <div class="myOperate myAdd" data-toggle="modal" data-target="#uploadModal" style="z-index: 3;">
                <i class="fa fa-plus" style="margin-top: 12%;"></i>
            </div>
            <div class="myOperate myUpdate" data-toggle="modal" data-target="#finishModal">
                <i class="fa fa-wrench" style="margin-top: 10%;"></i>
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


<!--设置报名结束-->
<div class="modal fade" id="finishModal" tabindex="-1" role="dialog" aria-labelledby="finishModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="finishModalLabelTitle">Sure to finish sign ?</h5>
            </div>
            <div class="modal-body">Select "finish" below if you are ready to finish sign up .</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <button class="btn btn-danger" type="button" onclick="finishSign(this)">Finish</button>
            </div>
        </div>
    </div>
</div>

<!--Sign Modal-->
<div class="modal fade" id="signModal" tabindex="-1" role="dialog" aria-labelledby="signModalLabel"
     aria-hidden="true">
    <div class="modal-dialog " role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title text-primary" id="signModalLabelTitle">Athlete Selection</h4>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body text-lg">
                <p class="text-primary">Select no more than 5 athletes to sign this game up.</p>
                <form>
                    <div class="table-responsive align-content-center">
                        <table class="table table-bordered table-hover dataTableOfSign display" id="athDataTableOfSign" width="100%">
                            <thead>
                            <tr>
                                <th>id</th>
                                <th>Name</th>
                                <th>Gender</th>
                                <th>Age</th>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                    <hr style="height: 5%;">
                    <button type="submit" class="btn btn-lg btn-primary " id="signUpSub">Submit</button>

                    <!--select警告框-->
                    <div class="alert alert-warning fade show" role="alert" id="selectAlert" hidden="hidden">
                        <button type="button" class="close" aria-label="Close" onclick="hideAlert(this)">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <strong></strong>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<!--Upload file Modal-->
<div class="modal fade" id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="uploadModalLabel"
     aria-hidden="true">
    <div class="modal-dialog " role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-primary" id="editModalLabel">Upload file</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body text-lg">
                <form id="uploadForm" enctype="multipart/form-data" action="${pageContext.request.contextPath}/team/signUp/upload">
                    <div class="input-group">
<%--                        <div class="input-group-prepend">--%>
<%--                            <span class="input-group-text" id="inputFileGroup">Upload</span>--%>
<%--                        </div>--%>
<%--                        <div class="custom-file">--%>
<%--                            <input type="file" class="custom-file-input" id="inputFile" name="attachment">--%>
<%--                            <label class="custom-file-label" for="inputFile">Choose file</label>--%>
<%--                        </div>--%>

                        <div class="custom-file">
                            <input type="file" class="" id="inputFile" name="attachment">
                            <label class="" for="inputFile"></label>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-lg btn-primary ">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="/sports/js.action/signUp.js"></script>
</body>

</html>
