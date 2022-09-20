<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
     <c:when test="${empty list || fn:length(list) == 0}">
        <script>
            alert("취소된 예매 입니다.");
            history.back();
        </script>
    </c:when>
    <c:otherwise>
        <c:set var="list" value="${list[0]}"/>
        <c:set var="fileDto" value="${filelist[0]}"/>
        <c:set var="movieDto" value="${movielist[0]}"/>
        <c:set var="userDto" value="${userlist[0]}"/>

        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href='${pageContext.request.contextPath}/css/resdetail.css' rel='stylesheet'/>
            <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
            <script type="text/javascript" src="${pageContext.request.contextPath}/js/qrcode.js"></script>
            
            <link href='${pageContext.request.contextPath}/css/resdetail2.css' rel='stylesheet'/>
            <title>영화 - ${movieDto.title}</title>

        </head>
        <body>
            <%-- 인증 헤더 --%>
        <jsp:include page="/WEB-INF/views/common/header.jsp"/>


        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6">
                        <c:choose>
                            <%-- 이미지 보여주기 --%>
                            <c:when test="${fileDto.image == true }">
                                <img src="${pageContext.request.contextPath}/upload/${fileDto.file }"
                                     class="card-img-top mb-5 mb-md-0">
                            </c:when>
                            <c:otherwise>
                                <img class="card-img-top mb-5 mb-md-0"
                                     src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg"/>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="col-md-6">
                        <div class="small mb-1">KORIN MOVIES</div>
                        <h1 class="display-5 fw-bolder">${movieDto.title }</h1>
                        <div class="fs-5 mb-5">
                            <span>좌석: ${list.seat}</span>
                        </div>
                        <p class="lead">※ 주의사항
                        <hr>
                        1. 환불 요청시 영수증 또는 영화티켓 필수로 지참하셔야 취소가 가능합니다!<br>
                        2. 입장 지연에 따른 관람 불편을 최소화하고자 본 영화는 약 10여분 후에 시작합니다.<br>
                        3. 관람 에티켓을 위한 사전입장을 부탁드립니다!
                        </p>
                        
                        <form name="frmDelete" action="delete" method="POST">
                    	<input type="hidden" name="id" value="${list.id}">
                		</form>
                        <div class="d-flex">
                            <input class="form-control text-center me-3" id="inputQuantity" type="num"
                                   value="${list.seat }"
                                   style="max-width: 5rem" readonly="readonly"/>
                            <c:if test="${fn:contains(PRINCIPAL.authorities, 'ROLE_MEMBER' ) && (PRINCIPAL.id == userDto.id)}">
                                <button class="btn btn-outline-dark" type="button" onclick="chkDelete()">
                                    <i class="bi-cart-fill me-1"></i>
                                    예매취소하기
                                </button>
                                <script>
                                function chkDelete(){
                    				let answer = confirm("삭제하시겠습니까?");
                    				if(answer){
                    					document.forms['frmDelete'].submit();
                                    }
                                }
                                </script>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">입장권</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <c:if test="${fn:contains(PRINCIPAL.authorities, 'ROLE_ADMIN' ) || (PRINCIPAL.id == userDto.id)}">
                            <input id="text" type="hidden"
                                   value="http://localhost:8080/Cinema/userinfo/resdetail?id=${list.id }">
                            <div id="qrcode" style="width:100px; height:100px; margin-top:15px;"></div>
                            <div>
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <h5>입장시 표를 보여주세요</h5>
                                    </div>
                                </div>
                            </div>

                            <script type="text/javascript">
                                var qrcode = new QRCode(document.getElementById("qrcode"), {
                                    width: 100,
                                    height: 100
                                });

                                function makeCode() {
                                    var elText = document.getElementById("text");

                                    if (!elText.value) {
                                        alert("Input a text");
                                        elText.focus();
                                        return;
                                    }

                                    qrcode.makeCode(elText.value);
                                }

                                makeCode();

                                $("#text").on("blur", function () {
                                    makeCode();
                                }).on("keydown", function (e) {
                                    if (e.keyCode == 13) {
                                        makeCode();
                                    }
                                });
                            </script>
                        </c:if>
                    </div>
                </div>

            </div>
        </section>
        <c:choose>
            <c:when test="${empty sessionScope.PRINCIPAL}">
                <script> const logged_id = 0;</script>
            </c:when>
            <c:otherwise>
                <script>logged_id = ${PRINCIPAL.id};</script>
            </c:otherwise>
        </c:choose>
        </body>

        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
        <script>
            const conPath = "${pageContext.request.contextPath}";
        </script>
        </html>
    </c:otherwise>
</c:choose>   