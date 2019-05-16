<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Johnson
  Date: 2019/5/12
  Time: 11:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Athlete</title>
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
                        <li class="breadcrumb-item"><a href="#">Athlete List</a></li>
                        <li class="breadcrumb-item"><a href="#">Library</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Data</li>
                    </ol>
                </nav>
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

                <!-- Collapsable Card-->
                <div class="row">
                    <div class="col-lg-4">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Accordion -->
                            <a href="#collapseCard1" class="d-block card-header py-3" data-toggle="collapse"
                               role="button" aria-expanded="true" aria-controls="collapseCardExample">
                                <h6 class="m-0 font-weight-bold text-primary">7-8 year old</h6>
                            </a>
                            <!-- Card Content - Collapse -->
                            <div class="collapse show" id="collapseCard1">
                                <div class="card-body">
                                    <section class="py-5" id="section0">
                                        <c:forEach items="${athletes0}" var="par">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <a href="${pageContext.request.contextPath}/team/athleteInf/${par.id}"
                                                       class="message card px-5 py-2 mb-4 bg-hover-gradient-primary no-anchor-style border-left-primary ">
                                                        <div class="row">
                                                            <div class="col-lg-4 d-flex align-items-center flex-column flex-lg-row text-center text-md-left">
                                                                <h5 class="mb-0 ">${par.name}</h5>
                                                            </div>
                                                            <div class="col-lg-4 d-flex align-items-center flex-column flex-lg-row text-center text-md-left">
                                                                <p class=" mb-0 mt-3 mt-lg-0">
                                                                    description
                                                                </p>
                                                            </div>
                                                            <div class="col-lg-2 offset-1 d-flex align-items-center flex-column flex-lg-row text-center text-md-left">
                                                                <div class=" bg-gray-100 roundy px-2 py-1 mr-0 mr-lg-3 mt-2 mt-lg-0 text-danger exclode athDelete">
                                                                    Delete
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </section>

                                    <!--分页-->
                                    <nav aria-label="Page navigation">
                                        <div class="float-right">
                                            <ul class="pagination ">
                                                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                            </ul>

                                        </div>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Accordion -->
                            <a href="#collapseCard2" class="d-block card-header py-3" data-toggle="collapse"
                               role="button" aria-expanded="true" aria-controls="collapseCardExample">
                                <h6 class="m-0 font-weight-bold text-primary float-left ">9-10 year old</h6>
                            </a>
                            <!-- Card Content - Collapse -->
                            <div class="collapse show" id="collapseCard2">
                                <div class="card-body">
                                    <section class="py-5" id="section1">
                                        <c:forEach items="${athletes1}" var="par">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <a href="${pageContext.request.contextPath}/team/athleteInf/${par.id}"
                                                       class="message card px-5 py-2 mb-4 bg-hover-gradient-primary no-anchor-style border-left-primary ">
                                                        <div class="row">
                                                            <div class="col-lg-4 d-flex align-items-center flex-column flex-lg-row text-center text-md-left">
                                                                <h5 class="mb-0 ">${par.name}</h5>
                                                            </div>
                                                            <div class="col-lg-4 d-flex align-items-center flex-column flex-lg-row text-center text-md-left">
                                                                <p class=" mb-0 mt-3 mt-lg-0">
                                                                    description
                                                                </p>
                                                            </div>
                                                            <div class="col-lg-2 offset-1 d-flex align-items-center flex-column flex-lg-row text-center text-md-left">
                                                                <div class=" bg-gray-100 roundy px-2 py-1 mr-0 mr-lg-3 mt-2 mt-lg-0 text-danger exclode athDelete">
                                                                    Delete
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </section>

                                    <!--分页-->
                                    <nav aria-label="Page navigation">
                                        <div class="float-right">
                                            <ul class="pagination ">
                                                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                            </ul>

                                        </div>
                                    </nav>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Accordion -->
                            <a href="#collapseCard3" class="d-block card-header py-3" data-toggle="collapse"
                               role="button" aria-expanded="true" aria-controls="collapseCardExample">
                                <h6 class="m-0 font-weight-bold text-primary">11-12 year old</h6>
                            </a>

                            <!-- Card Content - Collapse -->
                            <div class="collapse show" id="collapseCard3">
                                <div class="card-body">
                                    <section class="py-5" id="section2">
                                        <c:forEach items="${athletes2}" var="par">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <a href="${pageContext.request.contextPath}/team/athleteInf/${par.id}"
                                                       class="message card px-5 py-2 mb-4 bg-hover-gradient-primary no-anchor-style border-left-primary ">
                                                        <div class="row">
                                                            <div class="col-lg-4 d-flex align-items-center flex-column flex-lg-row text-center text-md-left">
                                                                <h5 class="mb-0 ">${par.name}</h5>
                                                            </div>
                                                            <div class="col-lg-4 d-flex align-items-center flex-column flex-lg-row text-center text-md-left">
                                                                <p class=" mb-0 mt-3 mt-lg-0">
                                                                    description
                                                                </p>
                                                            </div>
                                                            <div class="col-lg-2 offset-1 d-flex align-items-center flex-column flex-lg-row text-center text-md-left">
                                                                <div class=" bg-gray-100 roundy px-2 py-1 mr-0 mr-lg-3 mt-2 mt-lg-0 text-danger exclode athDelete">
                                                                    Delete
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </section>

                                    <!--分页-->
                                    <nav aria-label="Page navigation">
                                        <div class="float-right">
                                            <ul class="pagination ">
                                                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                            </ul>

                                        </div>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>


            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!--添加运动员-->
        <div class="athleteAdd" data-toggle="modal" data-target="#addModal" >
            <i class="fa fa-plus" style="margin-top: 12%;"></i>
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

<!--Add Modal-->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel"
     aria-hidden="true">
    <div class="modal-dialog " role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-primary" id="editModalLabel">Athlete information</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body text-lg">
                <form id="addAthlete" action="${pageContext.request.contextPath}/team/athlete/add">
                    <div class="form-group">
                        <label for="nameInput">Name</label>
                        <input type="text" class="form-control" id="nameInput" placeholder="your name" name="name">
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" id="maleradio" value="1" name="sex">
                        <label class="form-check-label" for="maleradio">Male</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" id="femaleradio" value="0"
                               name="gender">
                        <label class="form-check-label" for="femaleradio">Female</label>
                    </div>
                    <div class="form-group">
                        <label for="ageInput">Age</label>
                        <input type="number" class="form-control" id="ageInput" placeholder="age" name="age">
                    </div>
                    <div class="form-group">
                        <label for="IDinput">ID</label>
                        <input type="text" class="form-control" id="IDinput" placeholder="your id" name="athID">
                    </div>

                    <button type="submit" class="btn btn-lg btn-primary ">Submit</button>

                </form>
            </div>
        </div>
    </div>
</div>

<!--删除运动员-->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabelTitle">Sure to delete?</h5>
            </div>
            <div class="modal-body">Select "Delete" below if you are ready to delete the
                <span class="text-danger" id="confirmDelete">athlete</span> you select.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <button class="btn btn-danger" type="button" onclick="deleteCoach(this)">Delete</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(".exclode").click(function (e) {
        e.stopPropagation();
        e.preventDefault();
        console.log($(this));

    })
    var clickOper = function (e) {
        e.stopPropagation();
        e.preventDefault();
        console.log($(this));
    }

    // $(document).addEventListener("click", clickOper,false);
</script>

<script src="/sports/js.action/athlete.js"></script>
</body>

</html>
