<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
    <c:when test="${empty sessionScope.PRINCIPAL}">
        <script>
            alert("로그인 후에 이용해주세요!");
            history.back();
        </script>
    </c:when>
    <c:otherwise>
        <%-- <%-- <c:set var="dto" value="${list[0]}"/> --%> --%>


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
            <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet"
                  type="text/css"/>
            <!-- Core theme CSS (includes Bootstrap)-->
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

        </head>

        <body id="page-top">

        <jsp:include page="/WEB-INF/views/common/header.jsp"/>
        <script>
            const conPath = "${pageContext.request.contextPath}";
        </script>
        <form name="frmDelete" action="delete" method="POST">
            <input type="hidden" name="id" value="${sessionScope.PRINCIPAL.id}">
        </form>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary padding-top:70px;" id="sideNav">

            <a class="navbar-brand js-scroll-trigger" href="#page-top">
                <span class="d-block d-lg-none">${ sessionScope.PRINCIPAL.username  }(${ sessionScope.PRINCIPAL.name  })</span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
                    aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span
                    class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#about">About</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#reserve">예매목록</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#service">My Q&A</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#modify">회원정보</a></li>
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
                    <c:set var="dto" value="${list}"/>
                    <p class="lead mb-5">고객님의 등급은
                        <c:if test="${dto.viewCnt eq 0}">
                            <a class="bronze">브론즈</a>
                        </c:if>
                        <c:if test="${dto.viewCnt gt 0 && dto.viewCnt lt 5}">
                            <a class="silver">실버</a>
                        </c:if>
                        <c:if test="${dto.viewCnt ge 5 && dto.viewCnt lt 25}">
                            <a class="gold">골드</a>
                        </c:if>
                        <c:if test="${dto.viewCnt ge 25 && dto.viewCnt lt 40}">
                            <a class="platinum">플래티넘</a>
                        </c:if>
                        <c:if test="${dto.viewCnt ge 40}">
                            <a class="diamond">다이아몬드</a>
                        </c:if>
                        (${dto.viewCnt })입니다.

                    </p>
                    <button type='button' id="modal_btn">등급정보
                    </button>
                </div>
            </section>
        </div>
        <hr class="m-0"/>

        <!-- 예매목록 -->
        <section class="resume-section" id="reserve">
            <div class="resume-section-content">
                <a href="reserve">전체보기</a>
                <h2 class="mb-5">예매목록</h2>

                <jsp:include page="recentMyReserve.jsp"/>
                <article class="button">
                	<button onClick="loadPreviousMyReserve(${sessionScope.PRINCIPAL.id})" class="ico_arrow1">
                		이전보기
                	</button>
                	<button onClick="loadNextMyReserve(${sessionScope.PRINCIPAL.id})" class="ico_arrow">
                		다음보기
                	</button>
                </article>
            </div>
        </section>
        <hr class="m-0"/>

        <!-- Q&A -->

        <section class="resume-section" id="service">
            <div class="resume-section-content">
                <h2 class="mb-5">My Q&A</h2>
                <jsp:include page="myService.jsp"/>
                <article class="button">
                	<button onClick="loadPreviousMyService(${sessionScope.PRINCIPAL.id})" class="ico_arrow1">
                		이전보기
                	</button>
                	<button onClick="loadNextMyService(${sessionScope.PRINCIPAL.id})" class="ico_arrow">
                		다음보기
                	</button>
                </article>
            </div>
        </section>
        <hr class="m-0"/>

        <!-- 회원정보 -->
        <section class="resume-section" id="modify">
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
                        <a href="modify" class="button">회원정보 수정하기</a>
                    </div>
                </form>
            </div>
        </section>
        <hr class="m-0"/>


        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/scripts.js"></script>

        </body>
        <div>
            <div class="black_bg" style="margin-top:50px;"></div>
            <div class="modal_wrap">
                <div class="modal_close">
                    <a href="#">close</a>
                </div>
                <div>
                    <table class="table table-dark table-striped">
                        <thead>
                        <tr>
                            <th>시청횟수</th>
                            <th>등급</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>브론즈</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td>실버</td>
                            <td>1 ~ 4</td>
                        </tr>
                        <tr>
                            <td>골드</td>
                            <td>5 ~ 24</td>
                        </tr>
                        <tr>
                            <td>플래티넘</td>
                            <td>25 ~ 39</td>
                        </tr>
                        <tr>
                            <td>다이아몬드</td>
                            <td>40 ~</td>
                        </tr>
                        </tbody>

                    </table>
                </div>
            </div>
        </div>
        </html>

    </c:otherwise>
</c:choose>
