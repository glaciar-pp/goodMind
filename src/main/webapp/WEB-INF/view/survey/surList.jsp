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
		<h2>자가진단 테스트</h2>
		<div class="row row-cols-1 row-cols-md-2 g-4">
			<div class="col">
				<div class="card h-100">
					<img src="/img/기본 썸네일.png" class="card-img-top" alt="thumbnail image">
					<div class="card-body">
						<h5 class="card-title">정신건강 자가진단</h5>
						<hr>
						<p class="card-text" style="color: grey">측정내용: 우울, 불안, 신경과민 등</p>
						<a href="/goodM/survey/surK10" class="button big">테스트 하러가기</a>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card h-100">
					<img src="/img/기본 썸네일.png" class="card-img-top" alt="thumbnail image">
					<div class="card-body">
						<h5 class="card-title">우울증 건강설문(PHQ-9)</h5>
						<hr>
						<p class="card-text" style="color: grey">측정내용: 우울</p>
						<a href="/goodM/survey/surPHQ9" class="button big">테스트 하러가기</a>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card h-100">
					<img src="/img/기본 썸네일.png" class="card-img-top" alt="thumbnail image">
					<div class="card-body">
						<h5 class="card-title">정신건강 자가진단</h5>
						<hr>
						<p class="card-text" style="color: grey">측정내용: 우울, 불안, 신경과민 등</p>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card h-100">
					<img src="/img/기본 썸네일.png" class="card-img-top" alt="thumbnail image">
					<div class="card-body">
						<h5 class="card-title">정신건강 자가진단</h5>
						<hr>
						<p class="card-text" style="color: grey">측정내용: 우울, 불안, 신경과민 등</p>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>