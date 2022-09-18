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
        >
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

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />


<title>예매 목록</title>
<style>
.gallerylist {
	max-width: 1200px;
	width: 100%;
	margin: 0 auto;
}

.gallerylist>ul {
	font-size: 0;
	text-align: center;
}

.gallerylist>ul>li {
	display: inline-block;
	vertical-align: top;
	width: 300px;
	height: 409px;
	margin: 50px 30px;
}

.gallerylist>ul>li>a {
	display: block;
	width: auto;
	text-decoration: none;
	margin: 5px;
}

.gallerylist>ul>li>a .screen {
	position: relative;
	overflow: hidden;
	width: 100%;
	height: 100%;
	background-color: gray;
}

.gallerylist>ul>li>a .screen .top {
	position: absolute;
	bottom: 150%;
	left: 8px;
	z-index: 2;
	color: #fff;
	font-size: 26px;
	font-weight: 900;
	transition: all .35s;
}

.gallerylist>ul>li>a .screen .bottom {
	position: absolute;
	top: 150%;
	left: 8px;
	z-index: 2;
	color: #fff;
	font-size: 18px;
	transition: all .35s;
}

.gallerylist>ul>li>a .screen div {
	width: 100%;
}

.gallerylist>ul>li>a h3 {
	font-size: 25px;
	text-align: center;
	padding: 20px;
	color: #666;
}

.gallerylist>ul>li>a .screen::after {
	content: '';
	display: block;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, .5);
	z-index: 1;
	opacity: 0;
	transition: all .35s;
}

.gallerylist>ul>li>a:hover .top {
	bottom: 52%;
}

.gallerylist>ul>li>a:hover .bottom {
	top: 52%;
}

.gallerylist>ul>li>a:hover .screen::after {
	opacity: 1;
}
</style>

</head>

<body>
	<%-- 인증 헤더 --%>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<br>
	<br>
	<br>
	<br>
	<div class="gallerylist">
		<ul>
			<c:forEach var="list" items="${list}">
				<li><a href="dreserve?id=${list.movie.id}">
						<div class="screen">
							<div class="top">${list.movie.title }</div>
							<div class="bottom">예매한 좌석 수: ${list.seatTotal }</div>
							<c:choose>
								<c:when test="${list.fileName != null }">
									<img
										src="${pageContext.request.contextPath}/upload/${list.fileName}"
										style="width: 300px; height: 409px;"
										class="rounded border border-white">
								</c:when>
								<c:otherwise>
									<div
										style="background-color: gray; width: 300px; height: 409px; text-align: center"
										class="rounded">NO IMAGE</div>
								</c:otherwise>
							</c:choose>
						</div>
						<div>
							<h3>
								<c:out value="${list.movie.title}" />
							</h3>
						</div>
				</a></li>
			</c:forEach>
		</ul>
	</div>



</body>

		</html>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</c:otherwise>
</c:choose>