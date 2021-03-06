<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Johnson
  Date: 2019/5/15
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MajorRef</title>
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
                                            ${jud.groupno}
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

                            </div>
                        </div>
                    </div>
                </div>

                <!--分隔上下卡片-->
                <div style="margin-bottom: 30px"></div>

                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h4 class="m-0 font-weight-bold text-primary">Score DataTable</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover" id="dataTableMajorRef">
                                <thead>
                                <tr>
                                    <th>athid</th>
                                    <th>Name</th>
                                    <th>No</th>
                                    <th>Score</th>
                                    <th>Operation</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${pars}" var="par">
                                    <tr>
                                        <td>${par.athlete.id}</td>
                                        <td>${par.athlete.name}</td>
                                        <td><c:choose><c:when
                                                test="${par.athlete.no == null}">未定</c:when>
                                            <c:otherwise>${par.athlete.no }</c:otherwise>
                                        </c:choose>
                                        </td>
                                        <td><c:choose><c:when
                                                test="${par.score == 0.0}">未定</c:when>
                                            <c:otherwise>${par.score}</c:otherwise>
                                        </c:choose>
                                        </td>
                                        <td>
                                            <a href="${jud.competitionVO.id}/${par.athlete.id}" class='up btn btn-default btn-xs' >
                                            <i class='fa fa-edit'></i>
                                                查看具体裁判给分
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
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

    <!--计算得出比赛成绩表，以及决赛表-->
    <div class="athleteAdd" data-toggle="modal" style="z-index: 3;" onclick="setRank()">
        <i class="fa fa-file-archive" ></i>
    </div>

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>


</body>

</html>
