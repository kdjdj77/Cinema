<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="https://kit.fontawesome.com/51772bd9bd.js" crossorigin="anonymous"></script>


  <!-- 댓글 -->
  <div class="container my-3 border rounded">
      <div class="mb-3 mt-3">
          <label>댓글: <span id="cmt_cnt"></span> 개</label>
          
          <c:if test="${fn:contains(sessionScope.PRINCIPAL.authorities, 'ROLE_ADMIN' )}">  
          <div class="input-group my-2">
              <textarea class="form-control" id="input_comment"></textarea>
              <button type="button" class="btn btn-outline-primary" id="btn_comment">작성</button>
          </div>
          </c:if>

          <table class="table table-hover mt-3" style="border-radius: 0"  id="cmt_table">
              <thead>
                <tr>
                  <th style="width: 6%">작성자</th>
                  <th style="width: 40%">내용</th>
                  <th style="width: 16.66%">작성일</th>
                  <th style="width: 4%"></th>
                </tr>
              </thead>
              <tbody id="cmt_list">
               
              </tbody>
          </table>
      </div>
  </div>
  <!-- 댓글 -->



