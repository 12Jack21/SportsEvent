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
    <title>RefereeInf</title>
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

                <!--update警告框-->
                <div class="alert fade show" role="alert" id="updateAlert" hidden="hidden">
                    <button type="button" class="close" aria-label="Close" onclick="hideAlert(this)">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <strong></strong>
                </div>

                <!--裁判信息-->
                <div class="card shadow mb-12">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-1 d-flex flex-row align-items-center justify-content-between">
                        <h4 class="m-0 font-weight-bold text-primary">Information</h4>
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
                        <div class="row">
                            <div class="col-lg-3 ">
                                <div class="">
                                    <img src="../img/avatar-2.jpg" alt="avatra-2"
                                         style="border-radius: 50%;overflow: auto;"/>
                                </div>
                            </div>
                            <div class="col-lg-6 offset-md-1 offset-lg-0">
                                <div style="margin-bottom: 4%">
                                    <h3 style="float: left;margin-right: 1%">${referee.name}</h3>
                                    <!--修改信息-->
                                    <button class="btn" data-toggle="modal" data-target="#editModal" id="editBtn">
                                        <i class="fas fa-lg fa-edit"></i></button>
                                </div>
                                <div>
                                    <span class="text-lg float-left">Phone: </span>
                                    <p class="text-lg " style="margin-left: 22%">
                                        ${referee.phone}
                                        <i class="fas fa-lg fa-mars"></i>
                                    </p>
                                </div>
                                <div>
                                    <span class="text-lg float-left">ID: </span>
                                    <p class="text-lg " style="margin-left: 22%">
                                        ${referee.refID}
                                    </p>
                                </div>
                                <div>
                                    <span class="text-lg float-left">User: </span>
                                    <p class="text-lg " style="margin-left: 22%">
                                        ${referee.user}
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--分隔上下卡片-->
                <div style="margin-bottom: 30px"></div>

                <!--判决信息-->
                <div class="card shadow mb-12">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h3 class="m-0 font-weight-bold text-primary">Judge Competition</h3>
                        <div class="dropdown no-arrow">
                            <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink0"
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
                                    <a class="text-lg">Major Referee</a>
                                </div>
                            </div>
                            <div class="col-lg-6 text-center text-primary" id="finTab" href="#final"
                                 data-toggle="tab">
                                <div style="margin-top: 10px;margin-bottom: 10px;">
                                    <a class=" text-lg">Normal Referee</a>
                                </div>
                            </div>
                        </div>
                        <div id="myTabContent" class="tab-content ">
                            <!--面板-->
                            <div class="tab-pane fade in active borderAround2" id="initial">
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
                                        </tr>
                                        </thead>
                                        <tfoot>
                                        <tr>
                                            <th hidden="hidden">id</th>
                                            <th>Project</th>
                                            <th>SexGroup</th>
                                            <th>AgeGroup</th>
                                            <th>Type</th>
                                            <th>GroupNo</th>
                                        </tr>
                                        </tfoot>
                                        <tbody>
                                        <c:forEach items="initials" var="in">
                                            <tr>
                                                <td hidden="hidden">${in.id}</td>
                                                <td>${in.project}</td>
                                                <td>${in.sexgroup}</td>
                                                <td>${in.agegroup}</td>
                                                <td>${in.groupno}</td>
                                                <td></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                            <div class="tab-pane fade in borderAround2" id="final">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover dataTableOfRef" >
                                        <thead>
                                        <tr>
                                            <th hidden="hidden">id</th>
                                            <th>Project</th>
                                            <th>SexGroup</th>
                                            <th>AgeGroup</th>
                                            <th>Type</th>
                                            <th>GroupNo</th>
                                        </tr>
                                        </thead>
                                        <tfoot>
                                        <tr>
                                            <th hidden="hidden">id</th>
                                            <th>Project</th>
                                            <th>SexGroup</th>
                                            <th>AgeGroup</th>
                                            <th>Type</th>
                                            <th>GroupNo</th>
                                        </tr>
                                        </tfoot>
                                        <tbody>
                                        <c:forEach items="finals" var="fi">
                                            <tr>
                                                <td hidden="hidden">${fi.id}</td>
                                                <td>${fi.project}</td>
                                                <td>${fi.sexgroup}</td>
                                                <td>${fi.agegroup}</td>
                                                <td>${fi.groupno}</td>
                                                <td></td>
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


</body>

<script>


</script>
</html>
