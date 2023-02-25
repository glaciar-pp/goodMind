<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common/heading.jsp" %>
</head>

<body style="margin-bottom:100px">
	<div class="container-fluid">
		<header id="header">
			<a href="/goodM/user/main" class="logo"><strong><img src="/img/logo.png" alt="" width="30px" height="30px"></strong> by 멀캠가네 둘째 조</a>
		</header>
		<!-- Content -->
		<!-- 제목 -->
		<h2>로그인
		<span style="font-size: 0.5em;">
			<a href="/goodM/user/register" class="ms-5"><i class="fas fa-user-plus"></i> 회원가입</a>
		</span>
		</h2>
		<div class="box">
			<form action="/goodM/user/login" method="post">
				<table class="table table-borderless">
				    <tr>
				        <td><label for="uid" class="col-form-label">아이디</label></td>
				        <td><input type="text" name="uid" id="uid" class="form-control" placeholder="아이디"></td>
				    </tr>
				    <tr>
				        <td><label for="pwd" class="col-form-label">패스워드</label></td>
				        <td><input type="password" name="pwd" id="pwd" class="form-control" placeholder="패스워드"></td>
				    </tr>
				    <tr>
				        <td colspan="2" style="text-align: center;">
				            <input class="btn btn-primary" type="submit" value="로그인">
				            <input class="btn btn-secondary" type="reset" value="취소">
				        </td>
				    </tr>
				</table>
			</form>
		</div>
	</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>