<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Johnson
  Date: 2019/5/14
  Time: 22:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MajorConfirm</title>
    <jsp:include page="commom_css_js.jsp"></jsp:include>
</head>
<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <jsp:include page="refSidebar.jsp"></jsp:include>

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

                <!--运动员信息-->
                <div class="card shadow mb-12">
                    <!-- Card Header - Accordion -->
                    <a href="#collapseCard" class="d-block card-header py-3" data-toggle="collapse"
                       role="button" aria-expanded="true" aria-controls="collapseCardExample">
                        <h5 class="m-0 font-weight-bold text-primary">Athlete Information</h5>
                    </a>
                    <!-- Card Content - Collapse -->
                    <div class="collapse show" id="collapseCard">
                        <div class="card-body">
                            <div id="athid" hidden="hidden">${ath_id}</div>
                            <div id="compid" hidden="hidden">${compid}</div>
                            <div class="row">
                                <div class="col-lg-3 offset-md-1 offset-lg-2">
                                    <div>
                                        <span class="text-lg float-left">Name: </span>
                                        <p class="text-lg " style="margin-left: 22%">
                                            ${par.athlete.name}
                                        </p>
                                    </div>

                                </div>
                                <div  class="col-lg-3 ">
                                    <div>
                                        <span class="text-lg float-left">No: </span>
                                        <p class="text-lg " style="margin-left: 22%">
                                            <c:choose><c:when
                                                    test="${par.athlete.no == null}">未定</c:when>
                                                <c:otherwise>${par.athlete.no}</c:otherwise>
                                            </c:choose>
                                        </p>
                                    </div>
                                </div>
                                <div  class="col-lg-3 ">
                                    <div>
                                        <span class="text-lg float-left">Score: &nbsp;</span>
                                        <p class="text-lg " style="margin-left: 22%" id="finalScore">
                                            <c:choose><c:when
                                                    test="${par.score == 0.0}">未定</c:when>
                                                <c:otherwise>${par.score}</c:otherwise>
                                            </c:choose>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--分隔上下卡片-->
                <div style="margin-bottom: 30px"></div>

                <!--给分警告框-->
                <div class="alert fade show" role="alert" id="scoreAlert" hidden="hidden">
                    <button type="button" class="close" aria-label="Close" onclick="hideAlert(this)">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <strong></strong>
                </div>
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h4 class="m-0 font-weight-bold text-primary">Score DataTable</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover display" id="dataTableMajorConfirm" width="100%">
                                <thead>
                                <tr>
                                    <th>tempScore_id</th>
                                    <th>refid</th>
                                    <th>RefName</th>
                                    <th>Score</th>
                                    <th>State</th>
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

    <!--计算最终成绩-->
    <div class="athleteAdd" data-toggle="modal" style="z-index: 3;" onclick="setFinalScore()">
        <i class="fa fa-file-archive" ></i>
    </div>

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

<!--确定并计算运动员最终给分 Modal-->
<div class="modal fade" id="figureModal" tabindex="-1" role="dialog" aria-labelledby="figureModalLabel"
     aria-hidden="true">
    <div class="modal-dialog " role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-primary" id="figureModalLabel">Athlete information</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body text-lg">
                <form id="finalForm">
                    <div class="form-group">
                        <label for="Pinput">P point</label>
                        <input type="number" class="form-control" id="Pinput" placeholder="D point"
                               min="0.0" max="10.0" step="0.1" onchange="changePoint()" oninput="changePoint()">
                    </div>
                    <div class="form-group">
                        <label for="Dinput">D point</label>
                        <input type="number" class="form-control" id="Dinput" placeholder="P point"
                               min="0" max="10" step="0.1"  oninput="changePoint()">
                    </div>
                    <div class="form-group">
                        <label >Average Score:</label>
                        <label id="averageScoreLabel">0.0</label>
                    </div>
                    <div class="form-group">
                        <label >Final Score:</label>
                        <label id="finalScoreLabel"></label> <!--TODO 动态计算最终成绩 -->
                    </div>
                    <button type="button" class="btn btn-lg btn-primary " onclick="figureOut()">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!--给分记录-->
<div class="modal fade" id="scoreModal" tabindex="-1" role="dialog" aria-labelledby="scoreModalLabel"
     aria-hidden="true">
    <div class="modal-dialog " role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title text-primary" id="scoreModalLabelTitle">Score Log</h4>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body text-lg">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover dataTableOfSign display" id="logTable" width="100%">
                        <thead>
                        <tr>
                            <th>_id</th>
                            <th>Score</th>
                            <th>State</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="/sports/js.action/majorConfirm.js"></script>
</body>

</html>
