<%--
  Created by IntelliJ IDEA.
  User: Johnson
  Date: 2019/5/6
  Time: 22:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/sports/team/profile">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">TeamAdmin <sup>E</sup></div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Heading -->
    <div class="sidebar-heading">
        Member
    </div>

    <!-- Nav Item - Athlete -->
    <li class="nav-item ">
        <a class="nav-link active" href="/sports/team/athlete">
            <i class="fas fa-fw fa-airbnb"></i>
            <span>Athlete</span></a>
    </li>

    <!-- Nav Item - Referee -->
    <li class="nav-item ">
        <a class="nav-link" href="/sports/team/referee">
            <i class="fas fa-fw fa-users-cog"></i>
            <span>Referee</span></a>
    </li>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
           aria-expanded="true" aria-controls="collapseTwo">
            <i class="fas fa-fw fa-cog"></i>
            <span>Others</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Other Members</h6>
                <a class="collapse-item" href="/sports/team/captain">Captain</a>
                <a class="collapse-item" href="/sports/team/doctor">Doctor</a>
                <a class="collapse-item" href="/sports/team/coach">Coach</a>
            </div>
        </div>
    </li>


    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        Competition
    </div>

    <!-- Nav Item  -->
    <li class="nav-item ">
        <a class="nav-link" href="/sports/team/competition">
            <i class="fas fa-fw fa-users-cog"></i>
            <span>Competition</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Heading -->
    <div class="sidebar-heading">
        Sign
    </div>
    <!-- Nav Item - SignUp -->
    <li class="nav-item">
        <a class="nav-link" href="/sports/team/sign/list">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>SignUp</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</ul>
<!-- End of Sidebar -->

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
                <a class="btn btn-primary" href="/sports/login/page">Logout</a>
            </div>
        </div>
    </div>
</div>