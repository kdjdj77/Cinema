<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:choose>
	<c:when test="${empty list || fn:length(list) == 0}">
		<script>
			alert("해당 영화가 삭제되거나 없습니다");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<c:set var="fileDto" value="${fileList[0]}" />
		<c:set var="dto" value="${list[0]}" />
		<!DOCTYPE html>
		<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/checkSeat.css">
<title>영화 - ${dto.title}</title>
</head>

<body>
	<%-- 인증 헤더 --%>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<script>
            const conPath = "${pageContext.request.contextPath}";
        	</script>

	<input type="hidden" name="id" value="${dto.id}">

	<div class="container mt-3">
		<br> <br> <br>
		<h2>"${dto.title}"의 예매내역</h2>
		<hr>
		<section>
			<div class="container mt-3 mb-3 rounded float-start rounded"
				style="width: 220px; height: 300px; background-color: rgba(0, 0, 0, 0);">
				<c:choose>
					<%-- 이미지 보여주기 --%>
					<c:when test="${fileDto.image == true }">
						<img
							src="${pageContext.request.contextPath}/upload/${fileDto.file }"
							style="width: 220px; height: 300px;" class="rounded">
					</c:when>
					<c:otherwise>
						<div
							style="background-color: gray; width: 220px; height: 300px; text-align: center">
							NO IMAGE</div>
					</c:otherwise>
				</c:choose>
			</div>


			<input type="hidden" name="id" value="${dto.id}"> <br>
			<div class="mb-3">&nbsp;&nbsp;&nbsp;&nbsp; 제목 : ${dto.title}</div>
			<div class="mb-3 mt-3">&nbsp;&nbsp;&nbsp;&nbsp; 장르 :
				${dto.genre}</div>
			<div class="mb-3 mt-3">&nbsp;&nbsp;&nbsp;&nbsp; 상영시간 :
				${dto.runtime}분</div>
			<div class="mb-3 mt-3">&nbsp;&nbsp;&nbsp;&nbsp; 감독 :
				${dto.director}</div>
			<div class="mb-3 mt-3">&nbsp;&nbsp;&nbsp;&nbsp; 출연 :
				${dto.actor}</div>

			<br> <br>
		</section>
		<section style="margin-top: 100px;">
			줄거리
			<hr>
			${dto.synopsis} <br> <br> <br> 예매 내역
			<hr>
			<jsp:include page="reserveBySeat.jsp" />
			<section class="reservelist">
				<div id="page"></div>
				<article class="button">
					<button onClick="loadPreviousMyReserveList(${dto.id})"
						class="ico_arrow1">이전보기</button>
					<button onClick="loadNextMyReserveList(${dto.id})"
						class="ico_arrow">다음보기</button>
				</article>
			</section>
			<br> <br> <br>
		</section>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
<c:choose>
	<c:when test="${empty sessionScope.PRINCIPAL}">
		<script> const logged_id = 0;</script>
	</c:when>
	<c:otherwise>
		<script>logged_id = ${PRINCIPAL.id};</script>
	</c:otherwise>
</c:choose>

<script src="${pageContext.request.contextPath}/js/reserveBySeat.js"></script>
		</html>
	</c:otherwise>
</c:choose>
