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
		        	<option value="0">반경삭제</option>
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
		                        <button id="submit" type="submit">검색하기</button> 
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
<br>
<br>
	<h3 style="text-align: center;">-주변 병원/기관 찾기 사용방법-</h3>
	<div id="surRes">
		<p>
			1. 지도와 검색 및 목록창을 통해 원하시는 병원 또는 기관을 찾으실 수 있습니다.<br>
			깔끔하게 지도만 보고싶을땐 목록 숨기기 버튼을 눌러주세요.<br>
			2. "내 위치"를 사용하시고자 할때 사용자 위치 엑세스 권한이 필요합니다.<br>
			서비스 이용을 위함이니 허용해주세요.<br>
			3. 내 위치 하단에 있는 1km / 3km / 5km 반경 보기 도구도 활용해보세요.<br>
			<br>
			※마커 분류<br>
			<img src="/img/marker1.png" >= 중독관리통합지원센터, 기초정신건강복지센터, 자살예방센터, 광역정신건강복지센터, 이외 기본값<br>
		    <img src="/img/marker2.png" >= 보건소<br>
		    <img src="/img/marker3.png" >= 정신재활시설, 정신요양시설<br>
		    <img src="/img/marker4.png" >= 의원<br>
		    <img src="/img/marker5.png" >= 공립, 국립, 병원, 종합병원, 상급종합병원<br>
		</p>
	</div>
</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>