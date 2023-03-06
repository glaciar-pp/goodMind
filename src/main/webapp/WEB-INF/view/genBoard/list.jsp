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
			location.href = "/goodM/genBoard/list?p=${currentGenBoardPage}&f=" + field + "&q=" + query;
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
		<h2>자유게시판 목록
			<span style="font-size: 0.6em;">
				<a href="/goodM/genBoard/write" class="ms-5"><i class="far fa-file-alt"></i> 글쓰기</a>
			</span>
		</h2>
		<table class="table table-sm table-borderless">
			<tr class="d-flex">
				<td class="col-6"></td>
				<td class="col-2">
					<select class="form-select me-2" name="f" id="search-a">
						<option value="title" selected>제목</option>
						<option value="content">본문</option>
						<option value="uname">글쓴이</option>
					</select>
				</td>
				<td class="col-3">
					<input class="form-control me-2" type="search" placeholder="검색 내용" name="q"id="search-b">
				</td>
				<td class="col-1">
					<button class="btn btn-lavender" onclick="search()">검색</button>
				</td>
			</tr>
		</table>
		<hr>
		<p id="source" style="text-align: center;">
			😊의견을 나눌 수 있는 자유게시판 입니다😊<br>
			서로의 일상이나 심리건강에 좋은 정보를 공유해보세요.<br>
			-----------------------------------------<br>
			개인정보 유·노출, 상업성 광고, 저속한 표현, 특정인에 대한 명예훼손 및 비방, 정치적 목적이나 성향, 반복적 게시물, 게시판의 성격에 맞지 않은 글 등은 관리자에 의해 통보 없이 삭제됩니다.<br>
			또한, 홈페이지를 통하여 불법유해 정보를 게시하거나 배포하면 「정보통신망 이용촉진 및 정보보호 등에 관한 법률 제74조」에 의거 1년 이하의 징역 또는 1천만원 이하의 벌금에 처해질 수 있습니다.<br>
			※ 관련법령 : 개인정보보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등<br>
		</p>	
		<div class="row">
			<div class="col-1"></div>
			<div class="col-10">
				<table class="table mt-2">
					<tr class="table" style="background-color: #ccccff; vertical-align: middle;">
					<th class="col-1">번호</th>
					<th class="col-5">제목</th>
					<th class="col-2">글쓴이</th>
					<th class="col-2">날짜/시간</th>
					<th class="col-1">조회수</th>
					<th class="col-1">좋아요</th>
					</tr>
						<c:forEach var="genBoard" items="${genBoardList}">
					<tr>
						<td>${genBoard.genBid}</td>
						<td style="text-align: left;">
							<a class="listTitle" href="/goodM/genBoard/detail?genBid=${genBoard.genBid}&uid=${genBoard.uid}">${genBoard.title}
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
						<td>${genBoard.likeCount}</td>
					</tr>
					</c:forEach>    
				</table>
				<ul class="pagination justify-content-center mt-4">
					<c:if test="${currentGenBoardPage gt 10}">
						<li class="page-item"><a class="page-link" href="/goodM/genBoard/list?p=${startPage - 1}&f=${field}&q=${query}">&laquo;</a></li>
					</c:if>
					<c:if test="${currentGenBoardPage le 10}">
						<li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
					</c:if>
					<c:forEach var="page" items="${pageList}" varStatus="loop">    
						<li class="page-item ${(currentGenBoardPage eq page) ? 'active' : ''}">
							<a class="page-link" href="/goodM/genBoard/list?p=${page}&f=${field}&q=${query}">${page}</a>
						</li>
					</c:forEach>  
					<c:if test="${totalPages gt endPage}">                    
						<li class="page-item"><a class="page-link" href="/goodM/genBoard/list?p=${endPage + 1}&f=${field}&q=${query}">&raquo;</a></li>
					</c:if>
					<c:if test="${totalPages le endPage}">                    
						<li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
					</c:if>
				</ul>
			</div>	
		<div class="col-1"></div>
	</div>
</div>	
<%@ include file="../common/bottom.jsp" %>
</body>
</html>