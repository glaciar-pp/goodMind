<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common/heading.jsp" %>
   	<link rel="stylesheet" href="/assets/css/main.css" />
</head>

<body class="is-preload" style="margin-bottom:100px">
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
					<h1>로그인
						 <span style="font-size: 0.5em;">
	                        <a href="/goodM/user/register" class="ms-5"><i class="fas fa-user-plus"></i> 회원가입</a>
	                    </span>
					</h1>
				</header>
				<div class="box">
                <form action="/goodM/user/login" method="post">
                   <div class="row gtr-uniform">
						<div class="col-4 col-12-small">
							<input type="text" name="uid" id="uid" class="form-control" placeholder="아이디">
						</div>
						<div class="col-4 col-12-small">
							<input type="password" name="pwd" id="pwd" class="form-control" placeholder="패스워드">
						</div>
                           <!-- Break -->
						<div class="col-12">
							<ul class="actions">
								<li><input type="submit" value="로그인" class="primary" /></li>
								<li><input type="reset" value="Reset" /></li>
							</ul>
						</div>
					</div>
                </form>
                </div>
			</section>
			</div>
		</div>
	</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>