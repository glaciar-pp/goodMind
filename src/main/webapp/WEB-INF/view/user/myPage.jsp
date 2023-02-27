<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common/heading.jsp" %>
</head>

<body style="margin-bottom:100px">
	<%@ include file="../common/aside.jsp" %>
	<div class="container-fluid">
		<header id="header">
			<a href="/goodM/user/main" class="logo"><strong><img src="/img/logo.png" alt="" width="30px" height="30px"></strong> by 멀캠가네 둘째 조</a>
		</header>
		<!-- Content -->
		<!-- 제목 -->
		<h2>My page</h2><br>
		<!-- 프로필 이미지 -->
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
			<a href="/goodM/user/update/${user.uid}" class="ms-3"><i class="far fa-edit"></i>정보 수정</a>
			<table  class="table table-hover" style="margin-bottom: 80px;">
				<tr class="table-secondary">
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
			<br><br><br><br><br><br><br><br><br>
			<span style="font-size: 1.0em;">
				<a href="/goodM/user/delete/${user.uid}" class="ms-3"><i class="fas fa-trash-alt"></i>계정 탈퇴</a>
			</span>
	</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>