<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Johnson
  Date: 2019/4/10
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Show Employee's Information</title>
</head>
<body>
<table align="center" border="1" aria-colspan="4">
    <tr>
        <th>id</th>
        <th>first_name</th>
        <th>last_name</th>
        <th>salary</th>
        <th>departmentNo</th>
        <th>departmentName</th>
        <th>departmentLocation</th>

    </tr>
    <c:forEach var="row" items="${employees}">
        <tr>
            <td>${row.id}</td>
            <td>${row.firstName}</td>
            <td>${row.lastName}</td>
            <td>${row.salary}</td>
            <td>${row.dept.deptno}</td>
            <td>${row.dept.dname}</td>
            <td>${row.dept.loc}</td>
        </tr>
    </c:forEach>

</table>

<br>
<form action="${pageContext.request.contextPath}/selectEmployee" method="post">
    Input the id of the employee <input type="number" value="1" name="id">
    <input type="submit" value="Submit">
</form>

<br><br>

<form action="${pageContext.request.contextPath}/insertEmployee" method="post">
    firstName <input type="text" name="firstName" value="Mi"><br>
    lastName <input type="text" name="lastName" value="Xiao"><br>
    salary <input type="number" name="salary" value="1111"><br>
    deptno <input type="number" name="dept.deptno" value="20"><br>

    <input type="submit" value="Submit">
</form>


</body>
</html>
