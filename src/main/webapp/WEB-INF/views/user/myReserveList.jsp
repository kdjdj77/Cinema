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
<div class="content ticket-menu content-active">
					<div class="content-list-text">예매 목록</div>
					<c:choose>
					<c:when test="${fn:length(list) == 0}">
						<div class="content-no-item-text">예매목록이 없습니다.</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="list">
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
						</c:forEach>
					</c:otherwise>
					</c:choose>
				</div>
    <h1>응!</h1>
</body>
</html>