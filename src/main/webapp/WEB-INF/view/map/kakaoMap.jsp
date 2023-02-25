<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
		#placesList .info .jibun {padding-left:26px;}
		#placesList .info .tel {color:#009900;}
		#placesList .item .markerbg {
					float:left;position:absolute;width:36px;
					height:37px;margin:10px 0 0 10px;
					background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
		#placesList .item .marker_1 {background-position: 0 -10px;}
		#placesList .item .marker_2 {background-position: 0 -56px;}
		#placesList .item .marker_3 {background-position: 0 -102px}
		#placesList .item .marker_4 {background-position: 0 -148px;}
		#placesList .item .marker_5 {background-position: 0 -194px;}
		#placesList .item .marker_6 {background-position: 0 -240px;}
		#placesList .item .marker_7 {background-position: 0 -286px;}
		#placesList .item .marker_8 {background-position: 0 -332px;}
		#placesList .item .marker_9 {background-position: 0 -378px;}
		#placesList .item .marker_10 {background-position: 0 -423px;}
		#placesList .item .marker_11 {background-position: 0 -470px;}
		#placesList .item .marker_12 {background-position: 0 -516px;}
		#placesList .item .marker_13 {background-position: 0 -562px;}
		#placesList .item .marker_14 {background-position: 0 -608px;}
		#placesList .item .marker_15 {background-position: 0 -654px;}
		#pagination {margin:10px auto;text-align: center;}
		#pagination a {display:inline-block;margin-right:10px;}
		#pagination .on {font-weight: bold; cursor: default;color:black;}
		#menuToggle {position: absolute; top: 10px; right: 1%; z-index: 1;}
	</style>
    <%@ include file="../common/heading.jsp" %>
</head>

<body style="margin-bottom:100px">
	<%@ include file="../common/aside.jsp" %>
	<div class="container-fluid">
		<header id="header">
			<a href="/goodM/user/main" class="logo"><strong><img src="/img/logo.png" alt="" width="30px" height="30px"></strong> by 멀캠가네 둘째 조</a>
		</header>
		<!-- Content -->
		<!-- 제목 -->
		<h2>주변 병원/기관 찾기</h2>
	<div class="map_wrap">
        <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
    	
        <button id="menuToggle">목록 숨기기</button>
        <div id="menu_wrap" class="bg_white">
            <div class="option">
                <div>
                    <form action="/goodM/map/kakaoMap" method="post">
                        주소 : <input type="text" value="" name="searchWord" size="15"> 
                        <button type="submit">검색하기</button> 
                    </form>
                </div>
            </div>
            <hr>
            <ul id="placesList"></ul>
            <div id="pagination"></div>
        </div>
        
    </div>

<script>
$(document).ready(function() {
      $("#menu_wrap").show();
	  $("#menuToggle").on("click", function() {
	    var menuWrap = $("#menu_wrap");
	    menuWrap.toggle();
	    var toggleButton = $("#menuToggle");
	    toggleButton.text(menuWrap.is(":visible") ? "목록 숨기기" : "목록 보이기");
	  });
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

console.log(searchData);

searchPlaces();


//키워드 검색을 요청하는 함수입니다
function searchPlaces() {
	searchData.forEach(function(searchList,index) {
	    geocoder.addressSearch(searchList.address, function(result, status) {
	        if (status === daum.maps.services.Status.OK) {
	        	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	        	
	            var marker = addMarker(coords, index);
	            
	     		bounds.extend(coords);
	     		
	        	function event(marker, searchList) {
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
	
	

	var el = document.createElement('li');
	var itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	              '<div class="info">' +
	              '   <h5>' + searchList.title + '</h5>';
	              
	itemStr +=  '  <span class="tel">' + searchList.type  + '</span>' ;
	itemStr +=  '  <span class="tel">' + searchList.address  + '</span>' ;
	
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

function addMarker(coords, index) {
	var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
    imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
    imgOptions =  {
        spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
        spriteOrigin : new kakao.maps.Point(0, (index*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
        offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
    },
    markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
        marker = new kakao.maps.Marker({
        position: coords, // 마커의 위치
        image: markerImage 
    });
	
	marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
    
    return marker;
}

function displayInfowindow(marker, searchList) {
    var content = '<div style="padding:5px;z-index:1;">' + searchList.title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}


</script>
</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>