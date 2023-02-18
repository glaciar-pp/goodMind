<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common/heading.jsp" %>
    <script>
    	function search() {
    		const field = document.getElementById("field").value;
    		const query = document.getElementById("query").value;
    		console.log("search()", field, query);
    		location.href = "/goodM/infoBoard/list?p=${currentInfoBoardPage}&f=" + field + "&q=" + query;
    	}
    </script>
</head>

<body style="height: 2000px">
    <%@ include file="../common/top.jsp" %>

    <div class="container" style="margin-top: 80px;">
        <div class="row">
            <%@ include file="../common/aside.jsp" %>
            
            <!-- =================== main =================== -->
            <div class="col-sm-9">
                <table class="table table-sm table-borderless">
                    <tr class="d-flex">
                        <td class="col-6" style="text-align: left;">
                            <h3>심리건강정보
                                <span style="font-size: 0.6em;">
                                    <a href="/goodM/infoBoard/write" class="ms-5"><i class="far fa-file-alt"></i> 글쓰기</a>
                                </span>
                            </h3>
                        </td>
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
                    <tr class="table-secondary">
                        <th class="col-1">번호</th>
                        <th class="col-6">제목</th>
                        <th class="col-2">글쓴이</th>
                        <th class="col-2">날짜/시간</th>
                        <th class="col-1">조회수</th>
                    </tr>
                <c:forEach var="info_board" items="${infoBoardList}">
                    <tr>
                        <td>${info_board.infoBid}</td>
                        <td>
                        	<a href="/goodM/infoBoard/detail?infoBid=${info_board.infoBid}&uid=${info_board.uid}">${info_board.title}
                            </a>
                        </td>
                        <td>${info_board.uname}</td>
                        <td>
                        <c:if test="${today eq fn:substring(info_board.modTime, 0, 10)}">
                        	${fn:substring(info_board.modTime, 11, 19)}
                        </c:if>
                        <c:if test="${not (today eq fn:substring(info_board.modTime, 0, 10))}">
                        	${fn:substring(info_board.modTime, 0, 10)}
                        </c:if>
                        </td>
                        <td>${info_board.viewCount}</td>
                    </tr>
                </c:forEach>    
                </table>
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
            <!-- =================== main =================== -->
            
        </div>
    </div>

    <%@ include file="../common/bottom.jsp" %>
</body>
</html>