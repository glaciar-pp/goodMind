<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common/heading.jsp" %>
</head>

<body>
	<div class="container-fluid" id="inFrame">
    <%@ include file="../common/aside.jsp" %>
		<header id="header">
			<a href="/goodM/user/main" class="logo"><strong><img src="/img/logo.png" alt="" width="30px" height="30px"></strong> by 멀캠가네 둘째 조</a>
		</header>
		<!-- Content -->
		<!-- 제목 -->
		<h2>My page</h2>
		<br>
		<!-- 프로필 이미지 -->
		<div class="row">
			<div class="col-3" id="myPageNav">
				<ol>
					<li><a href="/goodM/user/update/${user.uid}"><i class="far fa-edit"></i> 정보 수정</a></li>
					<li><a href="/goodM/user/myBoard/"><i class="fa-regular fa-rectangle-list"></i> 내 글 목록 바로가기</a></li>
					<li><a href="/goodM/diaryBoard/write"><i class="fa-solid fa-pen"></i>오늘의 기분일기 작성하기</a></li>
					<li><a href="#">---</a></li>
					<li><a href="/goodM/user/deleteUser/${user.uid}"><i class="fas fa-trash-alt"></i> 계정 탈퇴</a></li>
					<li><a href="#">---</a></li>
					<li><a href="#">---</a></li>
					<li><a href="#">---</a></li>
					<li><a href="#" style="vertical-align: bottom;">※추후 기능 업데이트 예정🥰</a>
				</ol>
			</div>
			<div class="col-9">
				<div class="d-flex justify-content-center">
					<c:if test="${empty user.filename}">
						<img class="rounded-circle" width="20%" src="/img/profile.png">
					</c:if>
					<c:if test="${not empty user.filename}">
						<img class="rounded-circle" width="20%" src="/goodM/file/download?file=${user.filename}">
					</c:if>
				</div>
				<br>
				<!-- 마이페이지 내 정보 -->                   
				<table  class="table table-hover">
					<tr class="table" style="background-color: #ccccff; vertical-align: middle;">
						<th class="col-2">항목</th>
						<th class="col-6">회원 정보</th>
					</tr>
					<tr class="col-3">
					<!-- 정보 띄우는 구간 -->
						<td><label for="uid" class="col-form-label">아이디</label></td>
						<td class="col-2">${user.uid}</td>
					</tr >
					<tr>
						<td><label for="uname" class="col-form-label">성명</label></td>
						<td class="col-2">${user.uname}</td>
					</tr>  
					<tr>
						<td><label for="email" class="col-form-label">이메일</label></td>
						<td class="col-2">${user.email}</td>
					</tr>
					<tr>
						<td><label for="regDate" class="col-form-label">가입일</label></td>
						<td class="col-2">${user.regDate}</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>