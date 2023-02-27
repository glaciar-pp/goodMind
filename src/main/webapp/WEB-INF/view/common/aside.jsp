<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="offcanvas offcanvas-start" id="nav">
		<div class="offcanvas-header">
			<h1 class="offcanvas-title">Menu</h1>
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
		</div>
		<div class="offcanvas-body">
		<hr>
		<ul>
			<li>
				<a href="/goodM/user/main">메인</a>
			</li>
			<li>
				<a href="/goodM/user/about">소개</a>
			</li>
			<li>
				<a href="/goodM/calendar/calendar"><i class="fa-solid fa-calendar-days"></i> 기분일기</a>
			</li>
			<li>
            <a href="/goodM/chat/gibuni"><i class="fa-solid fa-robot"></i> 기부니(형태 미정)</a>
				
			</li>
			<li>
            	<a href="/goodM/map/kakaoMap"><i class="fa-solid fa-map-location-dot"></i> 병원/기관 찾기</a>
			</li>
			<div class="dropdown">
				<button class="btn dropdown-toggle" data-bs-toggle="dropdown">
					게시판
				</button>
				<ul class="dropdown-menu">
					<li><a href="/goodM/infoBoard/list?p=1&f=&q=">심리건강정보 게시판</a></li>
					<li><a href="/goodM/genBoard/list?p=1&f=&q=">자유게시판</a></li>
				</ul>
			</div>
			<li>
            <a href="#">자가진단 테스트(기입 예정)</a>
            </li>
             <c:choose>
			    <c:when test="${uid == 'admin'}">
			      <li>
			        <a href="/goodM/user/list/1">관리자페이지</a>
			      </li>
			    </c:when>
			    <c:otherwise>
			      <li>
			        <a href="/goodM/user/myPage">마이페이지</a>
			      </li>
			    </c:otherwise>
			 </c:choose>
            <br>
            <li>
            	<a href="/goodM/user/logout"><i class="fas fa-sign-out-alt"></i> 로그아웃</a>
			</li>
		</ul>
            <p><a href="#">admin@goodM.com</a></p>
            <p>(000) 000-0000</p>
		</div>
	</div>

	<button class="btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#nav">
		<i class="fa-solid fa-bars"></i>
	</button>