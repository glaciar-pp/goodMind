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

<body style="margin-bottom:100px">
	<div class="container-fluid" id="inFrame">
	<%@ include file="../common/aside.jsp" %>
		<header id="header">
			<a href="/goodM/user/main" class="logo"><strong><img src="/img/logo.png" alt="" width="40px" height="40px"></strong>   by 멀캠가네 둘째 조</a>
		</header>
			<!-- 메인 배너 -->
			<div class="row" style="text-align: center;">
				<img src="/img/simpleBg.jpg" id="mainImg"/>	
				<h1>오늘, 기분 어때?</h1>
				<p>당신을 위한 심리건강 서비스</p>
				<p>[여러분의 기분을 기록하고 기억하고 관리해 드립니다.]</p>
				<a href="/goodM/user/about" class="button big">Learn More</a>
			</div>
			<hr>
			<!-- 서비스 목표 -->
			<h2>서비스 목표</h2>
			<div class="row row-cols-1 row-cols-md-2 g-3">
				<div class="col">
				<i class="fa-solid fa-calendar-days" id="mainIcon"></i>
					<h3>기분일기</h3>
					<p>감정분석 기능을 통해 그날그날의 기분을 알려드립니다!편하게 일기를 작성하고 기분이 어땠는지 확인해보실 수 있습니다.</p>
				</div>
				<div class="col">
				<i class="fa-solid fa-robot" id="mainIcon"></i>
					<h3>챗봇 기부니</h3>
					<p>언제든 대화상대가 되어주는 챗봇 기부니가 항상 옆에서 따라다닙니다. 편하게 대화를 나누어보세요.</p>
				</div>
				<div class="col">
				<i class="fa-solid fa-map-location-dot" id="mainIcon"></i>
					<h3>병원/기관찾기</h3>
					<p>국내 심리건강 관련 병원 및 기관 정보를 집중적으로 모아두어 빠르게 찾아보실 수 있습니다.</p>
				</div>
				<div class="col">
				<i class="fa-solid fa-heart" id="mainIcon"></i>
					<h3>게시판을 통한 정보 공유</h3>
					<p>심리건강정보 공유 게시판에 올라오는 정보를 통해 심리건강 지식을 얻고, 본인의 좋은 노하우가 있다면 자유게시판을 통해 공유해보세요.</p>
				</div>
			</div>
			<hr>
			<h2>심리건강정보 게시판</h2>
			<div class="row row-cols-1 row-cols-md-2 g-4">
			<%-- <c:forEach var="info_board" items="${infoBoardList}"> --%>
				<div class="col">
					<div class="card h-100">
						<a href="/goodM/infoBoard/detail?infoBid=${info_board.infoBid}&uid=${info_board.uid}">
							<img src="/img/기본 썸네일.png" class="card-img-top" alt="thumbnail image">
						</a>
						<div class="card-body">
							<h5 class="card-title">${info_board.title}</h5>
							<hr>
							<p class="card-text" style="color: grey">조회수: ${info_board.viewCount}</p>
							<c:if test="${today eq fn:substring(info_board.modTime, 0, 10)}">
								<p class="card-text">${fn:substring(info_board.modTime, 11, 19)}</p>
							</c:if>
							<c:if test="${not (today eq fn:substring(info_board.modTime, 0, 10))}">
								<p class="card-text">${fn:substring(info_board.modTime, 0, 10)}</p>
							</c:if>
						</div>
					</div>
				</div>
			<%-- </c:forEach> --%>
			</div>
		</div>
	<%@ include file="../common/bottom.jsp" %>
</body>
</html>