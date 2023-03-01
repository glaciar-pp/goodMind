<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common/heading.jsp" %>
</head>

<body style="margin-bottom:100px">
	<div class="container-fluid" id="inFrame">
    <%@ include file="../common/aside.jsp" %>
		<header id="header">
			<a href="/goodM/user/main" class="logo"><strong><img src="/img/logo.png" alt="" width="30px" height="30px"></strong> by 멀캠가네 둘째 조</a>
		</header>
		<!-- Content -->
		<!-- 제목 -->
		<h2>회원가입</h2>
		<form action="/goodM/user/register" method="post" enctype="multipart/form-data">
			<table class="table table-borderless">
				<tr>
					<td><label for="uid">프로필 사진</label></td>
					<td><input type="file" name="filename" value="${user.filename}"></td>
				</tr>
				<tr>
			        <td><label for="uid">사용자 ID</label></td>
			        <td><input type="text" name="uid" id="uid"></td>
			    </tr>
			    <tr>
			        <td><label for="pwd">패스워드</label></td>
			        <td><input type="password" name="pwd" id="pwd"></td>
			    </tr>
			    <tr>
			        <td><label for="pwd2">패스워드 확인</label></td>
			        <td><input type="password" name="pwd2" id="pwd2"></td>
			    </tr>
			    <tr>
			        <td><label for="uname">이름</label></td>
			        <td><input type="text" name="uname" id="uname"></td>
			    </tr>
			    <tr>
			        <td><label for="email">이메일</label></td>
			        <td><input type="text" name="email" id="email"></td>
			    </tr>
			    <tr>
			        <td colspan="2" style="text-align: center;">
			            <input class="btn btn-primary" type="submit" value="제출">
			            <input class="btn btn-secondary" type="reset" value="취소">
			        </td>
			    </tr>
			</table>
		</form>
	</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>