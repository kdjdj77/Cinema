<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="https://kit.fontawesome.com/51772bd9bd.js" crossorigin="anonymous"></script>

<!-- 내 예약내역 -->
<div class="d-flex flex-column flex-md-row justify-content-between mb-5">
    <div class="flex-grow-1" id="myReserve_list">

    </div>
    <div class="flex-shrink-0"><span class="text-primary">평점</span></div>
    <a href="${pageContext.request.contextPath}/userinfo/reserve?id=${dto.id}">응애</a>
</div>



<!-- 내 예약내역 -->