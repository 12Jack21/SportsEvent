<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Johnson
  Date: 2019/5/12
  Time: 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Competition</title>
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
                        <li class="breadcrumb-item"><a href="__athlete.html">Competition List</a></li>
                        <li class="breadcrumb-item"><a href="#">Library</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Data</li>
                    </ol>
                </nav>

                <!--分隔上下卡片-->
                <div style="margin-bottom: 30px"></div>

                <!--参赛信息-->
                <div class="card shadow mb-12">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h3 class="m-0 font-weight-bold text-primary">Competition Information</h3>
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
                                <!--比赛单元项-->
                                <section class="py-5">
                                    <c:forEach items="${initials}" var="major">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <a href="${pageContext.request.contextPath}/team/competition/${major.id}"
                                                   class="message card px-5 py-3 mb-4 bg-hover-gradient-primary no-anchor-style border-left-primary ">
                                                    <div class="row">
                                                        <div class="col-lg-4 d-flex align-items-center flex-column flex-lg-row text-center text-md-left">
                                                            <span hidden="hidden">${major.id}</span>
                                                            <h6 class="mb-0 ">${major.sexgroup} ${major.agegroup} ${major.project}</h6>
                                                        </div>
                                                        <div class="col-lg-8 d-flex align-items-center flex-column flex-lg-row text-center text-md-left">
                                                            <div class=" bg-gray-100 roundy px-4 py-1 mr-0 mr-lg-3 mt-2 mt-lg-0 text-dark exclode">
                                                                initial
                                                            </div>
                                                            <p class=" mb-0 mt-3 mt-lg-0">
                                                                地点：
                                                                <c:choose><c:when
                                                                        test="${major.place == null}">未定</c:when>
                                                                    <c:otherwise>${major.place}</c:otherwise>
                                                                </c:choose>
                                                                , 时间：
                                                                <c:choose><c:when
                                                                        test="${major.date == null}">未定</c:when>
                                                                    <c:otherwise>${major.date}</c:otherwise>
                                                                </c:choose>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>

                                    </c:forEach>
                                </section>
                            </div>
                            <div class="tab-pane fade in borderAround2" id="final">
                                <section class="py-5">
                                    <c:forEach items="${finals}" var="normal">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <a href="${pageContext.request.contextPath}/team/competition/${normal.id}"
                                                   class="message card px-5 py-3 mb-4 bg-hover-gradient-primary no-anchor-style border-left-primary ">
                                                    <div class="row">
                                                        <div class="col-lg-4 d-flex align-items-center flex-column flex-lg-row text-center text-md-left">
                                                            <span hidden="hidden">${normal.id}</span>
                                                            <h6 class="mb-0 ">${normal.sexgroup} ${normal.agegroup} ${normal.project}</h6>
                                                        </div>
                                                        <div class="col-lg-8 d-flex align-items-center flex-column flex-lg-row text-center text-md-left">
                                                            <div class=" bg-gray-100 roundy px-4 py-1 mr-0 mr-lg-3 mt-2 mt-lg-0 text-dark exclode">
                                                                initial
                                                            </div>
                                                            <p class=" mb-0 mt-3 mt-lg-0">
                                                                地点：
                                                                <c:choose><c:when
                                                                        test="${normal.place == null}">未定</c:when>
                                                                    <c:otherwise>${normal.place}</c:otherwise>
                                                                </c:choose>
                                                                , 时间：
                                                                <c:choose><c:when
                                                                        test="${normal.date == null}">未定</c:when>
                                                                    <c:otherwise>${normal.date}</c:otherwise>
                                                                </c:choose>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>

                                    </c:forEach>
                                </section>
                            </div>

                        </div>
                    </div>
                    <!-- /.container-fluid -->
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

    </div>

</div>

</body>

</html>
