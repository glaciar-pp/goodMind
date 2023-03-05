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
		<h2>자가진단 테스트</h2>
		<div class="row row-cols-1 row-cols-sm-2 row-cols-lg-3 row-cols-xl-4 g-4 ms-5 me-3">
			<div class="col">
				<div class="card h-100">
					<img src="/img/survey/K10.jpg" class="card-img-top" alt="thumbnail image">
					<div class="card-body">
						<h5 class="card-title">정신건강 자가진단(K10)</h5>
						<hr>
						<p class="card-text" style="color: grey">측정내용: 우울, 불안, 신경과민 등</p>
						<a href="/goodM/survey/surK10" class="button big">테스트 하러가기</a>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card h-100">
					<img src="/img/survey/PHQ-9.jpg" class="card-img-top" alt="thumbnail image">
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
					<img src="/img/survey/GAD-7.jpg" class="card-img-top" alt="thumbnail image">
					<div class="card-body">
						<h5 class="card-title">불안장애 척도(GAD-7)</h5>
						<hr>
						<p class="card-text" style="color: grey">측정내용: 불안</p>
						<a href="/goodM/survey/surGAD7" class="button big">테스트 하러가기</a>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card h-100">
					<img src="/img/survey/RSES.jpg" class="card-img-top" alt="thumbnail image">
					<div class="card-body">
						<h5 class="card-title">자아존중감척도(RSES)</h5>
						<hr>
						<p class="card-text" style="color: grey">측정내용: 자존감</p>
						<a href="/goodM/survey/surRSES" class="button big">테스트 하러가기</a>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card h-100">
					<img src="/img/survey/PSS.jpg" class="card-img-top" alt="thumbnail image">
					<div class="card-body">
						<h5 class="card-title">스트레스 척도(PSS)</h5>
						<hr>
						<p class="card-text" style="color: grey">측정내용: 스트레스</p>
						<a href="/goodM/survey/surPSS" class="button big">테스트 하러가기</a>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card h-100">
					<img src="/img/survey/AUDIT_K.jpg" class="card-img-top" alt="thumbnail image">
					<div class="card-body">
						<h5 class="card-title">위험음주자 선별도구(AUDIT_K)</h5>
						<hr>
						<p class="card-text" style="color: grey">측정내용: 알코올 사용 장애 진단척도</p>
						<a href="/goodM/survey/surAK" class="button big">테스트 하러가기</a>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card h-100">
					<img src="/img/survey/IGUESS.jpg" class="card-img-top" alt="thumbnail image">
					<div class="card-body">
						<h5 class="card-title">인터넷 게임중독(IGUESS)</h5>
						<hr>
						<p class="card-text" style="color: grey">측정내용: 인터넷게임 중독 증상 선별</p>
						<a href="/goodM/survey/surIGUESS class="button big">테스트 하러가기</a>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card h-100">
					<img src="/img/survey/mKPQ-16.jpg" class="card-img-top" alt="thumbnail image">
					<div class="card-body">
						<h5 class="card-title">조기 정신증 선별도구(mKPQ-16)</h5>
						<hr>
						<p class="card-text" style="color: grey">측정내용: 조기 정신증 선별을 위한 환각/지각 이상, 사고장애, 음성증상, 인지기능 등 측정</p>
						<a href="/goodM/survey/surMKPQ16" class="button big">테스트 하러가기</a>
					</div>
				</div>
			</div>
		</div>
		<br>
		<div id="source">
			<p>※ 이미지 작가: storyset / 출처: Freepik</p>
		</div>
		<br>
	</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>
