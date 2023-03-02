<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common/top.jsp" %>
    <%@ include file="../common/heading.jsp" %>
</head>

<body>
	<div class="container-fluid" id="inFrame">
    <%@ include file="../common/aside.jsp" %>
		<header id="header">
			<a href="/goodM/user/main" class="logo"><strong><img src="/img/logo.png" alt="" width="30px" height="30px"></strong> by 멀캠가네 둘째 조</a>
		</header>
		<!-- Content -->
		<!-- 제목 -->
		<h2>탈퇴회원 복원 신청</h2><!-- 제목 -->
			<form id="requestForm" action="/goodM/admin/request" method="POST">
			  <div>
			    <label for="uid">아이디</label>
			    <input type="text" id="uid" name="uid" required>
			  </div>
			  <div>
			    <label for="pwd">비밀번호</label>
			    <input type="password" id="pwd" name="pwd" required>
			  </div>
			  <div>
			    <button type="submit">확인</button>
			  </div>
			</form>
	</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>