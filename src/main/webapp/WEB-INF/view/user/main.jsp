<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="../common/top.jsp" %>
	<%@ include file="../common/heading.jsp" %>
	<%@ include file="../chat/gibuni.jsp" %>
</head>

<body>
	<div class="container-fluid" id="inFrame">
	<%@ include file="../common/aside.jsp" %>
		<header id="header">
			<a href="/goodM/user/main" class="logo"><strong><img src="/img/logo.png" alt="" width="40px" height="40px"></strong>   by 멀캠가네 둘째 조</a>
			<div class="float-end">
			<a href="#" id="addrChange"><img src="/img/addr.png" height="16" class="me-1"></a>
                   	<span id="addr">
                   		${empty sessionAddress ? '서울시 광진구' : sessionAddress}
                   	</span>
                   	<div id="addrInputDisp" class="mt-2 d-none">
	                	<input class="form-control form-control-sm" type="text" id="addrInput">
	                	<a href="#" id="addrSubmit"><span class="badge bg-primary">확인</span></a>
	                </div>
                   	<a href="#" id="weather"><span class="badge bg-secondary">날씨</span></a><br>
                    <div id="weatherInfo"></div>
			</div>
		</header>
		<!-- 메인 배너 -->
		<div class="row row-cols-1 row-cols-sm-2 ms-5 me-5">
			<div class="col">
				<h1>오늘, 기분 어때?</h1>
				<p>당신을 위한 심리건강 서비스</p>
				<p>[여러분의 기분을 기록하고 기억하고 관리해 드립니다.]</p>
				<a href="/goodM/user/about" class="button big">Learn More</a>
			</div>
			<div class="col">
				<img src="/img/mainImg.jpg" id="mainImg"/>
			</div>
		</div>
		<hr>
		<c:set var = "total" value = "0" />
		<c:forEach var="diaryBoard" items="${day.diaryBoardList}" varStatus="status">
				<div class="${loop.first ? 'mt-1' : ''}" style="font-size: 12px;" onclick="mindClick(${diaryBoard.did}, '${uid}')">
					${diaryBoard.title}
					<img src="/img/sentiImage${diaryBoard.score}.png" height="30px">                        	
				</div>
				<c:set var= "total" value="${total + diaryBoard.score}"/>
			</c:forEach>
			<c:out value="${total}"/>
		<hr>
		<!-- 서비스 목표 -->
		<h2>서비스 목표</h2>
		<div class="row row-cols-1 row-cols-md-2 g-2  d-flex justify-content-center" >
			<div class="col text-center ms-3 me-3" style="width: 40%">
			<i class="fa-solid fa-calendar-days" id="mainIcon"></i>
				<h3>기분일기</h3>
				<hr>
				<p>감정분석 기능을 통해 그날그날의 기분을 알려드립니다!편하게 일기를 작성하고 기분이 어땠는지 확인해보실 수 있습니다.</p>
			</div>
			<div class="col text-center ms-3 me-3" style="width: 40%">
			<i class="fa-solid fa-robot" id="mainIcon"></i>
				<h3>챗봇 기부니</h3>
				<hr>
				<p>언제든 대화상대가 되어주는 챗봇 기부니가 항상 옆에서 따라다닙니다. 편하게 대화를 나누어보세요.</p>
			</div>
			<div class="col text-center ms-3 me-3" style="width: 40%">
			<i class="fa-solid fa-map-location-dot" id="mainIcon"></i>
				<h3>병원/기관찾기</h3>
				<hr>
				<p>국내 심리건강 관련 병원 및 기관 정보를 집중적으로 모아두어 빠르게 찾아보실 수 있습니다.</p>
			</div>
			<div class="col text-center ms-3 me-3" style="width: 40%">
			<i class="fa-solid fa-heart" id="mainIcon"></i>
				<h3>정보 공유</h3>
				<hr>
				<p>심리건강정보 공유 게시판에 올라오는 정보를 통해 심리건강 지식을 얻고, 본인의 좋은 노하우가 있다면 자유게시판을 통해 공유해보세요.</p>
			</div>
			<div class="col text-center ms-3 me-3" style="width: 40%">
			<i class="fa-solid fa-list-check" id="mainIcon"></i>
				<h3>자가진단</h3>
				<hr>
				<p>병원에 가기 망설여진다면, 자가진단을 통해 내 마음의 상태를 알아보아요.<br>※ 모든 척도는 증상의 정도, 성향을 파악하는 도구일 뿐입니다.</p>
			</div>
		</div>
		<hr>
		<!-- 자가진단 테스트 -->
		<h2>자가진단 테스트</h2>
		<div class="row row-cols-1 row-cols-sm-2 row-cols-lg-3 row-cols-xl-4 g-4 ms-5 me-5">
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
					<img src="/img/survey/PSS.jpg" class="card-img-top" alt="thumbnail image">
					<div class="card-body">
						<h5 class="card-title">스트레스 척도(PSS)</h5>
						<hr>
						<p class="card-text" style="color: grey; margin-bottom:15px">측정내용: 스트레스</p>
						<a href="/goodM/survey/surPSS" class="button big">테스트 하러가기</a>
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
		</div>
		<br>
	</div>
	<%@ include file="../common/bottom.jsp" %>
</body>
</html>