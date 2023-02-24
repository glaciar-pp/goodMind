<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

		<div id="sidebar">
			<div class="inner">
		
				<!-- Search -->
					<section id="search" class="alt">
						<form method="post" action="#">
							<input type="text" name="query" id="query" placeholder="Search" />
						</form>
					</section>
		
				<!-- Menu -->
					<nav id="menu">
						<header class="major">
							<h2>Menu</h2>
						</header>
						<ul>
							<li><a href="/goodM/user/main">메인</a></li>
							<li><a href="/goodM/calendar/calendar"><i class="fa-solid fa-calendar-days"></i> 기분일기</a></li>
							<li><a href="/goodM/chat/gibuni"><i class="fa-solid fa-robot"></i> 기부니(형태 미정)</a></li>
		                                   <li><a href="/goodM/map/kakaoMap"><i class="fa-solid fa-map-location-dot"></i> 병원/기관 찾기</a></li>
							<li>
								<span class="opener">게시판</span>
								<ul>
									<li><a href="/goodM/infoBoard/list?p=1&f=&q=">심리건강정보 게시판</a></li>
									<li><a href="/goodM/genBoard/list?p=1&f=&q=">자유게시판</a></li>
								</ul>
							</li>
							
							<li><a href="#">자가진단 테스트(기입 예정)</a></li>
							<li><a href="/goodM/user/myPage">마이페이지</a></li>
		                                   <br>
		                                   <li><a href="/goodM/user/logout"><i class="fas fa-sign-out-alt"></i> 로그아웃</a></li>
						</ul>
					</nav>
		
				<!-- Section -->
					<section>
						<header class="major">
							<h2>미니 포스트</h2>
						</header>
						<div class="mini-posts">
							<article>
								<a href="#" class="image"><img src="images/pic07.jpg" alt="" /></a>
								<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
							</article>
							<article>
								<a href="#" class="image"><img src="images/pic08.jpg" alt="" /></a>
								<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
							</article>
							<article>
								<a href="#" class="image"><img src="images/pic09.jpg" alt="" /></a>
								<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
							</article>
						</div>
						<ul class="actions">
							<li><a href="#" class="button">More</a></li>
						</ul>
					</section>
		
				<!-- Section -->
					<section>
						<header class="major">
							<h2>Get in touch</h2>
						</header>
						<p>Sed varius enim lorem ullamcorper dolore aliquam aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
						<ul class="contact">
							<li class="icon solid fa-envelope"><a href="#">admin@goodM.com</a></li>
							<li class="icon solid fa-phone">(000) 000-0000</li>
							<li class="icon solid fa-home">주소</li>
						</ul>
					</section>
			</div>
		</div>
	<!-- 양식 JS -->
	<script src="/assets/js/jquery.min.js"></script>
	<script src="/assets/js/browser.min.js"></script>
	<script src="/assets/js/breakpoints.min.js"></script>
	<script src="/assets/js/util.js"></script>
	<script src="/assets/js/main.js"></script>
	<!-- 양식 CSS -->
	<link rel="stylesheet" href="/assets/css/main.css" />