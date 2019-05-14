<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Johnson
  Date: 2019/5/13
  Time: 22:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AdminGroup</title>
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

                <!--比赛信息-->
                <div class="card shadow mb-12">
                    <!-- Card Header - Dropdown -->
                    <a href="#collapseCard0" class="d-block card-header py-2" data-toggle="collapse"
                       role="button" aria-expanded="true" aria-controls="collapseCardExample">
                        <h5 class="m-0 font-weight-bold text-primary">Information</h5>
                    </a>

                    <div class="collapse " id="collapseCard0">
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
                                        <span class="text-lg float-left">Project: &nbsp;</span>
                                        <p class="text-lg " style="margin-left: 22%">
                                            ${competition.project}
                                        </p>
                                    </div>
                                    <div>
                                        <span class="text-lg float-left">SexGroup: &nbsp;</span>
                                        <p class="text-lg " style="margin-left: 22%">
                                            ${competition.sexgroup}
                                        </p>
                                    </div>
                                    <div>
                                        <span class="text-lg float-left">AgeGroup: &nbsp;</span>
                                        <p class="text-lg " style="margin-left: 22%">
                                            ${competition.agegroup}
                                        </p>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div>
                                        <span class="text-lg float-left">Place: &nbsp;</span>
                                        <p class="text-lg " style="margin-left: 22%">
                                            <c:choose><c:when
                                                    test="${competition.place == null}">未定</c:when>
                                                <c:otherwise>${competition.place}</c:otherwise>
                                            </c:choose>
                                        </p>
                                    </div>
                                    <div>
                                        <span class="text-lg float-left">Date: &nbsp;</span>
                                        <p class="text-lg " style="margin-left: 22%">
                                            <c:choose><c:when
                                                    test="${competition.date == null}">未定</c:when>
                                                <c:otherwise>${competition.date}</c:otherwise>
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

                <!--比赛参与人员的 DataTable-->
                <div class="row">
                    <div class="col-lg-8">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Accordion -->
                            <div class="card-header">

                                <div class="row">
                                    <div class="col-lg-2 position-relative">
                                        <h3 class="font-weight-bold text-primary" style="position: absolute;top: 26%;">
                                            Athlete
                                        </h3>
                                    </div>
                                    <div class="col-lg-4">
                                        <!--添加分组的 按钮-->
                                        <div class="position-relative">
                                            <div class="newAdd groupAdd" data-toggle="modal"
                                                 onclick="setAthGroup()"
                                                 style="">
                                                <i class="fa fa-2x fa-plus myPlus" style="left: 5%;"></i>
                                                <div class="btnContent">
                                                    Add Group
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!-- Group Athlete -->
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover dataTableDefault display" id="groupAthTable" width="100%">
                                        <thead>
                                        <tr>
                                            <th>athid</th>
                                            <th>GroupNo</th>
                                            <th>Name</th>
                                            <th>Age</th>
                                            <th>No</th>
                                            <th>Team</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Accordion -->
                            <div class="card-header">
                                <div class="row">
                                    <div class="col-lg-4 position-relative">

                                        <h3 class="font-weight-bold text-primary" style="position: absolute;top: 26%;">
                                            Referee</h3>
                                    </div>
                                    <div class="col-lg-4">
                                        <!--添加分组的 按钮-->
                                        <div class="position-relative">
                                            <div class="newAdd groupAdd" data-toggle="modal"
                                                 onclick="setRefGroup()"
                                                 style="">
                                                <i class="fa fa-2x fa-plus myPlus" style="left: 5%;"></i>
                                                <div class="btnContent">
                                                    Add Referee
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Card Content - Collapse -->
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover dataTableDefault display" id="groupRefTable" width="100%">
                                        <thead>
                                        <tr>
                                            <th>refid</th>
                                            <th>GroupNo</th>
                                            <th>Name</th>
                                            <th>Type</th>
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

                <!-- End of Main Content -->


            </div>
            <!-- End of Content Wrapper -->
            <div id="comp_id" hidden="hidden">${competition.id}</div>
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
                        <h5 class="modal-title" id="logoutModalLabel">Ready to Leave?</h5>
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

        <!--设置比赛分组-->
        <div class="modal fade" id="addAthleteModal" tabindex="-1" role="dialog" aria-labelledby="addGroupModalLabel"
             aria-hidden="true">
            <div class="modal-dialog " role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title text-primary" id="addGroupModalLabelTitle">Group Selection</h4>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body text-lg">
                        <p class="text-gray-700">当前组别： &nbsp;<span class="text-primary" id="groupNoSpan">${maxGroupNo}</span></p>
                        <p class="text-primary">Please select 8 person to set a group.</p>
                        <form>
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover dataTableOfSign display"
                                       id="athDataTableOfGroup" width="100%">
                                    <thead>
                                    <tr>
                                        <th>ath_id</th>
                                        <th>Name</th>
                                        <th>No</th>
                                        <th>Team</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                            <button type="button" class="btn btn-lg btn-primary " id="athGroupConfirm">Confirm</button>
                            <!--select警告框-->
                            <div class="alert alert-warning fade show" role="alert" id="selectAlertAth" hidden="hidden">
                                <button type="button" class="close" aria-label="Close" onclick="hideAlert(this)">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <strong>You should select 8 athletes to be a group if there are more than 8 athletes left.</strong>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--为每一组设置 主裁判和 普通裁判-->
        <div class="modal fade" id="addRefereeModal" tabindex="-1" role="dialog" aria-labelledby="addRefereeModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title text-primary" id="addRefereeModalLabelTitle">Referee Selection</h4>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body text-lg">
                        <div class="row">
                            <div class="col-lg-6">
                                <p class="text-primary">One major referee</p>
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover dataTableOfSign display"
                                           id="majorRefDataTableOfGroup" width="100%">
                                        <thead>
                                        <tr>
                                            <th>id</th>
                                            <th>Name</th>
                                            <th>Team</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                            <div class="col-lg-6">
                                <p class="text-primary">Several normal referees</p>
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover dataTableOfSign display"
                                           id="normalRefDataTableOfGroup" width="100%">
                                        <thead>
                                        <tr>
                                            <th>id</th>
                                            <th>Name</th>
                                            <th>Team</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <button type="button" class="btn btn-lg btn-primary " id="refGroupConfirm">Submit</button>
                        <!--select警告框-->
                        <div class="alert alert-warning fade show" role="alert" id="selectAlertRef" hidden="hidden">
                            <button type="button" class="close" aria-label="Close" onclick="hideAlert(this)">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <strong>You should select a major referee and several referees, a referee cannot selected in two side.</strong>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="/sports/js/adminGroup.js"></script>
</body>

</html>
