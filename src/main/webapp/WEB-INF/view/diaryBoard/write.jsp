<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<%@ include file="../common/top.jsp" %>
	<%@ include file="../common/heading.jsp" %>
<script src="https://cdn.ckeditor.com/4.18.0/standard/ckeditor.js"></script>
</head>

<body>
	<div class="container-fluid" id="inFrame">
		<%@ include file="../common/aside.jsp" %>
			<header id="header">
				<a href="/goodM/user/main" class="logo"><strong><img src="/img/logo.png" alt="" width="30px" height="30px"></strong> by 멀캠가네 둘째 조</a>
			</header>
			<div class="row">
			<!-- Content -->
			<!-- 제목 -->
				<div class="col-sm-9">
					<h2>기분일기 작성</h2>
					<div class="row">
						<form action="/goodM/diaryBoard/write" method="post" enctype="multipart/form-data">
							<input type="hidden" name="uid" value="${uid}">
							<input type="hidden" name="date" value="${date}">
							<table class="table table-borderless">
								<tr class="d-flex" id="write-box">
									<td class="col-3"><label for="empty"></label></td>
									<td class="col-1"><label for="title">제목</label></td>
									<td class="col-6"><input class="form-control" type="text" name="title" id="title"></td>
									<td class="col-2"><label for="empty"></label></td>
								</tr>
								<tr class="d-flex" id="write-box">
									<td class="col-3"><label for="empty"></label></td>
									<td class="col-1"><label for="content">내용</label></td>
									<td class="col-6">
										<textarea class="form-control" name="content" id="content" rows="10"></textarea>
									</td>
									<td class="col-2"><label for="empty"></label></td>
								</tr>
								<tr class="d-flex" id="write-box">
									<td class="col-3"><label for="empty"></label></td>
									<td class="col-1"><label for="files">첨부<br>파일</label></td>
									<td class="col-6"><input class="form-control" type="file" name="files" id="files" multiple></td>
									<td class="col-2"><label for="empty"></label></td>
								</tr>
								<tr>
									<td colspan="2" style="text-align: center;">
										<input class="btn btn-primary" type="submit" value="저장">
										<input class="btn btn-secondary" type="reset" value="취소">
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
	</div>
	<%@ include file="../common/bottom.jsp" %>
	<script>
	CKEDITOR.replace('content', {
		filebrowserImageUploadUrl: '/goodM/file/upload',
		filebrowserUploadMethod: 'form',
		height: 400, width: 800,
	});
	</script>
</body>
</html>