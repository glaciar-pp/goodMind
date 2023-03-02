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
