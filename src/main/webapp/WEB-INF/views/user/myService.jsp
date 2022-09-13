<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="https://kit.fontawesome.com/51772bd9bd.js" crossorigin="anonymous"></script>
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



<!-- 내 게시물 -->
