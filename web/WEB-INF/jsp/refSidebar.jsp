<%--
  Created by IntelliJ IDEA.
  User: Johnson
  Date: 2019/5/16
  Time: 21:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/sports/referee/competitionList">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Referee<sup>E</sup></div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Athlete -->
    <li class="nav-item ">
        <a class="nav-link active" href="__refProfile.html">
            <i class="fas fa-fw fa-airbnb"></i>
            <span>Profile</span></a>
    </li>

    <!-- Nav Item - Referee -->
    <li class="nav-item ">
        <a class="nav-link" href="/sports/referee/competitionList">
            <i class="fas fa-fw fa-users-cog"></i>
            <span>Competition</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</ul>
<!-- End of Sidebar -->
