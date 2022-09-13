<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="n" value="${PRINCIPAL.name}"/>
<c:choose>
	<c:when test="${empty list || fn:length(list) == 0}">
		<script>
			alert("해당 영화가 삭제되거나 없습니다");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<c:set var="fileDto" value="${fileList[0]}"/>
    	<c:set var="dto" value="${list[0]}"/>
		<!DOCTYPE html>
		<html lang="ko">
		
		<head>
		    <meta charset="utf-8">
		    <meta name="viewport" content="width=device-width, initial-scale=1">
		    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
		    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
		
		    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>    

		    <title>영화 - ${dto.title}</title>
		</head>
		
		<script>
			function chkDelete(){
				let answer = confirm("삭제하시겠습니까?");
				if(answer){
					document.forms['frmDelete'].submit();
				}
			}
		</script>
		
		<body>
		    <%-- 인증 헤더 --%>
		    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
		    <div class="container mt-3">
		    	<br><br><br>
		        <h2>${dto.title}
		        	<!-- 상단 버튼 -->
		            <c:if test="${fn:contains(PRINCIPAL.authorities, 'ROLE_ADMIN')}">
		            	<a class="btn btn-outline-dark float-end mx-3" href="update?id=${dto.id }">수정</a>
		            </c:if>
		            <c:if test="${fn:contains(PRINCIPAL.authorities, 'ROLE_ADMIN')}">
		            	<button type="button" class="btn btn-outline-dark float-end" onclick="chkDelete()">삭제</button>
		            </c:if>
		        	<!-- 상단 버튼 --> 
		        </h2> 
		        <hr>
		        <section>
					<div class="container mt-3 mb-3 rounded float-start rounded" style="width:220px; height:300px; background-color:rgba(0,0,0,0);">
					    <c:choose>
			        	<%-- 이미지 보여주기 --%>
			            <c:when test="${fileDto.image == true }">
							<img src="${pageContext.request.contextPath}/upload/${fileDto.file }" style="width:220px; height:300px;" class="rounded">
			            </c:when>
			            <c:otherwise>
			            	<div style="background-color:gray; width:220px; height:300px; text-align:center">
			            		NO IMAGE
			            	</div>
			            </c:otherwise>
						</c:choose>
					</div>
					
		        	<form name="frmDelete" action="delete" method="POST">
		        		<input type="hidden" name="id" value="${dto.id}">
		        	</form>
		        	<br>
		            <div class="mb-3">
		            	&nbsp;&nbsp;&nbsp;&nbsp;
		                제목 : ${dto.title}
		            </div>    
		            <div class="mb-3 mt-3">
		            	&nbsp;&nbsp;&nbsp;&nbsp;
		                장르 : ${dto.genre}
		            </div>    
		            <div class="mb-3 mt-3">
		           		&nbsp;&nbsp;&nbsp;&nbsp;
		                상영시간 : ${dto.runtime}분
		            </div>   
		            <div class="mb-3 mt-3">
		            	&nbsp;&nbsp;&nbsp;&nbsp;
		                감독 : ${dto.director}
		            </div>  
		            <div class="mb-3 mt-3">
		            	&nbsp;&nbsp;&nbsp;&nbsp;
		                출연 : ${dto.actor}
		            </div>  
		            <div class="mb-3 mt-3">
		            	&nbsp;&nbsp;&nbsp;&nbsp;
		                평점 : ★${dto.star}
		            </div>  
		            <c:if test="${fn:contains(PRINCIPAL.authorities, 'ROLE_MEMBER')}">
		            	<a class="btn btn-outline-dark mx-4 float-start mybtn" href="reserv?id=${dto.id }">예매하기</a>
		            </c:if>
		        </section>
		        <section style="margin-top:100px;">
		        	시놉시스
		        	<hr>
		        	${dto.synopsis}
		        	<br><br><br>
		        	댓글
		        	<hr>
					<jsp:include page="comment.jsp"/>
					<button onClick="loadComment(${dto.id})" class="mt-0 btn btn-outline-dark w-100">
						더보기
					</button>
					<br><br><br>
		        </section>
		    </div>
		    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
		</body>
		<c:choose>
		    <c:when test="${empty sessionScope.PRINCIPAL}">
		        <script> const logged_id = 0;</script>
		    </c:when>
			<c:otherwise>
				<script>logged_id = ${PRINCIPAL.id};</script>
			</c:otherwise>
		</c:choose>
		<script>
	    	const conPath = "${pageContext.request.contextPath}";
	    	const myName = "${n}";
	    	const role = "${PRINCIPAL.authorities}";
	    </script>
	    <script src="${pageContext.request.contextPath}/js/movieDetail.js"></script>
		</html>
	</c:otherwise>
</c:choose>   