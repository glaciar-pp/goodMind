<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
			<!-- 메인 배너 -->
			<div class="row">
				<img src="/img/simpleBg.jpg" class="img-fluid rounded mx-auto" style="width: 85%; height: 400px;"/>	
				<h1>오늘, 기분 어때?</h1>
				<p>당신을 위한 심리건강 서비스</p>
				<p>[여러분의 기분을 기록하고 기억하고 관리해 드립니다.]</p>
				<a href="/goodM/common/about" class="button big">Learn More</a>
			</div>
			<hr>
			<!-- 서비스 목표 -->
			<h2>서비스 목표</h2>
			<div class="row row-cols-1 row-cols-md-2 g-3">
				<div class="col">
				<span class="icon fa-gem"></span>
					<h3>Portitor ullamcorper</h3>
					<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
				</div>
				<div class="col">
				<span class="icon solid fa-paper-plane"></span>
					<h3>Sapien veroeros</h3>
					<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
				</div>
				<div class="col">
				<span class="icon solid fa-rocket"></span>
					<h3>Quam lorem ipsum</h3>
					<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
				</div>
				<div class="col">
				<span class="icon solid fa-signal"></span>
					<h3>Sed magna finibus</h3>
					<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
				</div>
			</div>
			<hr>
			<h2>심리건강정보 게시판</h2>
			<div class="row row-cols-1 row-cols-md-2 row-cols-xl-3 g-3">
				<div class="col">
					<div class="card">
					<img class="card-img-top" src="/img/sample.jpg">
						<div class="card-body">
							<h3>게시판 제목</h3>
							<p>작성일자</p>
							<a href="#" class="button">More</a>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
					<img class="card-img-top" src="/img/sample.jpg">
						<div class="card-body">
							<h3>게시판 제목</h3>
							<p>작성일자</p>
							<a href="#" class="button">More</a>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
					<img class="card-img-top" src="/img/sample.jpg">
						<div class="card-body">
							<h3>게시판 제목</h3>
							<p>작성일자</p>
							<a href="#" class="button">More</a>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
					<img class="card-img-top" src="/img/sample.jpg">
						<div class="card-body">
							<h3>게시판 제목</h3>
							<p>작성일자</p>
							<a href="#" class="button">More</a>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
					<img class="card-img-top" src="/img/sample.jpg">
						<div class="card-body">
							<h3>게시판 제목</h3>
							<p>작성일자</p>
							<a href="#" class="button">More</a>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
					<img class="card-img-top" src="/img/sample.jpg">
						<div class="card-body">
							<h3>게시판 제목</h3>
							<p>작성일자</p>
							<a href="#" class="button">More</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	<%@ include file="../common/bottom.jsp" %>
</body>
</html>