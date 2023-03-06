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
		<h2>회원 탈퇴</h2><!-- 제목 -->
		<div class="card border-danger mt-3">
               <div class="card-body">
                   <strong class="card-title">삭제하시겠습니까?</strong>
                   <p class="card-text text-center">
                       <br>
                       <!-- 유저 탈퇴 방식 결정에 따라 주소 변경 필요 -->
                       <button class="btn btn-lavender" onclick="location.href='/goodM/user/deleteConfirm/${uid}'">삭제</button>
                       <button class="btn btn-secondary" onclick="location.href='/goodM/user/myPage/'">취소</button>
                   </p>
			</div>
		</div>
	</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>