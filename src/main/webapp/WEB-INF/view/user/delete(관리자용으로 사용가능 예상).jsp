<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common/heading.jsp" %>
    <style>
        th, td { text-align: center; }
    </style>
</head>

<body class="is-preload" style="margin-bottom:100px">
	<%@ include file="../common/aside.jsp" %>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
			<!-- 상단 로고 및 진한 선 -->
			<header id="header">
				<a href="/goodM/user/main" class="logo"><strong><img src="/img/logo.png" alt="" width="30px" height="30px"></strong> by 멀캠가네 둘째 조</a>
			</header>
			<!-- Content -->
			<section>
				<header class="main">
					<h1>회원 탈퇴</h1><!-- 제목 -->
				</header>
				<div class="card border-warning mt-3">
	                <div class="card-body">
	                    <strong class="card-title">삭제하시겠습니까?</strong>
	                    <p class="card-text text-center">
	                        <br>
	                        <!-- 유저 탈퇴 방식 결정에 따라 주소 변경 필요 -->
	                        <button class="btn btn-primary" onclick="location.href='/goodM/user/deleteConfirm/${uid}'">삭제</button>
	                        <button class="btn btn-secondary" onclick="location.href='/goodM/user/list/${currentUserPage}'">취소</button>
	                    </p>
	                </div>
	            </div>
			</section>
			</div>
		</div>
	</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>