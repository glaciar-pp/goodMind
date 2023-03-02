<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <link rel="stylesheet" href="/css/map.css">
	<%@ include file="../common/top.jsp" %>
    <%@ include file="../common/heading.jsp" %>
   	<%@ include file="../chat/gibuni.jsp" %>
</head>

<body style="margin-bottom:100px">
	<div class="container-fluid" id="inFrame">
    <%@ include file="../common/aside.jsp" %>
			<header id="header">
				<a href="/goodM/user/main" class="logo"><strong><img src="/img/logo.png" alt="" width="30px" height="30px"></strong> by 멀캠가네 둘째 조</a>
			</header>
            
       <!-- =================== main =================== -->
            <!-- Content -->
			<!-- 제목 -->
			<h2>주변 병원/기관 찾기</h2>
		    <div class="map_wrap">
		        <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
		    	
		        <button id="menuToggle">목록 숨기기</button>
		        <button id="myLocation">내 위치</button>
		        <select id="radiusSelect">
		        	<option value="1">1km</option>
		        	<option value="3">3km</option>
		        	<option value="5">5km</option>
		        </select>
		        <div id="menu_wrap" class="bg_white">
		            <div class="option">
		                <div>
		                    <form action="/goodM/map/kakaoMap" method="post">
		                        주소(동) : <input type="text" id="keyword" name="searchWord" size="15"
		                         				  placeholder="근처 동을 입력하세요!"> 
		                        <button type="submit">검색하기</button> 
		                    </form>
		                </div>
		            </div>
		            <hr>
		            <ul id="placesList"></ul>
		            <div id="pagination"></div>
		        </div>
		<!-- =================== main =================== -->
	</div>
<script>
// 목록 숨기기 토글
$(document).ready(function() {
      $("#menu_wrap").show();
	  $("#menuToggle").on("click", function() {
	    var menuWrap = $("#menu_wrap");
	    menuWrap.toggle();
	    var toggleButton = $("#menuToggle");
	    toggleButton.text(menuWrap.is(":visible") ? "목록 숨기기" : "목록 보이기");
	  });
});

//myLocation 버튼 클릭 이벤트 리스너 등록
document.getElementById('myLocation').addEventListener('click', function() {
   myLocation();
});

</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9829722c486e4c2d4f6d8477a49a1129&libraries=services,clusterer,drawing"></script>
<script src="/js/map.js"></script>
</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>