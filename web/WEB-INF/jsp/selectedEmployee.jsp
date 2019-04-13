<%--
  Created by IntelliJ IDEA.
  User: Johnson
  Date: 2019/4/11
  Time: 21:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SelectedEmployee</title>
</head>
<body>
<h2>The Selected Employee's Information:</h2>
<table align="center" border="1">
    <tr>
        <th>id</th>
        <th>first_name</th>
        <th>last_name</th>
        <th>salary</th>
        <th>departmentNo</th>
        <th>departmentName</th>
        <th>departmentLocation</th>
    </tr>
    <tr>
        <td>${employee.id}</td>
        <td>${employee.firstName}</td>
        <td>${employee.lastName}</td>
        <td>${employee.salary}</td>
        <td>${employee.dept.deptno}</td>
        <td>${employee.dept.dname}</td>
        <td>${employee.dept.loc}</td>
    </tr>
</table>
</body>
</html>
