<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container-fluid">
            <ul class="navbar-nav">
                <a class="navbar-brand ms-5 me-5" href="/goodM/user/intro">
                    <img src="/img/logo.png" alt="Logo" style="height:40px;" class="rounded-3 mx-2">
                </a>
                <li class="nav-item">
                    <a class="nav-link" href="#">about (소개와 분리)</a>
                </li>
                <li class="nav-item dropdown ms-3">
	                <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
	                    <i class="fa-regular fa-heart"></i> Service
	                </a>
	                <ul class="dropdown-menu">
	                    <li><a class="dropdown-item" ${menu eq 'calendar' ? "active" : ''}" href="/goodM/calendar/calendar"><i class="fa-solid fa-calendar-days"></i> 기분일기</a>
	                    <li><a class="dropdown-item" ${menu eq 'diaryBoard' ? "active" : ''}" href="/goodM/diaryBoard/list?p=1&f=&q="><i class="fa-solid fa-book"></i> 기분일기</a>
	                    <li><a class="dropdown-item" ${menu eq 'chat' ? "active" : ''}" href="/goodM/chat/gibuni"><i class="fa-solid fa-robot"></i> 챗봇 기부니</a>
	                    <li><a class="dropdown-item" ${menu eq 'map' ? "active" : ''}" href="/goodM/map/kakaoMap"><i class="fa-solid fa-map-location-dot"></i> 병원찾기</a>
	                </ul>
	            </li>
	            <li class="nav-item dropdown ms-3">
	                <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
	                    <i class="far fa-list-alt"></i>Board 
	                </a>
	                <ul class="dropdown-menu">
	                    <li><a class="dropdown-item" href="/goodM/infoBoard/list?p=1&f=&q="> 심리건강정보</a>
	                    <li><a class="dropdown-item" href="/goodM/genBoard/list?p=1&f=&q="> 자유게시판</a>
	                </ul>
	            </li>

                <li class="nav-item ms-3"><!-- 마이페이지용 -->
                    <a class="nav-link ${menu eq 'user' ? "active" : ''}" href="/goodM/user/myPage"><i class="fa-solid fa-user"></i> My page</a>
                </li>              

                <li class="nav-item ms-3">
                    <a class="nav-link" href="/goodM/user/logout"><i class="fas fa-sign-out-alt"></i> 로그아웃</a>
                </li>
            </ul>
            <span class="navbar-text me-3">${uname}님 환영합니다.</span>
        </div>
    </nav>