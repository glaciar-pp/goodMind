<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common/heading.jsp" %>
</head>

<body class="is-preload" style="margin-bottom:100px">
	<%@ include file="../common/aside.jsp" %>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
			<!-- 상단 로고 및 진한 선 -->
			<header id="header">
				<a href="/goodM/user/main" class="logo"><strong><img src="/img/logo.png" alt="" width="30px" height="30px"></strong> by 멀캠가네 둘째 조</a>
			</header>
			<!-- Content -->
			<section>
				<header class="main">
					<h1>회원 정보 수정</h1><!-- 제목 -->
				</header>
				<form action="/goodM/user/update" method="post">
	            	<input type="hidden" name="uid" value="${user.uid}">
	                <table class="table table-borderless">
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
	                            <input class="btn btn-secondary" type="reset" value="취소">
	                        </td>
	                    </tr>
	                </table>
	            </form>
			</section>
			</div>
		</div>
	</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>