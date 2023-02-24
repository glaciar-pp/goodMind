<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="/css/gibuni.css">
	<%@ include file="../common/heading.jsp" %>
	<script src="/js/gibuni.js"></script>
</head>
<body>
    <div class="container" style="margin-top: 80px;">
        <div class="row">
            <%@ include file="../common/aside.jsp" %>  
            <!-- =================== main =================== -->
            <div class="col-sm-9">
			    <div id="wrap">
			
				      <!-- Header -->
				    <h1>챗봇 서비스</h1>
				
				    <!-- 응답 메시지 출력  -->
				    <div id="chatBox">
				    </div><br>
				
				    <!-- 질문 메시지 입력 폼 -->
				    <form id="chatForm">
				      <input type="text" id="message" name="message" size="30" placeholder="질문을 입력하세요">
				      <input id="btnSubmit" type="submit" value="전송">
				    </form>
				    <br><br>
			    </div>
   			</div>
		</div>
	</div>
  </body>
</html>