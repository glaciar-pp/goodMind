<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common/top.jsp" %>
    <%@ include file="../common/heading.jsp" %>
   	<%@ include file="../chat/gibuni.jsp" %>
    <script>
    	function search() {
    		const field = document.getElementById("field").value;
    		const query = document.getElementById("query").value;
    		console.log("search()", field, query);
    		location.href = "/goodM/infoBoard/list?p=${currentInfoBoardPage}&f=" + field + "&q=" + query;
    	}
    </script>
</head>

<body>
	<div class="container-fluid" id="inFrame">
    <%@ include file="../common/aside.jsp" %>
		<header id="header">
			<a href="/goodM/user/main" class="logo"><strong><img src="/img/logo.png" alt="" width="30px" height="30px"></strong> by 멀캠가네 둘째 조</a>
		</header>
		<!-- Content -->
		<!-- 제목 -->
		<h2>심리건강정보</h2>
			<span style="font-size: 0.6em;">
				<a href="/goodM/infoBoard/write" class="ms-5"><i class="far fa-file-alt"></i> 글쓰기</a>
			</span>
			<table class="table table-sm table-borderless">
				<tr class="d-flex">
					<!-- 검색 기능 -->
					<td class="col-6">
					</td>
					<td class="col-2">
						<select class="form-select me-2" name="f" id="search-a">
							<option value="title" selected>제목</option>
							<option value="content">본문</option>
							<option value="uname">글쓴이</option>
						</select>
					</td>
					<td class="col-3">
						<input class="form-control me-2" type="search" placeholder="검색 내용" name="q" id="search-b">
					</td>
					<td class="col-1">
						<button class="btn btn-outline-primary" onclick="search()">검색</button>
					</td>
				</tr>
			</table>
			<hr>
			<div class="row row-cols-1 row-cols-sm-2 row-cols-lg-3 row-cols-xl-4 g-4">
			<c:forEach var="info_board" items="${infoBoardList}">
				<div class="col">
					<div class="card h-100">
						<a href="/goodM/infoBoard/detail?infoBid=${info_board.infoBid}&uid=${info_board.uid}">
							<img src="/img/기본 썸네일.png" class="card-img-top" alt="thumbnail image">
						</a>
						<div class="card-body">
							<h5 class="card-title">${info_board.title}</h5>
							<hr>
							<p class="card-text" style="color: grey">조회수: ${info_board.viewCount}</p>
							<c:if test="${today eq fn:substring(info_board.modTime, 0, 10)}">
								<p class="card-text">${fn:substring(info_board.modTime, 11, 19)}</p>
							</c:if>
							<c:if test="${not (today eq fn:substring(info_board.modTime, 0, 10))}">
								<p class="card-text">${fn:substring(info_board.modTime, 0, 10)}</p>
							</c:if>
						</div>
					</div>
				</div>
			</c:forEach>
			</div>
		<!--페이지네이션-->
		<ul class="pagination justify-content-center mt-4">
			<c:if test="${currentInfoBoardPage gt 10}">
				<li class="page-item"><a class="page-link" href="/goodM/infoBoard/list?p=${startPage - 1}&f=${field}&q=${query}">&laquo;</a></li>
			</c:if>
			<c:if test="${currentInfoBoardPage le 10}">
				<li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
			</c:if>
			<c:forEach var="page" items="${pageList}" varStatus="loop">    
				<li class="page-item ${(currentInfoBoardPage eq page) ? 'active' : ''}">
					<a class="page-link" href="/goodM/infoBoard/list?p=${page}&f=${field}&q=${query}">${page}</a>
				</li>
			</c:forEach>  
			<c:if test="${totalPages gt endPage}">                    
				<li class="page-item"><a class="page-link" href="/goodM/infoBoard/list?p=${endPage + 1}&f=${field}&q=${query}">&raquo;</a></li>
			</c:if>
			<c:if test="${totalPages le endPage}">                    
				<li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>