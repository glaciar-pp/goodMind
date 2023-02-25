<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%	pageContext.setAttribute("newline", "\n"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common/heading.jsp" %>
</head>

<body style="margin-bottom:100px">
	<%@ include file="../common/aside.jsp" %>
	<div class="container-fluid">
		<header id="header">
			<a href="/goodM/user/main" class="logo"><strong><img src="/img/logo.png" alt="" width="30px" height="30px"></strong> by 멀캠가네 둘째 조</a>
		</header>
		<!-- Content -->
		<!-- 제목 -->
		<h2>게시글 상세 조회
		<span style="font-size: 0.6em;">
			<a href="/goodM/genBoard/list?p=${currentGenBoardPage}&f=&q=" class="ms-5"><i class="fas fa-list-ul"></i> 목록</a>
         
         <!-- 본인만 수정 가능 -->
		<c:if test="${genBoard.uid eq uid}">
			<a href="/goodM/genBoard/update?genBid=${genBoard.genBid}" class="ms-3"><i class="far fa-edit"></i> 수정</a>  <!-- bid -->
		</c:if>
		<c:if test="${genBoard.uid ne uid}">
			<a href="#" class="ms-3 disabled-link"><i class="far fa-edit"></i> 수정</a>  
		</c:if>
         
		<!-- 본인만 삭제 가능 -->
		<c:if test="${genBoard.uid eq uid}">
			<a href="/goodM/genBoard/delete?genBid=${genBoard.genBid}" class="ms-3"><i class="fas fa-trash-alt"></i> 삭제</a>
		</c:if>
		<c:if test="${genBoard.uid ne uid}">
			<a href="#" class="ms-3 disabled-link"><i class="fas fa-trash-alt"></i> 삭제</a>
		</c:if>
		</span>
		</h2>
		<!-- 내용 -->
		<div class="row">
		<div class="col-12">
			<h5>${genBoard.title}</h5>
			<h6>글 번호: ${genBoard.genBid} | ${fn:replace(genBoard.modTime, 'T', ' ')}</h6>
			<h6>첨부 파일: 
			<c:forEach var="file" items="${fileList}">
				<a href="/goodM/file/download?file=${file}" class="me-2" download>${file}</a>
			</c:forEach>
			</h6>
		</div>
		<div class="col-4 text-end">
			<h5>${genBoard.uname}</h5>
			<h6>조회 ${genBoard.viewCount}&nbsp;&nbsp;댓글 ${genBoard.replyCount}</h6>
		</div>

		<div class="col-12"><hr></div>
		<div class="col-12">
			${fn:replace(genBoard.content, newline, '<br>')}
		</div>

        <div class="col-12"><hr></div>
	        <div class="col-12">
	        <c:forEach var="reply" items="${replyList}">
	        <c:if test="${reply.isMine eq 0}">
	            <div class="d-flex flex-row mt-1">
	                <div class="card bg-light text-dark w-75">
	                    <div class="card-body">
	                        ${reply.uname}&nbsp;&nbsp;${fn:replace(reply.regDate, 'T', ' ')}<br>  
	                        ${fn:replace(reply.content, newline, '<br>')}  <!-- content -->
	                    </div>
	                </div>
	            </div>
	        </c:if>
	        <c:if test="${reply.isMine eq 1}">
	            <div class="d-flex flex-row-reverse mt-1">
	                <div class="card w-75">
	                    <div class="card-body text-end">
	                        ${reply.uname}&nbsp;&nbsp;${fn:replace(reply.regDate, 'T', ' ')}<br>  
	                        ${fn:replace(reply.content, newline, '<br>')}  <!-- content -->
	                    </div>
	                </div>
	            </div>
	        </c:if>
	        </c:forEach>
	                          
	        <form class="form-inline" action="/goodM/genBoard/reply" method="post">
	            <input type="hidden" name="genBid" value="${genBoard.genBid}">     <!-- bid -->
	            <input type="hidden" name="uid" value="${genBoard.uid}">     <!-- uid -->
	            <table class="table table-borderless mt-2">
	                <tr class="d-flex">
	                    <td class="col-1 text-end">
	                        <label for="content">댓글</label>
	                    </td>
	                    <td class="col-9">
	                        <textarea class="form-control" id="content" name="content" rows="3"></textarea>
	                    </td>
	                    <td class="col-2">
	                        <button type="submit" class="btn btn-primary">제출</button>
	                    </td>
	                </tr>
	            </table>
	        </form>
			</div>
		</div>
	</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>