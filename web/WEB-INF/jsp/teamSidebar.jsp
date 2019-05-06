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
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="defaultPage/index.html">
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
        <a class="nav-link active" href="__athlete.html">
            <i class="fas fa-fw fa-airbnb"></i>
            <span>Athlete</span></a>
    </li>

    <!-- Nav Item - Referee -->
    <li class="nav-item ">
        <a class="nav-link" href="__referee.html">
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
                <a class="collapse-item" href="__captain.html">Captain</a>
                <a class="collapse-item" href="__doctor.html">Doctor</a>
                <a class="collapse-item" href="__coach.html">Coach</a>
            </div>
        </div>
    </li>

    <!-- Nav Item - Utilities Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
           aria-expanded="true" aria-controls="collapseUtilities">
            <i class="fas fa-fw fa-wrench"></i>
            <span>Utilities</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
             data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Custom Utilities:</h6>
                <a class="collapse-item" href="defaultPage/utilities-color.html">Colors</a>
                <a class="collapse-item" href="defaultPage/utilities-border.html">Borders</a>
                <a class="collapse-item" href="defaultPage/utilities-animation.html">Animations</a>
                <a class="collapse-item" href="defaultPage/utilities-other.html">Other</a>
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
        <a class="nav-link" href="__competition.html">
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
        <a class="nav-link" href="__signUp.html">
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