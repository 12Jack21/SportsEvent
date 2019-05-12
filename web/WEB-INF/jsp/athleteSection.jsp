<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Johnson
  Date: 2019/5/12
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:forEach items="${athletes}" var="ath">
    <div class="row">
        <div class="col-lg-12">
            <a href="${pageContext.request.contextPath}/team/athleteInf/${ath.id}"
               class="message card px-5 py-2 mb-4 bg-hover-gradient-primary no-anchor-style border-left-primary ">
                <div class="row">
                    <div class="col-lg-4 d-flex align-items-center flex-column flex-lg-row text-center text-md-left">
                        <h5 class="mb-0 ">${ath.name}</h5>
                    </div>
                    <div class="col-lg-4 d-flex align-items-center flex-column flex-lg-row text-center text-md-left">
                        <p class=" mb-0 mt-3 mt-lg-0">
                            description
                        </p>
                    </div>
                    <div class="col-lg-2 offset-1 d-flex align-items-center flex-column flex-lg-row text-center text-md-left">
                        <div class=" bg-gray-100 roundy px-2 py-1 mr-0 mr-lg-3 mt-2 mt-lg-0 text-danger exclode athDelete">
                            Delete
                        </div>
                    </div>
                </div>
            </a>
        </div>
    </div>
</c:forEach>