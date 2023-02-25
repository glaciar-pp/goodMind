<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common/heading.jsp" %>
</head>

<body style="margin-bottom:100px">
	<%@ include file="../common/aside.jsp" %>
	<div class="container-fluid">
		<header id="header">
			<a href="/goodM/user/main" class="logo"><strong><img src="/img/logo.png" alt="" width="30px" height="30px"></strong> by 멀캠가네 둘째 조</a>
		</header>
		<!-- Content -->
		<!-- 제목 -->
		<h2>사용자 목록</h2><!-- 제목 -->
			<table class="table table-condensed table-hover" style="margin-bottom: 80px;">
                <tr class="table-secondary d-flex">
                    <th class="col-1">번호</th>
                    <th class="col-2">uid</th>
                    <th class="col-2">이름</th>
                    <th class="col-4">이메일</th>
                    <th class="col-2">가입일</th>
                    <th class="col-1">액션</th>
                </tr>   
                <!-- 반복되는 부분 -->
			<c:forEach var="user" items="${userList}" varStatus="loop">
                <tr class="d-flex">
					<td class="col-1">${loop.count}</td>
					<td class="col-2">${user.uid}</td>
					<td class="col-2">${user.uname}</td>
					<td class="col-4">${user.email}</td>
					<td class="col-2">${user.regDate}</td>
					<td class="col-1">
					<%-- 본인만이 수정 권한이 있음 --%>
		            <c:if test="${uid eq user.uid}">
		            	<a href="/goodM/user/update/${user.uid}"><i class="fas fa-user-edit"></i></a>
		            </c:if>
		            <c:if test="${uid ne user.uid}">
		            	<a href="#" class="disabled-link"><i class="fas fa-user-edit"></i></a>
		            </c:if>
		            
		            <%-- 관리자(admin) 만이 삭제 권한이 있음 --%>
		            <c:if test="${uid eq 'admin'}">
						<a href="/goodM/user/delete/${user.uid}"><i class="fas fa-user-minus"></i></a>
		            </c:if>
		            <c:if test="${uid ne 'admin'}">
		            	<a href="#" class="disabled-link"><i class="fas fa-user-minus"></i></a>
		            </c:if>
                       </td>
               		</tr> 
               	</c:forEach>
			</table>    
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
			<c:forEach var="page" items="${pageList}" varStatus="loop">    
				<li class="page-item ${(currentUserPage eq page) ? 'active' : ''}">
					<a class="page-link" href="/goodM/user/list/${page}">${page}</a>
				</li>
			</c:forEach>   
				<li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
			</ul>
	</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>