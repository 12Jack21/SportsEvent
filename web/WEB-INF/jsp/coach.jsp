<%--
  Created by IntelliJ IDEA.
  User: Johnson
  Date: 2019/5/6
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Coach</title>
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
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h4 class="m-0 font-weight-bold text-primary">Coach DataTable</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover" id="dataTable">
                                <thead>
                                <tr>
                                    <th>id</th>
                                    <th>Name</th>
                                    <th>Gender</th>
                                    <th>Phone</th>
                                    <th>ID</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>id</th>
                                    <th>Name</th>
                                    <th>Gender</th>
                                    <th>Phone</th>
                                    <th>ID</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>Edinburgh</td>
                                    <td>61</td>
                                    <td>2011/04/25</td>
                                    <td>$320,800</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Tokyo</td>
                                    <td>63</td>
                                    <td>2011/07/25</td>
                                    <td>$170,750</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>San Francisco</td>
                                    <td>66</td>
                                    <td>2009/01/12</td>
                                    <td>$86,000</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Edinburgh</td>
                                    <td>22</td>
                                    <td>2012/03/29</td>
                                    <td>$433,060</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Tokyo</td>
                                    <td>33</td>
                                    <td>2008/11/28</td>
                                    <td>$162,700</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>New York</td>
                                    <td>61</td>
                                    <td>2012/12/02</td>
                                    <td>$372,000</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>San Francisco</td>
                                    <td>59</td>
                                    <td>2012/08/06</td>
                                    <td>$137,500</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Tokyo</td>
                                    <td>55</td>
                                    <td>2010/10/14</td>
                                    <td>$327,900</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>San Francisco</td>
                                    <td>59</td>
                                    <td>2012/08/06</td>
                                    <td>$137,500</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>Tokyo</td>
                                    <td>55</td>
                                    <td>2010/10/14</td>
                                    <td>$327,900</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>San Francisco</td>
                                    <td>59</td>
                                    <td>2012/08/06</td>
                                    <td>$137,500</td>
                                </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!--对教练的操作按钮-->
        <div class="position-fixed btn-group" style="right: 2%;bottom: 9%;transition-duration: 0.8s;z-index: 3">
            <div class="myOperate myAdd" data-toggle="modal" data-target="#addModal" >
                <i class="fa fa-plus" ></i>
            </div>
            <div class="myOperate myUpdate" data-toggle="modal" data-target="#updateModal" >
                <i class="fa fa-wrench" ></i>
            </div>
            <div class="myOperate myDelete" data-toggle="modal" data-target="#deleteModal" >
                <i class="fa fa-trash"></i>
            </div>
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

<!--添加教练-->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel"
     aria-hidden="true">
    <div class="modal-dialog " role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-primary" id="addModalLabelTitle">New Coach information</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body text-lg">
                <form>
                    <div class="form-group">
                        <label for="nameAdd">Name</label>
                        <input type="text" class="form-control" id="nameAdd" placeholder="your name">
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" id="maleradioAdd" value="male" name="gender">
                        <label class="form-check-label" for="maleradioAdd">Male</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" id="femaleradioAdd" value="female"
                               name="gender">
                        <label class="form-check-label" for="femaleradioAdd">Female</label>
                    </div>
                    <div class="form-group">
                        <label for="phoneAdd">Phone</label>
                        <input type="text" class="form-control" id="phoneAdd" placeholder="phone number">
                    </div>
                    <div class="form-group">
                        <label for="IDUpdate">ID</label>
                        <input type="text" class="form-control" id="IDAdd" placeholder="your id">
                    </div>
                    <button type="submit" class="btn btn-lg btn-primary ">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!--修改教练-->
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
                <form>
                    <div class="form-group">
                        <label for="nameUpdate">Name</label>
                        <input type="text" class="form-control" id="nameUpdate" placeholder="your name">
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" id="maleradioUpdate" value="male" name="gender">
                        <label class="form-check-label" for="maleradioUpdate">Male</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" id="femaleradioUpdate" value="female"
                               name="gender">
                        <label class="form-check-label" for="femaleradioUpdate">Female</label>
                    </div>
                    <div class="form-group">
                        <label for="phoneUpdate">Phone</label>
                        <input type="text" class="form-control" id="phoneUpdate" placeholder="age">
                    </div>
                    <div class="form-group">
                        <label for="IDUpdate">ID</label>
                        <input type="text" class="form-control" id="IDUpdate" placeholder="your id">
                    </div>
                    <button type="submit" class="btn btn-lg btn-warning ">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!--删除教练-->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabelTitle">Sure to delete?</h5>
            </div>
            <div class="modal-body">Select "Delete" below if you are ready to delete the coaches you select.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-danger" href="defaultPage/login.html">Delete</a>
            </div>
        </div>
    </div>
</div>


</body>

</html>
