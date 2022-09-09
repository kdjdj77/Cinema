<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>userinfo</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
            rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico"/>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet"
          type="text/css"/>
    <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet" type="text/css"/>
    <!-- Core theme CSS (includes Bootstrap)-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">


</head>

<body id="page-top">
<c:choose>
    <c:when test="${empty sessionScope.PRINCIPAL}">
        <a type="submit" href="${pageContext.request.contextPath}/user/login">Login</a>
    </c:when>
    <c:otherwise>
        <jsp:include page="/WEB-INF/views/common/header.jsp"/>
        <script>
            const conPath = "${pageContext.request.contextPath}";
        </script>
        <form name="frmDelete" action="delete" method="POST">
            <input type="hidden" name="id" value="${sessionScope.PRINCIPAL.id}">
        </form>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
            <a class="navbar-brand js-scroll-trigger" href="#page-top">
                <span class="d-block d-lg-none">${sessionScope.PRINCIPAL.username }(${sessionScope.PRINCIPAL.name })</span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
                    aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span
                    class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#about">About</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#experience">예매목록</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#education">My Q&A</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#skills">회원정보</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#interests">예매하러가기</a></li>
                </ul>
            </div>
        </nav>
        <!-- Page Content-->
        <div class="container-fluid p-0">
            <!-- About-->
            <section class="resume-section" id="about">
                <div class="resume-section-content">
                    <h1 class="mb-0">
                            ${sessionScope.PRINCIPAL.username }
                        <span class="text-primary">(${sessionScope.PRINCIPAL.name })</span>
                    </h1>
                    <div class="subheading mb-5">
                        님 안녕하세요!

                    </div>
                    <p class="lead mb-5">고객님의 등급은 ? 입니다. <a href="" TODO>등급산정 기준</a></p>
                </div>
            </section>
            <hr class="m-0"/>
            <!-- 예매목록 -->
            <section class="resume-section" id="experience">
                <div class="resume-section-content">
                    <h2 class="mb-5">예매목록</h2>
                    <div class="d-flex flex-column flex-md-row justify-content-between mb-5">
                        <div class="flex-grow-1">
                            <h3 class="mb-0">title</h3>
                            <div class="subheading mb-3">상영시간</div>
                            <p>줄거리</p>
                        </div>
                        <div class="flex-shrink-0"><span class="text-primary">평점</span></div>
                    </div>
                </div>
                <div class="mb-3 mt-3 clearfix">
                    <span class="float-start me-2">총 ${cnt }개</span>
                    <span class="float-start">page ${page }/${totalPage }</span>
                    <span class="float-end">
                <form name="frmPageRows">
                    <input type="hidden" name="page" value="${page }">
                    <select class="form-select" name="pageRows">
                        <option value="10" ${pageRows==10 ? 'selected' : '' }>10</option>
                        <option value="15" ${pageRows==15 ? 'selected' : '' }>15</option>
                        <option value="20" ${pageRows==20 ? 'selected' : '' }>20</option>
                        <option value="50" ${pageRows==50 ? 'selected' : '' }>50</option>
                    </select>
                </form>
            </span>
                </div>

                <!-- pagination -->
                <div class="container mt-1">
                    <ul class="pagination justify-content-center">
                            <%-- << 표시 여부 --%>
                        <c:if test="${page > 1 }">
                            <li class="page-item"><a class="page-link" href="${url }" title="처음"><i
                                    class='fas fa-angle-double-left'></i></a></li>
                        </c:if>

                            <%-- < 표시 여부 --%>
                        <c:if test="${startPage > 1 }">
                            <li class="page-item"><a class="page-link" href="${url }?page=${startPage - 1 }"><i
                                    class='fas fa-angle-left'></i></a></li>
                        </c:if>

                            <%-- 페이징 안의 '숫자' 표시 --%>
                        <c:if test="${totalPage > 1 }">
                            <c:forEach var="k" begin="${startPage }" end="${endPage }">
                                <c:choose>
                                    <c:when test="${k != page }">
                                        <li class="page-item"><a class="page-link" href="${url }?page=${k }">${k }</a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item active"><a class="page-link"
                                                                        href="javascript:void(0);">${k }</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </c:if>

                            <%-- > 표시 여부 --%>
                        <c:if test="${totalPage > endPage }">
                            <li class="page-item"><a class="page-link" href="${url }?page=${endPage + 1 }"><i
                                    class='fas fa-angle-right'></i></a></li>
                        </c:if>

                            <%-- >> 표시 여부 --%>
                        <c:if test="${page < totalPage }">
                            <li class="page-item"><a class="page-link" href="${url }?page=${totalPage }"><i
                                    class='fas fa-angle-double-right'></i></a></li>
                        </c:if>

                    </ul>
                </div>
                <!-- pagination -->
            </section>
            <hr class="m-0"/>

            <!-- Q&A -->
            
            <section class="resume-section" id="education">
                <div class="resume-section-content">
                    <h2 class="mb-5">My Q&A</h2>
                    <jsp:include page="myService.jsp"/>
                </div>
            </section>
            <hr class="m-0"/>

            <!-- 회원정보 -->
            <section class="resume-section" id="skills">
                <div class="resume-section-content">
                    <h2 class="mb-5">회원정보</h2>
                    <form>
                        <div class="subheading mb-3">
                            <div>
                                <label for="username">ID</label>
                                <a type="text" id="username">${sessionScope.PRINCIPAL.username}</a>
                            </div>
                            <div class="field half">
                                <label for="password">Password</label>
                                <a type="text" id="password">${sessionScope.PRINCIPAL.password}</a>
                            </div>
                            <div class="field">
                                <label for="name">Name</label>
                                <a type="text" id="name">${sessionScope.PRINCIPAL.name}</a>
                            </div>
                            <a href="modify?id=${sessionScope.PRINCIPAL.id}" class="button">회원정보 수정하기</a>
                        </div>
                    </form>
                </div>
            </section>
            <hr class="m-0"/>

            <!-- 영화예매하러가기 -->
            <section class="resume-section" id="interests">
                <div class="resume-section-content">
                    <h2 class="mb-5">예매하러가기</h2>
                    <a href="${pageContext.request.contextPath}/movie/home" class="button">예매하러가기</a>
                </div>
            </section>
            <hr class="m-0"/>
        </div>
        
        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    </c:otherwise>
</c:choose>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
</html>
