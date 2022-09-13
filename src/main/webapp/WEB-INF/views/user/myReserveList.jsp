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
     <script src="${pageContext.request.contextPath }/js/list.js"></script>
 
    <title>예매 목록</title>
</head>
 
<body>
    <%-- 인증 헤더 --%>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="content ticket-menu content-active">
					<div class="content-list-text">예매 목록</div>
					<c:choose>
					<c:when test="${fn:length(list) == 0}">
						<div class="content-no-item-text">예매목록이 없습니다.</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="list">
						<%-- <div class="mb-3 mt-3 clearfix">
            <span class="float-start me-2">총 ${cnt }개</span>
            <span class="float-start">page ${page }/${totalPage }</span>
            <span class="float-end">
            </span>
        </div> --%>
							<div class="ticket-item-group">
								<div class="ticket-item-header">
									<%-- <div class="ticket-date">${list.regdate}</div> --%>
								</div>
								<div class="line"></div>
								<div class="ticket-item">
								<table>
									<thead>
									 	<tr>
											<th>작성자</th>
                    						<th>제목</th>
                    						<th>답변개수</th>
                    						<th>작성일</th>
										</tr>
									</thead>
									
									<tbody>
                						<tr>
                    						<td>${list.movie.title }</td>
                    						<td><a href="resdetail?id=${list.id}">${list.seat }</a></td>
                    						<td>개</td>
                    						<td></td>
                						</tr>                       
            						</tbody>
								</table>
								</div>
							</div>
							<%--  <!-- pagination -->
    <div class="container mt-1">
        <ul class="pagination justify-content-center">
            << 표시 여부   
            <c:if test="${page > 1 }">
            <li class="page-item"><a class="page-link" href="${url }" title="처음"><i class='fas fa-angle-double-left'></i></a></li>
            </c:if>     
        
            < 표시 여부
            <c:if test="${startPage > 1 }">
            <li class="page-item"><a class="page-link" href="${url }?page=${startPage - 1 }"><i class='fas fa-angle-left'></i></a></li>
            </c:if>
            
            페이징 안의 '숫자' 표시 
            <c:if test="${totalPage > 1 }">
                <c:forEach var="k" begin="${startPage }" end="${endPage }">
                <c:choose>
                    <c:when test="${k != page }">
                        <li class="page-item"><a class="page-link" href="${url }?page=${k }">${k }</a></li>        			
                    </c:when>
                    <c:otherwise>
                        <li class="page-item active"><a class="page-link" href="javascript:void(0);">${k }</a></li>
                    </c:otherwise>
                </c:choose>
                </c:forEach>    
            </c:if>
                        
            > 표시 여부
            <c:if test="${totalPage > endPage }">
            <li class="page-item"><a class="page-link" href="${url }?page=${endPage + 1 }"><i class='fas fa-angle-right'></i></a></li>
            </c:if>
            
            >> 표시 여부
            <c:if test="${page < totalPage }">
            <li class="page-item"><a class="page-link" href="${url }?page=${totalPage }"><i class='fas fa-angle-double-right'></i></a></li>
            </c:if>
            
        </ul>
    </div> --%>
						</c:forEach>
					</c:otherwise>
					</c:choose>
				</div>
    <h1>응!</h1>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>