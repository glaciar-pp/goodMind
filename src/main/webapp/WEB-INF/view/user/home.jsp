<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <%@ include file="../common/heading.jsp" %>
	<link rel="stylesheet" href="/css/home.css">
</head>
<body>
	<div class="container-xl" style="margin-top: 100px;">
		<div class="col-2">
			<div class="sidenav">
				<img alt="기분어때 로고" src="/img/logo.png" style="height:80px; margin: 30px">
				<br>
				<a href="/goodM/user/home"><i class="fa-solid fa-house"></i> </a>
				<a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
					<i class="fa-solid fa-file-circle-exclamation"></i> 기분일기(작성중)
				</a>
					<ul class="dropdown-menu">
						<li class="nav-item ms-3">
							<a class="nav-link ${menu eq 'calendar' ? "active" : ''}" style="color: #979797" href="/goodM/calendar/calendar"><i class="fa-solid fa-calendar-days"></i> 기분일기</a>
						</li>
						<li class="nav-item ms-3">
							<a class="nav-link ${menu eq 'diaryBoard' ? "active" : ''}" style="color: #979797" href="/goodM/diaryBoard/list?p=1&f=&q="><i class="fa-solid fa-book"></i> 기분일기</a>
						</li>
					</ul>
				<a class="nav-link ${menu eq 'chat' ? "active" : ''}" href="/goodM/chat/gibuni"><i class="fa-solid fa-robot"></i></i> 챗봇 기부니</a>
				<a class="nav-link ${menu eq 'map' ? "active" : ''}" href="/goodM/map/kakaoMap"><i class="fa-solid fa-map-location-dot"></i> 병원찾기</a>
				<a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
					<i class="far fa-list-alt"></i>게시판
				</a>
					<ul class="dropdown-menu">
						<li>
							<a class="dropdown-item" style="color: #979797" href="/goodM/infoBoard/list?p=1&f=&q="> 심리건강정보 게시판</a>
						</li>
						<li>
							<a class="dropdown-item" style="color: #979797" href="/goodM/genBoard/list?p=1&f=&q="> 자유게시판</a>
						</li>
					</ul>
				<a class="nav-link ${menu eq 'user' ? "active" : ''}" href="/goodM/user/myPage"><i class="fa-solid fa-user"></i> My page</a>
				<span class="navbar-text ms-3" style="color: #ffffff">${uname}님 환영합니다.</span>
				<a class="nav-link" href="/goodM/user/logout"><i class="fas fa-sign-out-alt"></i> 로그아웃</a>
			</div>
		</div>

		<div class="col-10">
			<h1>만나서 반가워요!</h1>
			<br><br>
			<p>
				발전해가는 사회 속 우리는 꾸준히 성장해가고 있습니다.<br>
				건강에 대한 관심도 높아지고 있지만, 상대적으로 마음의 건강에 대해서는 아직 부족한 실정입니다.<br>
				<img class="img-fluid mx-auto d-block" src="/img/home_1.svg" alt="feeling blue"><br>
				좋아졌다고는 하지만 아직 편견어린 시선이나, 망설임, 방문시간 지정의 어려움 등으로 인해 안타깝게도 문앞까지 와서도 돌아서는 분들이 있죠.<br>
			</p>
			<p>
				이러한 상황에 도움이 되기 위해 '기분 어때'라는 서비스를 생각하게 되었습니다.<br>
			</p>
			<img class="img-fluid mx-auto d-block" src="/img/home_2.svg" alt="solution"><br>
			<p>
				내 주변의 병원과 센터 찾는걸 도와드릴게요!<br>
			</p>
			<img class="img-fluid mx-auto d-block" src="/img/home_3.svg" alt="map"><br>
			<p>
				직접 방문하는게 어렵다면 유선번호를 통한 상담이 가능한 센터도 있으니 도움이 필요하다면 연락해볼 수 있어요.<br>
			</p>			
			<img class="img-fluid mx-auto d-block" src="/img/home_4.svg" alt="result"><br>
			<p>
				자가진단 테스트를 하실 수도 있고 그날 그날 기분이 어땠는지 기록도 남길 수 있어요.<br>
				기분이 좋을 때도, 좋지 않을 때도 기분어때에 오셔서 힐링해보세요.<br>
			</p>
			<h1>오늘, 기분 어때?</h1><br><br>
			<img class="img-fluid float-end" src="/img/home_5.svg" alt="appreciate">
            <!-- =================== main =================== -->
		</div>
	</div>
</body>
</html>