<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Johnson
  Date: 2019/5/12
  Time: 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CompetitionInf</title>
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
                    <!-- Card Header - Dropdown -->
                    <a href="#collapseCard1" class="d-block card-header py-3" data-toggle="collapse"
                       role="button" aria-expanded="true" aria-controls="collapseCardExample">
                        <h4 class="m-0 font-weight-bold text-primary">Information</h4>
                    </a>

                    <div class="collapse show" id="collapseCard1">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-3 ">
                                    <div class="">
                                        <img src="../img/avatar-2.jpg" alt="avatra-2"
                                             style="border-radius: 50%;overflow: auto;"/>
                                    </div>
                                </div>
                                <div class="col-lg-6 offset-md-1 offset-lg-0">
                                    <div>
                                        <span class="text-lg float-left">Project: </span>
                                        <p class="text-lg " style="margin-left: 22%">
                                            ${competition.project}
                                        </p>
                                    </div>
                                    <div>
                                        <span class="text-lg float-left">SexGroup: </span>
                                        <p class="text-lg " style="margin-left: 22%">
                                            ${competition.sexgroup}
                                                <c:choose><c:when
                                                        test="${competition.sexgroup == \"男\"}">
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
                                            ${competition.agegroup}
                                        </p>
                                    </div>
                                    <div>
                                        <span class="text-lg float-left">Place: </span>
                                        <p class="text-lg " style="margin-left: 22%">
                                            <c:choose><c:when
                                                    test="${competiton.place == null}">未定</c:when>
                                                <c:otherwise>${competition.place}</c:otherwise>
                                            </c:choose>
                                        </p>
                                    </div>
                                    <div>
                                        <span class="text-lg float-left">Date: </span>
                                        <p class="text-lg " style="margin-left: 22%">
                                            <c:choose><c:when
                                                    test="${competition.place == null}">未定</c:when>
                                                <c:otherwise>${competition.place}</c:otherwise>
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

                <!--比赛参与人员的 DataTable-->
                <div class="row">
                    <div class="col-lg-8">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Accordion -->
                            <a href="#collapseCard2" class="d-block card-header py-3" data-toggle="collapse"
                               role="button" aria-expanded="true" aria-controls="collapseCardExample">
                                <h6 class="m-0 font-weight-bold text-primary">Athlete</h6>
                            </a>
                            <!-- Card Content - Collapse -->
                            <div class="collapse show" id="collapseCard2">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-hover dataTableOfRef">
                                            <thead>
                                            <tr>
                                                <th>GroupNo</th>
                                                <th>Name</th>
                                                <th>Age</th>
                                                <th>No</th>
                                                <th>Team</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${participates}" var="par">
                                                <tr>
                                                    <td><c:choose><c:when
                                                            test="${par.groupno == 0}">未分组</c:when>
                                                        <c:otherwise>${par.groupno}</c:otherwise>
                                                    </c:choose></td>
                                                    <td>${par.athlete.name}</td>
                                                    <td>${par.athlete.age}</td>
                                                    <td>${par.athlete.no}</td>
                                                    <td>${par.athlete.team.name}</td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Accordion -->
                            <a href="#collapseCard3" class="d-block card-header py-3" data-toggle="collapse"
                               role="button" aria-expanded="true" aria-controls="collapseCardExample">
                                <h6 class="m-0 font-weight-bold text-primary">Referee</h6>
                            </a>
                            <!-- Card Content - Collapse -->
                            <div class="collapse show" id="collapseCard3">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-hover dataTableOfRef">
                                            <thead>
                                            <tr>
                                                <th>GroupNo</th>
                                                <th>Name</th>
                                                <th>Type</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${judges}" var="jud">
                                                <tr>
                                                    <td><c:choose><c:when
                                                            test="${jud.groupno == 0}">未分组</c:when>
                                                        <c:otherwise>${jud.groupno}</c:otherwise>
                                                    </c:choose>
                                                    </td>
                                                    <td>${jud.referee.name}</td>
                                                    <td><c:choose><c:when
                                                            test="${jud.reftype == 0}">普通裁判</c:when>
                                                        <c:otherwise>主裁判</c:otherwise>
                                                    </c:choose></td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>


                </div>


                <!--比赛结束判断-->
                <c:if test="${competition.isEnd == \"是\"}">
                    <!--排名表-->
                    <div class="row">
                        <!--运动员排名-->
                        <div class="col-lg-8">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Accordion -->
                                <a href="#collapseCard4" class="d-block card-header py-3" data-toggle="collapse"
                                   role="button" aria-expanded="true" aria-controls="collapseCardExample">
                                    <h6 class="m-0 font-weight-bold text-primary">Athlete Rank</h6>
                                </a>
                                <!-- Card Content - Collapse -->
                                <div class="collapse show" id="collapseCard4">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered table-hover dataTableOfRef">
                                                <thead>
                                                <tr>
                                                    <th hidden="hidden">ath_id</th>
                                                    <th>Rank</th>
                                                    <th>Name</th>
                                                    <th>Score</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${athRanks}" var="r">
                                                    <tr>
                                                        <td hidden="hidden">${r.id}</td>
                                                        <td>${r.rank}</td>
                                                        <td>${r.name}</td>
                                                        <td>${r.score}</td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--队伍排名-->
                        <div class="col-lg-4">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Accordion -->
                                <a href="#collapseCard5" class="d-block card-header py-3" data-toggle="collapse"
                                   role="button" aria-expanded="true" aria-controls="collapseCardExample">
                                    <h6 class="m-0 font-weight-bold text-primary">Team Rank</h6>
                                </a>
                                <!-- Card Content - Collapse -->
                                <div class="collapse show" id="collapseCard5">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered table-hover dataTableOfRef">
                                                <thead>
                                                <tr>
                                                    <th hidden="hidden">team_id</th>
                                                    <th>Rank</th>
                                                    <th>Name</th>
                                                    <th>Score</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${teamRanks}" var="r">
                                                    <tr>
                                                        <td hidden="hidden">${r.id}</td>
                                                        <td>${r.rank}</td>
                                                        <td>${r.name}</td>
                                                        <td>${r.score}</td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </c:if>
                <!-- End of Main Content -->


            </div>
            <!-- End of Content Wrapper -->
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
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

    </div>
</div>

</body>

</html>
