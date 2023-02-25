<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="/css/gibuni.css">
	<%@ include file="../common/heading.jsp" %>
	<script src="/js/gibuni.js"></script>
</head>

<body style="margin-bottom:100px">
	<%@ include file="../common/aside.jsp" %>
	<div class="container-fluid">
		<header id="header">
			<a href="/goodM/user/main" class="logo"><strong><img src="/img/logo.png" alt="" width="30px" height="30px"></strong> by 멀캠가네 둘째 조</a>
		</header>
		<!-- Content -->
		<!-- 제목 -->
		<h2>챗봇 기부니</h2>
		<div class="col-sm-9">
			<div id="wrap">
			
		    <!-- 응답 메시지 출력  -->
		    <div id="chatBox">
		    </div><br>
			
		    <!-- 질문 메시지 입력 폼 -->
	    	<form id="chatForm">
				<input type="text" id="message" name="message" size="30" placeholder="질문을 입력하세요">
				<input id="btnSubmit" type="submit" value="전송">
		    </form>
		    <br><br>
	    	</div>
		</div>
	</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>