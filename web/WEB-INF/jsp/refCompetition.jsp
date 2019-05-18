<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Johnson
  Date: 2019/5/14
  Time: 22:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>RefCompetition</title>
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

                <!--判决信息-->
                <div class="card shadow mb-12">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h3 class="m-0 font-weight-bold text-primary">Judge Competition</h3>
                    </div>

                    <div class="card-body">
                        <!--警告框-->
                        <div class="alert alert-success alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <strong>Tip!</strong> Click the competition item to score the athlete.
                        </div>
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
                                <!--比赛单元项-->
                                <section class="py-5">
                                    <c:forEach items="${majors}" var="major">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <a href="${pageContext.request.contextPath}/referee/major/${major.id}"
                                                   class="message card px-5 py-3 mb-4 bg-hover-gradient-primary no-anchor-style border-left-success ">
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
                                    <c:forEach items="${normals}" var="normal">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <a href="${pageContext.request.contextPath}/referee/normal/${normal.id}"
                                                   class="message card px-5 py-3 mb-4 bg-hover-gradient-primary no-anchor-style border-left-success ">
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
