<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common/heading.jsp" %>
</head>

<body style="margin-bottom:100px">
	<div class="container-fluid" id="inFrame">
    <%@ include file="../common/aside.jsp" %>
		<header id="header">
			<a href="/goodM/user/main" class="logo"><strong><img src="/img/logo.png" alt="" width="30px" height="30px"></strong> by 멀캠가네 둘째 조</a>
		</header>
		<!-- Content -->
		<!-- 제목 -->
		<h2>기분일기 삭제</h2>
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
	</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>