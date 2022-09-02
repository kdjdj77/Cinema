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
 
    <title>영화목록</title>
</head>
 
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="container mt-3">
        <h5>영화목록</h5>
        <div class=" row row-offcanvas row-offcanvas-right">
	        <div class="col-xs-12 col-sm-12">
	        	<div class="row">
			       	<c:forEach var="dto" items="${dtolist}">
				       	<div class="row col-xs-3 col-lg-3 justify-content-center bgRed text-center">
				        	<a href="detail?id=${dto.id}" class="col-lg-10 text-decoration-none text-white" style="height:300px; background-color:gray;">
					        	<div>
					        		No Image
					        	</div>
				        	</a>
				        	<div><a href="detail?id=${dto.id}" class="text-decoration-none text-black">
				        		${dto.title}
				        	</a></div>
				        	<div>★${dto.star}&nbsp;</div>
				        </div>
			       	</c:forEach>
		       	</div>
	       	</div>
       	</div>
    </div>
</body>
</html>