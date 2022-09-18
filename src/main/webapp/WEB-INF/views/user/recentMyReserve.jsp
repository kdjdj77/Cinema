<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="https://kit.fontawesome.com/51772bd9bd.js"
	crossorigin="anonymous"></script>

<!-- 내 예약내역 -->
<div class="d-flex flex-column flex-md-row justify-content-between mb-5">
	<div class="flex-grow-1" id="myReserve_list"></div>
</div>
<section class="reservelist">
	<div id="page"></div>
	<article class="button">
		<button onClick="loadPreviousMyReserve(${sessionScope.PRINCIPAL.id})"
			class="ico_arrow1">이전보기</button>
		<button class="w-btn w-btn-gra1" onClick="location.href='reserve'">
			예매 영화별보기</button>
		<button onClick="loadNextMyReserve(${sessionScope.PRINCIPAL.id})"
			class="ico_arrow">다음보기</button>
	</article>
</section>

<!-- 내 예약내역 -->
