<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="sidenav">
		<img alt="기분어때 로고" src="/img/logo.png" style="height:50px;">
		<br>
		<button class="btn" type="button" id="ham" data-bs-toggle="offcanvas" data-bs-target="#nav">
			<i class="fa-solid fa-bars"></i>
		</button>
		<a href="/goodM/user/home"><i class="fa-solid fa-house"></i></a>
		<a class="nav-link ${menu eq 'calendar' ? "active" : ''}" href="/goodM/calendar/calendar"><i class="fa-solid fa-calendar-days"></i></a>
		<a class="nav-link ${menu eq 'chat' ? "active" : ''}" href="/goodM/chat/gibuni"><i class="fa-solid fa-robot"></i></a>
		<a class="nav-link ${menu eq 'map' ? "active" : ''}" href="/goodM/map/kakaoMap"><i class="fa-solid fa-map-location-dot"></i></a>
		<a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
			<i class="far fa-list-alt"></i>
		</a>
			<ul class="dropdown-menu">
				<li>
					<a class="dropdown-item" style="color: #979797" href="/goodM/infoBoard/list?p=1&f=&q="> 심리건강정보 게시판</a>
				</li>
				<li>
					<a class="dropdown-item" style="color: #979797" href="/goodM/genBoard/list?p=1&f=&q="> 자유게시판</a>
				</li>
			</ul>
	</div>

	<div class="offcanvas offcanvas-start" id="nav">
		<div class="offcanvas-header">
			<h1 class="offcanvas-title">Menu</h1>
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
		</div>
		<div class="offcanvas-body">
		<hr>
		<ul>
			<li><a href="/goodM/user/main"><i class="fa-sharp fa-solid fa-house"></i>  메인</a></li>
			<li><a href="/goodM/user/about"><i class="fa-solid fa-question"></i>  소개</a></li>
			<li><a href="/goodM/calendar/calendar"><i class="fa-solid fa-calendar-days"></i>  기분일기</a></li>	
			<li><a href="/goodM/map/kakaoMap"><i class="fa-solid fa-map-location-dot"></i>  병원/기관 찾기</a></li>
			<li><a href="/goodM/infoBoard/list?p=1&f=&q="><i class="fa-regular fa-rectangle-list"></i>  심리건강정보 게시판</a></li>
			<li><a href="/goodM/genBoard/list?p=1&f=&q="><i class="fa-regular fa-rectangle-list"></i>  자유게시판</a></li>
			<li><a href="/goodM/survey/surList"><i class="fa-solid fa-list-check"></i>  자가진단 테스트</a></li>
        <c:choose>
			  <c:when test="${uid == 'admin'}">
			    <li><a href="/goodM/user/list/1"><i class="fa-solid fa-address-card"></i>  관리자페이지</a></li>
			    </c:when>
			    <c:otherwise>
			     <li><a href="/goodM/user/myPage"><i class="fa-solid fa-address-card"></i>  마이페이지</a></li>
			  </c:otherwise>
			 	</c:choose>
			<li><a href="/goodM/user/logout"><i class="fas fa-sign-out-alt"></i>  로그아웃</a></li>
		</ul>
		</div>
	</div>
