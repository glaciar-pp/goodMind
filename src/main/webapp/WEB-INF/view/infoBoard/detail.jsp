<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%	pageContext.setAttribute("newline", "\n"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common/top.jsp" %>
    <%@ include file="../common/heading.jsp" %>
     <script>
    	function likeClick(mid, uid) {
    		console.log("==============", mid, uid);
    		$.ajax({
    			type: 'GET',
    			url: '/goodM/infoBoard/like/' + mid + '/' + uid,
    			success: function(count) {
    				$('#likeCount').html(count);
    			}
    		});
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
		<h2>게시글 상세조회
	       	<span style="font-size: 0.6em;">
	               <a href="/goodM/infoBoard/list?p=${currentInfoBoardPage}&f=&q=" class="ms-5"><i class="fas fa-list-ul"></i> 목록</a>
	           
	           <!-- 본인만 수정 가능 -->
	           <c:if test="${infoBoard.uid eq uid}">
	               <a href="/goodM/infoBoard/update?infoBid=${infoBoard.infoBid}" class="ms-3"><i class="far fa-edit"></i> 수정</a>
	           </c:if>
	           <c:if test="${infoBoard.uid ne uid}">
	               <a href="#" class="ms-3 disabled-link"><i class="far fa-edit"></i> 수정</a>  
	           </c:if>
	           
	           <!-- 본인만 삭제 가능 -->
	           <c:if test="${infoBoard.uid eq uid}">
	               <a href="/goodM/infoBoard/delete?infoBid=${infoBoard.infoBid}" class="ms-3"><i class="fas fa-trash-alt"></i> 삭제</a>
	           </c:if>
	           <c:if test="${infoBoard.uid ne uid}">
	               <a href="#" class="ms-3 disabled-link"><i class="fas fa-trash-alt"></i> 삭제</a>
	           </c:if>
           </span>
		</h2>
		<div class="row">
			<div class="col-8">
				<h6>제목: ${infoBoard.title}</h6>
				<h6>글 번호: ${infoBoard.infoBid} | ${fn:replace(infoBoard.modTime, 'T', ' ')}</h6>
				<h6>첨부 파일: 
				<c:forEach var="file" items="${fileList}">
				<a href="/goodM/file/download?file=${file}" class="me-2" download>${file}</a>
				</c:forEach>
				</h6>
			</div>
			<div class="col-4 text-end">
				<h5>${infoBoard.uname}</h5>
				<h6>조회 ${infoBoard.viewCount} &nbsp;&nbsp;
				<c:if test="${infoBoard.uid eq uid}">
				 <a href="#"><i class="fa-solid fa-heart"></i></a> ${infoBoard.likeCount}
				 </c:if>
				<c:if test="${infoBoard.uid ne uid}">
				 <a href="#" onclick="likeClick(${infoBoard.infoBid}, '${uid}')">
					 <i class="fa-solid fa-heart"></i> 
				 </a>
				 <span id="likeCount">${infoBoard.likeCount}</span>
				 </c:if> </h6>
			</div>
			
			<div class="col-12"><hr></div>
			<div class="col-12">
			${fn:replace(infoBoard.content, newline, '<br>')}
			</div>
			<hr style="margin-bottom:300px">
		</div>
	</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>