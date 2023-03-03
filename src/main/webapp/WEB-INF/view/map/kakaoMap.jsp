<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9829722c486e4c2d4f6d8477a49a1129&libraries=services,clusterer,drawing"></script>
	<script src="/js/map.js"></script>
    <link rel="stylesheet" href="/css/map.css">
	<%@ include file="../common/top.jsp" %>
    <%@ include file="../common/heading.jsp" %>
   	<%@ include file="../chat/gibuni.jsp" %>
</head>

<body>
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
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.567411643299266, 127.00568221118185), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨 
    }; 
 
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var geocoder = new daum.maps.services.Geocoder();

var ps = new kakao.maps.services.Places();  

var bounds = new kakao.maps.LatLngBounds();

var infowindow = new kakao.maps.InfoWindow({zIndex:1});


//마커를 담을 배열입니다
var markers = [];

// 초기 circle 표시안함
var circle = null;

var itemsPerPage = 10; 	//한 페이지에 표시할 항목 수

var searchData = [];
<c:forEach items="${searchList}" var="searchList">

var searchDataObj = {
 	title : "${searchList.orgName}",
	address : "${searchList.addr}",
	type : "${searchList.orgType}",
	homepage : "${searchList.homepage}"
};

searchData.push(searchDataObj);
</c:forEach>

searchPlaces();

//목록 숨기기 토글
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


</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>