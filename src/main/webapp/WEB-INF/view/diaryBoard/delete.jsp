<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common/heading.jsp" %>
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
					<h1>기분일기 삭제</h1><!-- 제목 -->
				</header>
				<div class="card border-warning mt-3">
	                <div class="card-body">
	                    <strong class="card-title">일기를 삭제하시겠습니까?</strong>
	                    <p class="card-text text-center">
	                        <br>
	                        <button class="btn btn-primary" onclick="location.href='/goodM/diaryBoard/deleteConfirm?did=${did}'">삭제</button>
	                        <button class="btn btn-secondary" onclick="location.href='/goodM/diaryBoard/list?p=${currentDiaryBoardPage}&f=&q='">취소</button>
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