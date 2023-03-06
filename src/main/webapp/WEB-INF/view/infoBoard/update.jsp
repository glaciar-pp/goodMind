<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		<div class="col-10">
			<h2>게시글 수정</h2>
				<div class="row">
					<form action="/goodM/infoBoard/update" method="post" enctype="multipart/form-data">
			       	<input type="hidden" name="infoBid" value="${infoBoard.infoBid}">
			       	<input type="hidden" name="uid" value="${infoBoard.uid}">
			           <table class="table table-borderless">
			               <tr class="d-flex">
			                   <td class="col-2"><label for="title">제목</label></td>
			                   <td class="col-10" colspan="2"><input class="form-control" type="text" name="title" id="title" value="${infoBoard.title}"></td>
			               </tr>
			               <tr class="d-flex">
			                   <td class="col-2"><label for="content">내용</label></td>
			                   <td class="col-10" colspan="2">
			                   	<textarea class="form-control" name="content" id="content" rows="10">${infoBoard.content}</textarea>
			                   </td>
			               </tr>
			               <tr class="d-flex">
			                   <td class="col-1"><label for="files">첨부파일</label></td>
			                   <td class="col-1">삭제</td>
			                   <td class="col-10" style="text-align: left">
			                   <c:forEach var="file" items="${fileList}">
			                   	<input class="ms-2" type="checkbox" name="delFile" value="${file}"> ${file}
			                   </c:forEach>
			                   </td>
			               </tr>
			               <tr class="d-flex">
			               	<td class="col-1"></td>
			                   <td class="col-1">추가</td>
			                   <td class="col-10"><input class="form-control" type="file" name="files" id="files" multiple></td>
			               </tr>
							<tr class="d-flex">
								<td class="col-2"><label for="uid">커버 사진</label></td>
								<td class="col-10"><input class="btn btn-lavender" type="file" name="filename" value="${infoBoard.filename}"></td>
							</tr>
			               <tr>
			                   <td colspan="2" style="text-align: center;">
			                       <input class="btn btn-lavender" type="submit" value="수정">
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
			height:400, width:1000,
		});
	</script>
</body>
</html>