<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
    <c:when test="${empty list || fn:length(list) == 0}">
        <script>
            alert("해당 영화가 삭제되거나 없습니다");
            history.back();
        </script>
    </c:when>
    <c:otherwise>
        >
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
            <link href='${pageContext.request.contextPath}/css/bootstrap.css' rel='stylesheet'/>

            <link href='${pageContext.request.contextPath}/css/rotating-card.css' rel='stylesheet'/>

            <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport'/>


            <title>예매 목록</title>


        </head>

        <body>
            <%-- 인증 헤더 --%>
        <jsp:include page="/WEB-INF/views/common/header.jsp"/>
        <section>
        <br>
        <br>
        <br>
        <br>
        <br>
            <div class="container">

                <div class="row">
                    
                        <div class="col-sm-10 col-sm-offset-1" >
                        <c:forEach var="list" items="${list}">
                            <div class="col-md-4 col-sm-6" onclick="resdetail?id=${list.id}">                              
                                <div class="card-container" >
                                    <div class="card">
                                        <div class="front">
                                            <div class="content">
                                                <div class="main">
                                                    <h3 class="name">${list.movie.title }</h3>
                                                    <p class="profession">${list.regDate }</p>
                                                    <p class="text-center">KORIN MOVIES</p>
                                                    <p class="text-center">좌석: ${list.seat }</p>
                                                </div>
                                                <div class="footer">
                                                    <i class="fa fa-mail-forward"></i> 반대편이 보고싶다면?
                                                </div>
                                            </div>
                                        </div> <!-- end front panel -->
                                        <div class="back">
                                            <div class="header">
                                                <h5 class="motto">${list.movie.title }</h5>
                                            </div>
                                            <div class="content">
                                                <div class="main">
                                                    <h4 class="text-center">${list.movie.director }</h4>
                                                    <p class="text-center">${list.movie.actor }</p>

                                                    <div class="stats-container">
                                                        
                                                            <h4>
                                                            <a href="resdetail?id=${list.id}">
                                                            클릭시 상세정보를 볼 수 있어요!
                                                            </a>
                                                            </h4> 
                                                    </div>

                                                </div>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                        </div>


                </div> <!-- end row -->
                <div class="space-200">

                </div>


            </div>
        </section>

        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>


        </body>
        </html>

    </c:otherwise>
</c:choose>