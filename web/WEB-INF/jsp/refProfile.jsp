<%--
  Created by IntelliJ IDEA.
  User: Johnson
  Date: 2019/5/18
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>RefProfile</title>
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

                <!--裁判信息-->
                <div class="card shadow mb-12">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h3 class="m-0 font-weight-bold text-primary">Information</h3>
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
                                    <h3 style="float: left;margin-right: 1%">${ref.name}</h3>
                                    <!--修改信息-->
                                    <button class="btn" data-toggle="modal" data-target="#editModal"><i
                                            class="fas fa-lg fa-edit"></i></button>
                                </div>
                                <div>
                                    <span class="text-lg float-left">Phone: </span>
                                    <p class="text-lg " style="margin-left: 22%">
                                        ${ref.phone}
                                    </p>
                                </div>
                                <div>
                                    <span class="text-lg float-left">ID: </span>
                                    <p class="text-lg " style="margin-left: 22%">
                                        ${ref.refID}
                                    </p>
                                </div>
                                <div>
                                    <span class="text-lg float-left">User: </span>
                                    <p class="text-lg " style="margin-left: 22%">
                                        ${ref.user}
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--分隔上下卡片-->
                <div style="margin-bottom: 20%;"></div>



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

        <!--Edit Modal-->
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel"
             aria-hidden="true">
            <div class="modal-dialog " role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title text-primary" id="editModalLabel">Update information</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body text-lg">
                        <form>
                            <div class="form-group">
                                <label for="nameInput">Name</label>
                                <input type="text" class="form-control" id="nameInput" placeholder="your new name">
                            </div>
                            <div class="form-group">
                                <label for="phoneInput">Phone</label>
                                <input type="number" class="form-control" id="phoneInput" placeholder="phone">
                            </div>
                            <div class="form-group">
                                <label for="IDinput">ID</label>
                                <input type="text" class="form-control" id="IDinput" placeholder="your ID">
                            </div>
                            <button type="submit" class="btn btn-lg btn-primary float-right">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

</body>

</html>
