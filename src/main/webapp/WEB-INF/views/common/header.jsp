<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>

<head>
    <title>NavBar</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/51772bd9bd.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark" style="position: fixed; top:0; width:100%">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/movie/home">LogO(test)</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mynavbar">
            <ul class="navbar-nav me-auto">
              
                <li class="nav-item" TODO="">
                    <a class="nav-link" href="${pageContext.request.contextPath}/movie/home">영화</a>
                </li>

           
                <li class="nav-item" TODO="">
                    <a class="nav-link" href="${pageContext.request.contextPath}/service/list">문의</a>
                </li>
                
            
                <li class="nav-item" TODO="">
                    <a class="nav-link" href="${pageContext.request.contextPath}/map">오시는길</a>
                </li>
            </ul>

            <c:choose>
                <c:when test="${empty sessionScope.PRINCIPAL }">
                    <!-- 로그인 안했을때는 로그인 form 보여주기 -->
                    <button style="background-color: #D3D3D3"><a type="submit"
                       href="${pageContext.request.contextPath}/user/login">Login</a></button>
                </c:when>
                <c:otherwise>
                    <!-- 로그인 했을때는 username 과 로그아웃 form 보여주기 -->
                    <form action="${pageContext.request.contextPath}/user/logout" method="POST" TODO="">
                        <!--TODO : 로그아웃후 다시 돌아오기 -->
                        <span class="d-flex">
			                <span class="text-light p-2"><span
                                    TODO="">${sessionScope.PRINCIPAL.username }(${sessionScope.PRINCIPAL.name })</span>
                                     님 환영합니다&nbsp;<a href="${pageContext.request.contextPath}/userinfo" style="color:white"><i class="fa-solid fa-gears"></i></a></span>
			                <span><button style="background-color: #D3D3D3" type="submit">Logout</button></span>
			            </span>
                    </form>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>

</body>

</html>