<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="../common/top.jsp" %>
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
		<h2>회원정보 수정</h2>
		<form action="/goodM/user/update" method="post" enctype="multipart/form-data">
			<input type="hidden" name="uid" value="${user.uid}">
			<table class="table table-borderless">
				<tr>
					<td><label for="filename">프로필 사진</label></td>
					<td><input type="file" name="filename" id="filename"></td>
				</tr>
				<tr>
			        <td><label for="uid">사용자 ID</label></td>
			        <td><input type="text" name="uid" value="${user.uid}" disabled></td>
				</tr>
				<tr>
				    <td><label for="pwd">패스워드</label></td>
				    <td><input type="password" name="pwd"></td>
				</tr>
				<tr>
				    <td><label for="pwd2">패스워드 확인</label></td>
				    <td><input type="password" name="pwd2"></td>
				</tr>
				<tr>
				    <td><label for="uname">이름</label></td>
				    <td><input type="text" name="uname" value="${user.uname}"></td>
				</tr>
				<tr>
				    <td><label for="email">이메일</label></td>
				    <td><input type="text" name="email" value="${user.email}"></td>
				</tr>
				<tr>
			    <td colspan="2" style="text-align: center;">
	                <input class="btn btn-primary" type="submit" value="제출">
	                <button class="btn btn-secondary" onclick="location.href='/goodM/user/myPage/'">취소</button>
	            </td>
		        </tr>
		    </table>
		</form>
	</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>