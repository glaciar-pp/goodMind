<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%	pageContext.setAttribute("newline", "\n"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common/top.jsp" %>
    <%@ include file="../common/heading.jsp" %>
</head>

<body>
	<div class="container-fluid" id="inFrame">
    <%@ include file="../common/aside.jsp" %>
		<header id="header">
			<a href="/goodM/user/main" class="logo"><strong><img src="/img/logo.png" alt="" width="30px" height="30px"></strong> by 멀캠가네 둘째 조</a>
		</header>
		<!-- Content -->
		<!-- 제목 -->
		<h2>기분일기 보기
		<span style="font-size: 0.5em;">
			<a href="/goodM/diaryBoard/list?p=${currentDiaryBoardPage}&f=&q=" class="ms-5"><i class="fas fa-list-ul"></i> 목록</a>
			<!-- 본인만 수정 가능 -->
			<c:if test="${diaryBoard.uid eq uid}">
				<a href="/goodM/diaryBoard/update?did=${diaryBoard.did}" class="ms-3"><i class="far fa-edit"></i> 수정</a>
			</c:if>
			<c:if test="${diaryBoard.uid ne uid}">
				<a href="#" class="ms-3 disabled-link"><i class="far fa-edit"></i> 수정</a>  
			</c:if>
		
			<!-- 본인만 삭제 가능 -->
			<c:if test="${diaryBoard.uid eq uid}">
				<a href="/goodM/diaryBoard/delete?did=${diaryBoard.did}" class="ms-3"><i class="fas fa-trash-alt"></i> 삭제</a>
			</c:if>
			<c:if test="${diaryBoard.uid ne uid}">
				<a href="#" class="ms-3 disabled-link"><i class="fas fa-trash-alt"></i> 삭제</a>
			</c:if>
		</span>
		</h2>
        <div class="row">
            <div class="col-12">
                <h5>${diaryBoard.title}</h5>
                <h6>글 번호: ${diaryBoard.did} | ${fn:replace(diaryBoard.modTime, 'T', ' ')}</h6> 
                <h6>기분: <img src="/img/sentiImage${diaryBoard.score}.png" height="30px"></h6>
                <h6>첨부 파일: 
                <c:forEach var="file" items="${fileList}">
                	<a href="/goodM/file/download?file=${file}" class="me-2" download>${file}</a>
                </c:forEach>
                </h6>
            </div>
            <div class="col-12"><hr></div>
            <div class="col-12">
                ${fn:replace(diaryBoard.content, newline, '<br>')}
            </div>
        </div>
	</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>