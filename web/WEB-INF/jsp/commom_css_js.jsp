<%--
  Created by IntelliJ IDEA.
  User: Johnson
  Date: 2019/5/6
  Time: 22:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<base href="/sports">--%>

<!--页面设置不缓存-->
<%
    response.setHeader("Pragma","No-cache");
    response.setHeader("Cache-Control","no-cache");
    response.setDateHeader("Expires", 0);
%>

<% String prefix = "/sports"; %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<!-- Custom fonts for this template-->
<link href="<%=prefix%>/vendor.action/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="<%=prefix%>/css.action/googleApi.css" rel="stylesheet">


<!-- Custom styles for this template-->
<link href="<%=prefix%>/css.action/bootstrap-admin-2.min.css" rel="stylesheet">

<link href="<%=prefix%>/css.action/style.default.css" id="theme-stylesheet">

<!--DataTable styles for this page-->
<link href="<%=prefix%>/vendor.action/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<link href="<%=prefix%>/css.action/MyCustom.css" rel="stylesheet">


<!-- Bootstrap core JavaScript-->
<script src="<%=prefix%>/vendor.action/jquery/jquery.min.js"></script>

<script src="<%=prefix%>/vendor.action/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="<%=prefix%>/vendor.action/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="<%=prefix%>/js.action/bootstrap-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="<%=prefix%>/vendor.action/datatables/jquery.dataTables.min.js"></script>
<script src="<%=prefix%>/vendor.action/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<%--<script src="<%=prefix%>/js/demo/datatables-demo.js"></script>--%>

<script src="<%=prefix%>/js.action/MyCustom.js"></script>