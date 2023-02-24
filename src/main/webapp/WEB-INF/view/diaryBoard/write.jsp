<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common/heading.jsp" %>
    <script src="https://cdn.ckeditor.com/4.18.0/standard/ckeditor.js"></script>
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
					<h1>기분일기 작성</h1><!-- 제목 -->
				</header>
				<form action="/goodM/diaryBoard/write" method="post" enctype="multipart/form-data">
	            	<input type="hidden" name="uid" value="${uid}">
	            	<input type="hidden" name="date" value="${date}">
	                <table class="table table-borderless">
	                    <tr class="d-flex">
	                        <td class="col-1"><label for="title">제목</label></td>
	                        <td class="col-11"><input class="form-control" type="text" name="title" id="title"></td>
	                    </tr>
	                    <tr class="d-flex">
	                        <td class="col-1"><label for="content">내용</label></td>
	                        <td class="col-11">
	                        	<textarea class="form-control" name="content" id="content" rows="10"></textarea>
	                        </td>
	                    </tr>
	                    <tr class="d-flex">
	                        <td class="col-1"><label for="files">첨부파일</label></td>
	                        <td class="col-11"><input class="form-control" type="file" name="files" id="files" multiple></td>
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
	<script>
		CKEDITOR.replace('content', {
			filebrowserImageUploadUrl: '/goodM/file/upload',
			filebrowserUploadMethod: 'form',
			height:400, width:800,
		});
	</script>
</body>
</html>