<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
 
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
 
    <title>예매 목록</title>
</head>
 
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="container mt-3">
    	<section>
	        <h2 class="float-start">예매한 영화</h2>
        </section>
        <div class=" row row-offcanvas row-offcanvas-right" style="width:100%;">
	        <div class="col-xs-12 col-sm-12">
	        	<div class="row">
	        		<hr>
			       	<c:forEach var="reservlist" items="${reservelist}">
			       	
				       	<div class="row col-xs-3 col-lg-3 mb-5 justify-content-center bgRed text-center">
				        	<c:set var="dto" value="${movielist }">
				        	<a href="resdetail?id=${reservelist.id}" class="text-decoration-none rounded text-black" style="width:220px; height:300px; background-color:rgba(0,0,0,0);">
								
								<c:choose>
					        	<%-- 이미지 보여주기 --%>
					            <c:when test="${dto.fileName != null}">
									<img src="${pageContext.request.contextPath}/upload/${dto.fileName}" style="width:220px; height:300px;" class="rounded">
					            </c:when>
					            <c:otherwise>
					            	<div style="background-color:gray; width:220px; height:300px; text-align:center">
					            		NO IMAGE
					            	</div>
					            </c:otherwise>
								</c:choose>
								
				        	</a>
				        	<div><a href="resdetail?id=${reservelist.id}" class="text-decoration-none text-black">
				        		&nbsp;&nbsp;&nbsp;${reservelist.title}
				        	</a></div>
				        	<div>&nbsp;&nbsp;★${dto.star}</div>
				        	</c:set>
				        </div>
			       	</c:forEach>
		       	</div>
	       	</div>
       	</div>
    </div>
</body>
</html>