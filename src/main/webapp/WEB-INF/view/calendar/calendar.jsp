<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="height" value="${600 / numberOfWeeks}"></c:set>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common/heading.jsp" %>
   	<%@ include file="../chat/gibuni.jsp" %>
    <style>
        th { text-align: center; width: 14.28%;}
    </style>
    <script>
    	var mindClicked = false;
    	function cellClick(date) { // 빈 공간 누르면 해당날짜 일기 쓸수 있게 
    		if (mindClicked)
    			mindClicked = false;
    		else {
    			date = date + '';		
    			location.href = "/goodM/diaryBoard/write?date=" + date;  
    		}
    	}
    	function mindClick(did, uid) { //제목 누르면 해당일기 detail 페이지로 가게 
    		mindClicked = true;
    		console.log(did);
    		location.href = "/goodM/diaryBoard/detail?did=" + did + "&uid=" + uid;
    	}
    </script>
</head>

<body style="margin-bottom:100px">
	<%@ include file="../common/aside.jsp" %>
	<div class="container-fluid">
		<header id="header">
			<a href="/goodM/user/main" class="logo"><strong><img src="/img/logo.png" alt="" width="30px" height="30px"></strong> by 멀캠가네 둘째 조</a>
		</header>
		<!-- Content -->
		<!-- 제목 -->
		<h2>기분일기</h2>
		<div class="d-flex justify-content-between">
			<div>${today}</div>
			<div>
				<a href="/goodM/calendar/calendar/left2"><i class="fa-solid fa-angles-left"></i></a>
				<a href="/goodM/calendar/calendar/left"><i class="fa-solid fa-angle-left ms-2"></i></a>
				<span class="badge bg-primary mx-2">${year}.${month}</span>
				<a href="/goodM/calendar/calendar/right"><i class="fa-solid fa-angle-right me-2"></i></a>
				<a href="/goodM/calendar/calendar/right2"><i class="fa-solid fa-angles-right"></i></a>
			</div>
			<div>
				<a href="/goodM/diaryBoard/write"><i class="fa-solid fa-pen me-3"></i></a>
				<a href="/goodM/diaryBoard/list/"><i class="fa-solid fa-table-list"></i></a>
			</div>
		</div>
		<table class="table table-bordered mt-2">
			<tr>
				<th class="text-danger">일</th>
				<th>월</th><th>화</th><th>수</th><th>목</th><th>금</th>
				<th class="text-primary">토</th>
			</tr>
		<c:forEach var="week" items="${calendar}">
			<tr>
			<c:forEach var="day" items="${week}">
				<td style="height: ${height}px;" onclick="cellClick(${day.sdate})">
					<div class="d-flex justify-content-between">
					<c:if test="${day.isOtherMonth eq 1}">
						<div class="${(day.date eq 0 or day.isHoliday eq 1) ? 'text-danger' : day.date eq 6 ? 'text-primary' : ''}" 
							style="opacity: 0.5;"><strong>${day.day}</strong></div>
						<div style="opacity: 0.5;">
						<c:forEach var="name" items="${day.annivList}" varStatus="loop">
							${loop.first ? '' : '&middot;'} ${name}
						</c:forEach>
						</div>
						</c:if>
					<c:if test="${day.isOtherMonth eq 0}">
						<div class="${(day.date eq 0 or day.isHoliday eq 1) ? 'text-danger' : day.date eq 6 ? 'text-primary' : ''}">
							<strong>${day.day}</strong></div>
					<div>
					<c:forEach var="name" items="${day.annivList}" varStatus="loop">
						${loop.first ? '' : '&middot;'} ${name}
					</c:forEach>
					</div>
				</c:if>
				</div>
			<c:forEach var="diaryBoard" items="${day.diaryBoardList}" varStatus="loop">
				<div class="${loop.first ? 'mt-1' : ''}" style="font-size: 12px;" onclick="mindClick(${diaryBoard.did}, '${uid}')">
					${diaryBoard.title}
					<img src="/img/sentiImage${diaryBoard.score}.png" height="30px">                        	
				</div>
			</c:forEach>
			</td>
		</c:forEach>
		</tr>
	</c:forEach>
	</table>
	</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>