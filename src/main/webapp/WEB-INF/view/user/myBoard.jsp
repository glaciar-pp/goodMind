<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common/heading.jsp" %>
   	<%@ include file="../chat/gibuni.jsp" %>
    <style>
        th, td { text-align: center; }
    </style>
    <script>
    	function search() {
    		const field = document.getElementById("field").value;
    		const query = document.getElementById("query").value;
    		console.log("search()", field, query);
    		location.href = "/goodM/myBoard/list?p=${currentMyBoardPage}&f=" + field + "&q=" + query;
    	}
    </script>
</head>

<body style="margin-bottom:100px">
	<%@ include file="../common/aside.jsp" %>
	<div class="container-fluid">
		<header id="header">
			<a href="/goodM/user/main" class="logo"><strong><img src="/img/logo.png" alt="" width="30px" height="30px"></strong> by 멀캠가네 둘째 조</a>
		</header>
		<!-- Content -->
		<!-- 제목 -->
		<h2>나의 글 목록
			<span style="font-size: 0.6em;"></span>
		</h2>
		<br>
		<h2>심리건강정보 게시판</h2>
		<table class="table table-sm table-borderless">
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
			<div class="row row-cols-1 row-cols-md-2 g-4">
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
		<br>
		<h2>자유 게시판</h2>
		<tr class="d-flex">
		    <td class="col-2">
		        <select class="form-select me-2" name="f" id="field">
					<option value="title" selected>제목</option>
					<option value="content">본문</option>
					<option value="uname">글쓴이</option>
		        </select>
		    </td>
		    <td class="col-3">
		        <input class="form-control me-2" type="search" placeholder="검색 내용" name="q" id="query">
		    </td>
		    <td class="col-1">
		        <button class="btn btn-outline-primary" onclick="search()">검색</button>
	        </td>
	    </tr>
		</table>
		<hr>
		<table class="table mt-2">
		    <tr class="table-secondary ">
				<!-- <th class="col-1">번호</th> -->
				<th class="col-6">제목</th>
				<th class="col-2">글쓴이</th>
				<th class="col-2">날짜/시간</th>
				<th class="col-1">조회수</th>
		    </tr>
			<c:forEach var="genBoard" items="${genBoardList}">
			<tr>
			   <%--  <td>${genBoard.genBid}</td> --%>
				<td>
					<a href="/goodM/genBoard/detail?genBid=${genBoard.genBid}&uid=${genBoard.uid}">${genBoard.title}
				<c:if test="${genBoard.replyCount ge 1}">
				   	<span class="text-danger">[${genBoard.replyCount}]</span>
				</c:if>
				    </a>
				</td>
				<td>${genBoard.uname}</td>
				<td>
				<c:if test="${today eq fn:substring(genBoard.modTime, 0, 10)}">
					${fn:substring(genBoard.modTime, 11, 19)}
				</c:if>
				<c:if test="${not (today eq fn:substring(genBoard.modTime, 0, 10))}">
					${fn:substring(genBoard.modTime, 0, 10)}
				</c:if>
				</td>
				<td>${genBoard.viewCount}</td>
			</tr>
			</c:forEach> 
		</table>
		<ul class="pagination justify-content-center mt-4">
			<c:if test="${currentMyBoardPage gt 10}">
				<li class="page-item"><a class="page-link" href="/goodM/myBoard/list?p=${startPage - 1}&f=${field}&q=${query}">&laquo;</a></li>
			</c:if>
			<c:if test="${currentMyBoardPage le 10}">
				<li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
			</c:if>
			<c:forEach var="page" items="${pageList}" varStatus="loop">    
				<li class="page-item ${(currentMyBoardPage eq page) ? 'active' : ''}">
					<a class="page-link" href="/goodM/myBoard/list?p=${page}&f=${field}&q=${query}">${page}</a>
				</li>
			</c:forEach>  
			<c:if test="${totalPages gt endPage}">                    
				<li class="page-item"><a class="page-link" href="/goodM/myBoard/list?p=${endPage + 1}&f=${field}&q=${query}">&raquo;</a></li>
			</c:if>
			<c:if test="${totalPages le endPage}">                    
				<li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>