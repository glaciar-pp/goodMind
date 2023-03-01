<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
      <style>
		.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
		.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
		.map_wrap {position:relative;width:100%;height:500px;}
		#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;
					background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
		.bg_white {background:#fff;}
		#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
		#menu_wrap .option{text-align: center;}
		#menu_wrap .option p {margin:10px 0;}  
		#menu_wrap .option button {margin-left:5px;}
		#placesList li {list-style: none;}
		#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
		#placesList .item span {display: block;margin-top:4px;}
		#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
		#placesList .item .info{padding:10px 0 10px 55px;}
		#placesList .info .gray {color:#8a8a8a;}
		#placesList .info .type {color:#131182;}
		#placesList .info .addr {color:#009900;}
		#placesList .item .markerbg {
					float:left;position:absolute;width:30px;
					height:44px;margin:10px 0 0 10px;}
		#placesList .item .order1 {background-position: 0 -10px;}
		#placesList .item .order2 {background-position: 0 -56px;}
		#placesList .item .order3 {background-position: 0 -102px;}
		#placesList .item .order4 {background-position: 0 -148px;}
		#placesList .item .order5 {background-position: 0 -194px;}
		#placesList .item .order6 {background-position: 0 -240px;}
		#placesList .item .order7 {background-position: 0 -286px;}
		#placesList .item .order8 {background-position: 0 -332px;}
		#placesList .item .order9 {background-position: 0 -378px;}
		#placesList .item .order10 {background-position: 0 -423px;}
		#placesList .item .marker1 {background:url(/img/marker1.png) no-repeat;}
		#placesList .item .marker2 {background:url(/img/marker2.png) no-repeat;}
		#placesList .item .marker3 {background:url(/img/marker3.png) no-repeat;}
		#placesList .item .marker4 {background:url(/img/marker4.png) no-repeat;}
		#placesList .item .marker5 {background:url(/img/marker5.png) no-repeat;}
		#pagination {margin:10px auto;text-align: center;}
		#pagination a {display:inline-block;margin-right:10px;}
		#pagination .on {font-weight: bold; cursor: default;color:black;}
		#menuToggle {position: absolute; top: 10px; right: 2%; z-index: 1;}
		#myLocation {position: absolute; top: 40px; right: 2%; z-index: 1;}
		#radiusSelect {position: absolute; top: 70px; right: 2%; z-index: 1;}
	</style>
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
	
//키워드 검색을 요청하는 함수입니다
function searchPlaces() {	
	searchData.forEach(function(searchList,index) {
	    geocoder.addressSearch(searchList.address, function(result, status) {
	        if (status === daum.maps.services.Status.OK) {
	        	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	        	
	            var marker = addMarker(coords, searchList);
	            
	     		bounds.extend(coords);
	     		
	        	function event(marker) {
	        		kakao.maps.event.addListener (marker, 'mouseover', function() {
	        			displayInfowindow(marker, searchList);
	        		});
	        		
	        		kakao.maps.event.addListener (marker, 'mouseout', function() {
	        			infowindow.close();
	        		});
	        		
	        	}
	        	
	            event(marker, searchList);
	            	            
	     		makeList(searchList, index);
	     		
	            map.setBounds(bounds);
	            
	            pagination();
	            
	        
	        } else {
	            //검색 결과가 없는 경우 searchData 배열에서 해당 검색어를 제외시킴
	            searchData.splice(index, 1);
	          }
	        
	    });
	});
}

//검색결과 항목을 Element로 반환하는 함수입니다
function makeList(searchList, index) {
	
	var listEl = document.getElementById('placesList');
	var menuEl = document.getElementById('menu_wrap');
	var fragment = document.createDocumentFragment();
	var listStr = '';	  
	
	var markerClass = '';
	
	switch(searchList.type) {
	    case '중독관리통합지원센터':
	    case '기초정신건강복지센터':
	    case '자살예방센터':
	    case '광역정신건강복지센터':
	        markerImage = 'marker1';
	        break;	    
	    case '보건소':
	        markerImage = 'marker2';
	        break;
	    case '정신재활시설':
	    case '정신요양시설':
	        markerImage = 'marker3';
	        break;
	    case '의원':
	        markerImage = 'marker4';
	        break;
	    case '공립':
	    case '국립':    
	    case '병원':
	    case '종합병원':
	    case '상급종합병원':
	        markerImage = 'marker5';
	        break;
	    default:
	        markerImage = 'marker1'; // 디폴트 값은 marker1
	        break;
	}
	
	var el = document.createElement('li');
	var itemStr = '<span class="markerbg order' + (index+1) +' '+ markerImage +  '"></span>' +
	          	  '<div class="info">' +
	        	  '   <h5>' + searchList.title + '</h5>';
		              
	itemStr +=  '  <span class="type">' + searchList.type  + '</span>' ;
	itemStr +=  '  <span class="addr">' + searchList.address  + '</span>' ;
		
	itemStr +=  '  <span><a href="' + searchList.homepage + ' +" target="blank">' + searchList.homepage + '</a></span>' +
	              '</div>';
		

	el.innerHTML = itemStr;
	el.className = 'item';


	fragment.appendChild(el);	
	
	listEl.appendChild(fragment);		
	

	// 항목 엘리먼트에 이벤트 핸들러 등록
    el.addEventListener('mouseover', function() {
        var marker = markers[index];
        displayInfowindow(marker, searchList);
    });
    
    el.addEventListener('mouseout', function() {
        infowindow.close();
    });
	
}

function pagination() {
	var currentPage = 1;  // 현재 페이지
    var totalItems = searchData.length;  // 검색 결과 총 항목 수
    var totalPages = Math.ceil(totalItems / itemsPerPage);  // 총 페이지 수
    
    
    // 페이지 번호를 계산하여 검색 결과를 표시하는 함수입니다
    function showPage(page) {
    	currentPage = page; // 현재 페이지 업데이트
        var start = (page - 1) * itemsPerPage;  // 현재 페이지의 시작 항목 인덱스
        var end = start + itemsPerPage;  // 현재 페이지의 마지막 항목 인덱스

        // 검색 결과 목록을 초기화합니다
        var listEl = document.getElementById('placesList');
        listEl.innerHTML = '';

        // 현재 페이지에 해당하는 검색 결과 항목을 표시합니다
        for (var i = start; i < end && i < totalItems; i++) {
            var searchList = searchData[i];
            makeList(searchList, i);
        }

        // 페이지 번호를 업데이트합니다
     	//검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(currentPage, totalPages) {
		    var paginationEl = document.getElementById('pagination');
		    
		   	paginationEl.innerHTML = '';
		
		    // 이전 페이지 링크를 생성합니다
		    if (currentPage > 1) {
		        var prevEl = document.createElement('a');
		        prevEl.href = '#';
		        prevEl.textContent = '이전';
		        prevEl.onclick = function() {
		            showPage(currentPage - 1);
		        };
		        paginationEl.appendChild(prevEl);
		    }
		    
		    // 페이지 번호 링크를 생성합니다
		    if(totalPages > 1) {
			    for (var i = 1; i <= totalPages; i++) {
			        var pageEl = document.createElement('a');
			        pageEl.href = '#';
			        pageEl.textContent = i;
			        if (i === currentPage) {
			            pageEl.className = 'on';
			        } else {
			            pageEl.onclick = (function(page) {
			                return function() {
			                    showPage(page);
			                };
			            })(i);
			        }
			        paginationEl.appendChild(pageEl);
			    }		    	
		    }
		    
		    // 마지막 페이지 링크를 생성합니다
		    if (currentPage == totalPages) {
		        var lastPageEl = document.createElement('a');
		        lastPageEl.href = '#';
		        lastPageEl.textContent = totalPages;
		        lastPageEl.className = 'on';
		        paginationEl.appendChild(lastPageEl);
		    } else {
		        // 다음 페이지 링크를 생성합니다
		        var nextEl = document.createElement('a');
		        nextEl.href = '#';
		        nextEl.textContent = '다음';
		        nextEl.onclick = function() {
		            showPage(currentPage + 1);
		        };
		        paginationEl.appendChild(nextEl);
		    }
		    
		    // 현재 페이지가 마지막 페이지일 때 다음 페이지 버튼 숨기기
		    if (currentPage == totalPages && totalPages != 1) {
		        var lastEl = paginationEl.lastElementChild;
		        lastEl.style.display = 'none';
		    }
		}
		displayPagination(currentPage, totalPages);
    }
 	showPage(currentPage);
    
};

function addMarker(coords, searchList) {
    var markerImageSrc = '';
    var markerImageSize = new kakao.maps.Size(30, 44);
   
    
    // orgType 값에 따라 마커 이미지를 지정합니다.
    if (searchList.type === '중독관리통합지원센터' || searchList.type === '기초정신건강복지센터' ||
 		   searchList.type === '자살예방센터' || searchList.type === '광역정신건강복지센터') {
        markerImageSrc = '/img/marker1.png';
    } else if (searchList.type === '보건소') {
        markerImageSrc = '/img/marker2.png';
    } else if (searchList.type === '정신재활시설' || searchList.type === '정신요양시설') {
        markerImageSrc = '/img/marker3.png';
    } else if (searchList.type === '의원') {
        markerImageSrc = '/img/marker4.png';
    } else if (searchList.type === '공립' || searchList.type === '국립' ||
    		searchList.type === '병원' || searchList.type === '종합병원' ||
    		searchList.type === '상급종합병원') {
        markerImageSrc = '/img/marker5.png';
    }

    var markerImage = new kakao.maps.MarkerImage(markerImageSrc, markerImageSize);
	
    var marker = new kakao.maps.Marker({
        position: coords,
        image: markerImage        
    });	
    
 	// 'searchData' 속성에 검색 결과 객체 저장
    marker.searchList = searchList;
 	
    marker.setMap(map);
    markers.push(marker);

    return marker;
}

function displayInfowindow(marker, searchList) {
    var content = '<div style="padding:5px;z-index:1;">' + searchList.title  + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

//지도에 현재 위치 마커를 표시하는 함수입니다.
function myLocation() {
    // HTML5의 geolocation으로 사용할 수 있는지 확인합니다.
    if (navigator.geolocation) {
        // GeoLocation을 이용해서 접속 위치를 얻어옵니다.
        navigator.geolocation.getCurrentPosition(function(position) {
            var lat = position.coords.latitude; // 위도
            var lon = position.coords.longitude; // 경도

            // 현재 위치를 중심으로 지도를 재설정합니다.
            var locPosition = new kakao.maps.LatLng(lat, lon);
            map.setCenter(locPosition);
            
            makeCircle(lat, lon);
           
        });
    } else {
        alert("현재 위치를 찾을 수 없습니다.");
    }
}

function makeCircle(lat, lon) {
	
	
	 
	//select 태그에서 선택된 반경값
	var radiusSelect = document.getElementById('radiusSelect');
	
		radiusSelect.onchange = function() {
			
			//이전에 그려준 원 제거
			if (circle) { 
			    circle.setMap(null);
			}
			var radius = parseInt(this.value); // 선택된 반경 값
			var center = map.getCenter(); // 현재 중심좌표 가져오기
				
			//circle 그리기
			  circle = new kakao.maps.Circle({
				  center: center, // 중심좌표
				  radius: radius * 1000, // 반경(미터 단위로 설정)
				  strokeWeight: 1, // 외곽선 두께
				  strokeColor: '#00a0e9', // 외곽선 색상
				  strokeOpacity: 1, // 외곽선 불투명도
				  strokeStyle: 'solid', // 외곽선 스타일
				  fillColor: '#00a0e9', // 채우기 색상
				  fillOpacity: 0.1 // 채우기 불투명도
			  });
		
			  // 지도에 circle 추가
			  circle.setMap(map);
		};	
	
}

</script>
</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>