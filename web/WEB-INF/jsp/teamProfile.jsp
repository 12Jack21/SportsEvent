<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Johnson
  Date: 2019/5/16
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>TeamProfile</title>
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
                <!--分隔上下卡片-->
                <div style="margin-bottom: 30px"></div>

                <div class="col-lg-6 offset-lg-3">
                    <!--队伍基本信息-->
                    <div class="card shadow mb-12 ">
                        <!-- Card Header - Dropdown -->
                        <div class="card-header py-3">
                            <h2 class="m-0 font-weight-bold text-primary">Profile</h2>
                        </div>

                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-3 ">
                                    <div class="">
                                        <img src="/sports/img.action/team.jpg" alt="avatra-2"
                                             style="border-radius: 50%;width: 100%;overflow: auto;width: 100%;"/>
                                    </div>
                                </div>
                                <div class="col-lg-6 offset-md-1 offset-lg-1">
                                    <div style="margin-bottom: 4%">
                                        <!--删除style来保持样式-->
                                        <h3 style="">${team.name}</h3>
                                    </div>
                                    <div>
                                        <span class="text-lg float-left">User: </span>
                                        <p class="text-lg " style="margin-left: 22%">
                                            ${team.user}
                                        </p>
                                    </div>
                                    <div>
                                        <span class="text-lg float-left">isHost: </span>
                                        <p class="text-lg " style="margin-left: 22%">
                                            <c:choose><c:when
                                                    test="${tean.isHost == 0}">No</c:when>
                                                <c:otherwise>Yes</c:otherwise>
                                            </c:choose>
                                        </p>
                                    </div>
                                    <div>
                                        <span class="text-lg float-left">isSign: </span>
                                        <p class="text-lg text-warning" style="margin-left: 22%;">
                                            <c:choose><c:when
                                                    test="${team.isSign == 0}">未报名结束</c:when>
                                                <c:otherwise>已报名结束</c:otherwise>
                                            </c:choose>
                                        </p>
                                    </div>
                                </div>
                            </div>


                        </div>
                        <!-- /.container-fluid -->
                    </div>
                </div>
                <!-- End of Main Content -->

                <div style="margin-top: 11%;"></div>

            </div>
            <!-- End of Content Wrapper -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white ">
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
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" id="maleradio" value="male" name="gender">
                                <label class="form-check-label" for="maleradio">Male</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" id="femaleradio" value="female"
                                       name="gender">
                                <label class="form-check-label" for="femaleradio">Female</label>
                            </div>
                            <div class="form-group">
                                <label for="ageInput">Age</label>
                                <input type="number" class="form-control" id="ageInput" placeholder="age">
                            </div>
                            <div class="form-group">
                                <label for="IDinput">ID</label>
                                <input type="text" class="form-control" id="IDinput" placeholder="your id">
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
