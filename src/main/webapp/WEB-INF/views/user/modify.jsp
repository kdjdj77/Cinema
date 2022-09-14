<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:choose>
    <c:when test="${empty sessionScope.PRINCIPAL}">
        <script>
            alert("해당 회원정보를 조회할 수없습니다");
            history.back();
        </script>
    </c:when>
    <c:otherwise>
        <!DOCTYPE html>
        <html>
        <head>
            <meta charset="utf-8">
            <title>modify</title>
            <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
            <!-- Font-->
            <link rel="stylesheet" type="text/css" href="../css/roboto-font.css">
            <link rel="stylesheet" type="text/css" href="../fonts/font-awesome-5/css/fontawesome-all.min.css">
            <!-- Main Style Css -->
            <link rel="stylesheet" href="../css/modifystyle.css"/>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>

        </head>
        <body class="form-v5">
        <div class="page-content">
            <div class="form-v5-content">
                <h2>User modify - ${sessionScope.PRINCIPAL.name} 님</h2>
                <form id="updateForm" class="form-detail" action="modify" method="POST">
                	<input type="hidden" name="id" value="${sessionScope.PRINCIPAL.id}"/>
                    <div class="form-row">
                        <label for="username">Your ID</label>
                        <input type="text" name="username" id="username" class="input-text"
                               value="${sessionScope.PRINCIPAL.username }" readonly>
                    </div>
                    <div class="form-row">
                        <label for="name">Your Name</label>
                        <input type="text" name="name" id="name" class="input-text"
                               value="${sessionScope.PRINCIPAL.name }" required>
                        <div class="illegible-message hide msg">한글만 입력해주세요</div>
                        <div class="readable-message hide msg success">한글만 입력되었습니다!</div>
                    </div>
                    <div class="form-row">
                        <label for="password">Password</label>
                        <input type="password" name="password" id="password" class="input-text"
                               placeholder="Your Password"
                               title="비밀번호" required>
                        <div class='password-message-wrap'>
                            <span class='password-failure-length hide msg'>10자 이상 입력</span>
                            <span class='password-failure-comb hide msg'>영문/숫자/특수문자(공백 제외)만 허용하며, 2개 이상 조합</span>
                            <span class='password-failure-contn hide msg'>동일한 숫자 3개 이상 연속 사용 불가</span>
                            <span class='password-failure-upper hide msg'>영어 대문자 하나 이상 포함</span>
                            <span class='password-success-message hide msg success'>사용할 수 있는 비밀번호입니다.</span>
                        </div>
                    </div>
                    <div class="form-row">
                        <label for="re_password">Confirm Password</label>
                        <input type="password" name="re_password" id="re_password" class="input-text"
                               placeholder="비밀번호체크"
                               required>
                        <div class="mismatch-message hide msg">동일한 비밀번호를 입력해주세요.</div>
                        <div class="match-message hide msg success">동일한 비밀번호가 입력되었습니다.</div>
                    </div>

                    <button id="subit-button" type="submit" value="modify">완료!</button>

                </form>
            </div>
        </div>
        </body>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/modify.js"></script>
        </html>
    </c:otherwise>
</c:choose>