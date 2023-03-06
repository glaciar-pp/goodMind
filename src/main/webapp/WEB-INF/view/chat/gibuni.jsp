<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="/js/gibuni.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/gibuni.css">
</head>

<body>
	<div class="container">  
		<img src="/img/gibuniBtn.png" alt="챗봇 버튼" id="btnImage" data-bs-toggle="modal" data-bs-target="#myModal">
		<!-- The Modal -->
		<div class="modal fade" id="myModal" tabindex="-1">
			<div class="modal-dialog">
		    <div class="modal-content">
		      	<!-- Modal Header -->
				<div class="modal-header">
		        	<h3 class="modal-title">기부니 챗봇</h3>
		        	<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
		      	</div>
		
		      	<!-- Modal body -->
		      	<div class="modal-body">
					<div id="wrap">
					
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
		</div>
	</div>
</body>
</html>