<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%	pageContext.setAttribute("newline", "\n"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common/heading.jsp" %>
    <style>
        .disabled-link { pointer-events: none; }
    </style>
</head>

<body>
    <%@ include file="../common/top.jsp" %>

    <div class="container" style="margin-top: 80px;">
        <div class="row">
            <%@ include file="../common/aside.jsp" %>
                        
            <!-- =================== main =================== -->
            <div class="col-sm-9">
                <h3>게시글 상세 조회
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
                </h3>
                <hr>
                <div class="row">
                    <div class="col-8">
                        <h5>${infoBoard.title}</h5>
                        <h6>글 번호: ${infoBoard.infoBid} | ${fn:replace(infoBoard.modTime, 'T', ' ')}</h6>
                        <h6>첨부 파일: 
                        <c:forEach var="file" items="${fileList}">
                        	<a href="/goodM/file/download?file=${file}" class="me-2" download>${file}</a>
                        </c:forEach>
                        </h6>
                    </div>
                    <div class="col-4 text-end">
                        <h5>${infoBoard.uname}</h5>
                        <h6>조회 ${infoBoard.viewCount}</h6>
                    </div>

                    <div class="col-12"><hr></div>
                    <div class="col-12">
                        ${fn:replace(infoBoard.content, newline, '<br>')}
                    </div>
                    <hr style="margin-bottom:300px">
                </div>

            </div>
        </div>
    </div>

    <%@ include file="../common/bottom.jsp" %>
</body>
</html>
