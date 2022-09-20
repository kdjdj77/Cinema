<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://kit.fontawesome.com/51772bd9bd.js"
	crossorigin="anonymous"></script>
<!-- 내 게시물 -->
<div class="container my-3 border rounded">
	<div class="mb-3 mt-3">
		<table class="table table-hover mt-3" id="cmt_table">
			<thead>
				<tr>
					<th>작성자</th>
					<th>제목</th>
					<th>답변여부</th>
					<th>작성날짜</th>
				</tr>
			</thead>

			<tbody id="myService_list">

			</tbody>

		</table>
	</div>
</div>
<section class="reservelist">
<div id="page1"></div>
<article class="button">
	<button onClick="loadPreviousMyService(${sessionScope.PRINCIPAL.id})"
		class="ico_arrow1">이전보기</button>

	<button onClick="loadNextMyService(${sessionScope.PRINCIPAL.id})"
		class="ico_arrow">다음보기</button>
</article>
</section>


<!-- 내 게시물 -->
