<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <nav class="navbar navbar-expand-sm fixed-top">
        <div class="container-fluid">
            <ul class="navbar-nav">
                <a class="navbar-brand ms-5 me-5" href="/goodM/user/main">
                    <img src="/img/logo.png" alt="Logo" style="height:40px;" class="rounded-3 mx-2">
                </a>
			</ul>
			<ul class="navbar-nav">
				<li class="nav-item ms-3">
					<a class="nav-link ${menu eq 'calendar' ? "active" : ''}" href="/goodM/calendar/calendar"><i class="fa-solid fa-calendar-days"></i> 기분일기</a>
				</li>
				<li class="nav-item ms-3">
					<a class="nav-link ${menu eq 'chat' ? "active" : ''}" href="/goodM/chat/gibuni"><i class="fa-solid fa-robot"></i></i> 챗봇 기부니</a>
				</li>
                <li class="nav-item ms-3">
					<a class="nav-link ${menu eq 'map' ? "active" : ''}" href="/goodM/map/kakaoMap"><i class="fa-solid fa-map-location-dot"></i> 병원찾기</a>
				</li>
				<li class="nav-item dropdown ms-3">
					<a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
						<i class="far fa-list-alt"></i>게시판
					</a>
                <ul class="dropdown-menu">
	                <li>
	                    <a class="dropdown-item" style="color: #979797" href="/goodM/infoBoard/list?p=1&f=&q="> 심리건강정보</a>
	                </li>
	                <li>
	                    <a class="dropdown-item" style="color: #979797" href="/goodM/genBoard/list?p=1&f=&q="> 자유게시판</a>
	                </li>
                </ul>
                </li>
			</ul>
			<ul class="navbar-nav">
                <li class="nav-item ms-7">
                    <a class="nav-link justify-content-end" href="/goodM/user/logout"><i class="fas fa-sign-out-alt"></i> 로그아웃</a>
                </li>
            </ul>
        </div>
    </nav>