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
    <title>NormalRef</title>
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
<%--                <!--面包屑导航-->--%>
<%--                <nav aria-label="breadcrumb">--%>
<%--                    <ol class="breadcrumb">--%>
<%--                        <li class="breadcrumb-item"><a href="__athlete.html">Athlete List</a></li>--%>
<%--                        <li class="breadcrumb-item"><a href="#">Library</a></li>--%>
<%--                        <li class="breadcrumb-item active" aria-current="page">Data</li>--%>
<%--                    </ol>--%>
<%--                </nav>--%>

                <!--比赛信息-->
                <div class="card shadow mb-12">
                    <!-- Card Header - Accordion -->
                    <a href="#collapseCard" class="d-block card-header py-3" data-toggle="collapse"
                       role="button" aria-expanded="true" aria-controls="collapseCardExample">
                        <h5 class="m-0 font-weight-bold text-primary">Competition Information</h5>
                    </a>
                    <!-- Card Content - Collapse -->
                    <div class="collapse show" id="collapseCard">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-3 ">
                                    <div class="">
                                        <img src="../img/avatar-2.jpg" alt="avatra-2"
                                             style="border-radius: 50%;overflow: auto;"/>
                                    </div>
                                </div>
                                <div class="col-lg-3 offset-md-1 offset-lg-0">
                                    <div>
                                        <span class="text-lg float-left">Project: </span>
                                        <p class="text-lg " style="margin-left: 22%">
                                            ${jud.competitionVO.project}
                                        </p>
                                    </div>
                                    <div>
                                        <span class="text-lg float-left">SexGroup: </span>
                                        <p class="text-lg " style="margin-left: 22%">
                                            ${jud.competitionVO.sexgroup}
                                                <c:choose><c:when
                                                        test="${jud.competitionVO.sexgroup == \"男\"}">
                                                    <i class="fas fa-lg fa-mars"></i>
                                                </c:when>
                                                    <c:otherwise><i class="fas fa-lg fa-female"></i>
                                                    </c:otherwise>
                                                </c:choose>
                                        </p>
                                    </div>
                                    <div>
                                        <span class="text-lg float-left">AgeGroup: </span>
                                        <p class="text-lg " style="margin-left: 22%">
                                            ${jud.competitionVO.agegroup}
                                        </p>
                                    </div>
                                </div>
                                <div class="col-lg-3 offset-md-1 offset-lg-0">
                                    <div>
                                        <span class="text-lg float-left">GroupNo: </span>
                                        <p class="text-lg " style="margin-left: 22%">
                                            <c:choose><c:when
                                                    test="${jud.groupno == 0}">未定</c:when>
                                                <c:otherwise>${jud.groupno}</c:otherwise>
                                            </c:choose>
                                        </p>
                                    </div>
                                    <div>
                                        <span class="text-lg float-left">Place: </span>
                                        <p class="text-lg " style="margin-left: 22%">
                                            <c:choose><c:when
                                                    test="${jud.competitionVO.place == null}">未定</c:when>
                                                <c:otherwise>${jud.competitionVO.place}</c:otherwise>
                                            </c:choose>
                                        </p>
                                    </div>
                                    <div>
                                        <span class="text-lg float-left">Date: </span>
                                        <p class="text-lg " style="margin-left: 22%">
                                            <c:choose><c:when
                                                    test="${jud.competitionVO.date == null}">未定</c:when>
                                                <c:otherwise>${jud.competitionVO.date}</c:otherwise>
                                            </c:choose>
                                        </p>
                                    </div>
                                </div>
                                <div id="jud_id" hidden="hidden">${jud.id}</div>
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
                            <table class="table table-bordered table-hover display" id="dataTableNormalRef" width="100%">
                                <thead>
                                <tr>
                                    <th>athid</th>
                                    <th>Name</th>
                                    <th>No</th>
                                    <th>Score</th>
                                    <th>isValid</th>
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
                    <table class="table table-bordered table-hover dataTableOfSign display" id="scoreLogTable" width="100%">
                        <thead>
                        <tr>
                            <th>_id</th>
                            <th>Score</th>
                            <th>isValid</th>
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


<script src="/sports/js.action/normalRef.js"></script>
</body>

</html>
