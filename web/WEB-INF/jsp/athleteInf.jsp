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
    <title>AthleteInf</title>
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

                <!--运动员信息-->
                <div class="card shadow mb-12">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-1 d-flex flex-row align-items-center justify-content-between">
                        <h4 class="m-0 font-weight-bold text-primary">Information</h4>
                    </div>

                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-3 ">
                                <div class="">
                                    <img src="../img/avatar-2.jpg" alt="avatra-2"
                                         style="border-radius: 50%;overflow: auto;"/>
                                </div>
                            </div>
                            <div class="col-lg-6 offset-md-1 offset-lg-0">
                                <div style="margin-bottom: 4%">
                                    <h3 style="float: left;margin-right: 1%">${athlete.name}</h3>
                                    <!--修改信息-->
                                    <button class="btn" data-toggle="modal" data-target="#editModal"><i
                                            class="fas fa-lg fa-edit"></i></button>
                                </div>
                                <div>
                                    <span class="text-lg float-left">Gender: </span>
                                    <p class="text-lg " style="margin-left: 22%">
                                        ${athlete.sex}
                                        <i class="fas fa-lg fa-mars"></i>
                                    </p>
                                </div>
                                <div>
                                    <span class="text-lg float-left">Age: </span>
                                    <p class="text-lg " style="margin-left: 22%">
                                        ${athlete.age}
                                    </p>
                                </div>
                                <div>
                                    <span class="text-lg float-left">ID: </span>
                                    <p class="text-lg " style="margin-left: 22%">
                                        ${athlete.athID}
                                    </p>
                                </div>
                                <div>
                                    <span class="text-lg float-left">No: </span>
                                    <p class="text-lg " style="margin-left: 22%">
                                        ${athlete.no}
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--分隔上下卡片-->
                <div style="margin-bottom: 30px"></div>

                <!--参赛信息-->
                <div class="card shadow mb-12">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h3 class="m-0 font-weight-bold text-primary">Participation</h3>
                        <div class="dropdown no-arrow">
                            <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                 aria-labelledby="dropdownMenuLink">
                                <div class="dropdown-header">Dropdown Header:</div>
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Something else here</a>
                            </div>
                        </div>
                    </div>

                    <div class="card-body">
                        <!--标签导航-->
                        <div class="row justify-content-around" style="margin-left: auto;margin-right: auto">
                            <div class="col-lg-6 text-center text-primary" id="iniTab" href="#initial"
                                 data-toggle="tab">
                                <div style="margin-top: 10px;margin-bottom: 10px;">
                                    <a class="text-lg">Initial Game</a>
                                </div>
                            </div>
                            <div class="col-lg-6 text-center text-primary" id="finTab" href="#final"
                                 data-toggle="tab">
                                <div style="margin-top: 10px;margin-bottom: 10px;">
                                    <a class=" text-lg">Final Game</a>
                                </div>
                            </div>
                        </div>
                        <div id="myTabContent" class="tab-content ">
                            <!--面板-->
                            <div class="tab-pane fade in active borderAround2" id="initial">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover dataTableOfRef " id="iniTable">
                                        <thead>
                                        <tr>
                                            <th hidden="hidden">id</th>
                                            <th>Project</th>
                                            <th>SexGroup</th>
                                            <th>AgeGroup</th>
                                            <th>Type</th>
                                            <th>GroupNo</th>
                                            <th>Score</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${initials}" var="ini">
                                            <tr>
                                                <td hidden="hidden">${ini.competitionVO.id}</td>
                                                <td>${ini.competitionVO.project}</td>
                                                <td>${ini.competitionVO.sexgroup}</td>
                                                <td>${ini.competitionVO.agegroup}</td>
                                                <td>${ini.competitionVO.type}</td>
                                                <td>${ini.groupno}</td>
                                                <td>${ini.score}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="text-center">
                                        <h3 id="iniTotal"></h3>
                                    </div>
                                </div>

                            </div>
                            <div class="tab-pane fade in borderAround2" id="final">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover dataTableOfRef">
                                        <thead>
                                        <tr>
                                            <th hidden="hidden">id</th>
                                            <th>Project</th>
                                            <th>SexGroup</th>
                                            <th>AgeGroup</th>
                                            <th>Type</th>
                                            <th>GroupNo</th>
                                            <th>Score</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${finals}" var="fi">
                                            <tr>
                                                <td hidden="hidden">${fi.competitionVO.id}</td>
                                                <td>${fi.competitionVO.project}</td>
                                                <td>${fi.competitionVO.sexgroup}</td>
                                                <td>${fi.competitionVO.agegroup}</td>
                                                <td>${fi.competitionVO.type}</td>
                                                <td>${fi.groupno}</td>
                                                <td>${fi.score}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="text-center">
                                        <h3 id="fiTotal"></h3>
                                    </div>
                                </div>

                            </div>

                        </div>

                    </div>
                    <!-- /.container-fluid -->
                </div>
                <!-- End of Main Content -->

                <div class="row">
                </div>
                <!-- End of Main Content -->


            </div>
            <!-- End of Content Wrapper -->
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

        <!--TODO  Logout Modal-->
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

    </div>
</div>

<script>
    $(document).ready(function () {
        var iniTotal = 0.0;
        var fiTotal = 0.0;

        var child = $("#iniTable tbody tr td:nth-child(7)");

        for(let i=0; i<child.length;i++){
            console.log($(child[i]).text());
        }

        var inis = $("#iniTable tbody tr td:eq(6)");
        console.log(inis);
        // for(var i in $("#initial tbody tr:eq(6)") ){
        //     iniTotal += i.val();
        //     console.log($(i).val());
        //     console.log($(i).text());
        // }

    })
</script>
</body>

</html>
