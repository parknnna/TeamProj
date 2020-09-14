<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page 
import="java.io.BufferedReader" 
import= "java.io.InputStreamReader" 
import= "java.net.HttpURLConnection" 
import= "java.net.URL" 
import= "java.net.URLEncoder" 
%>

<%! 
StringBuffer sb; 
String clientId = "myHKbQ3U9wUwVEwObvqV";// 애플리케이션 클라이언트 아이디값"; 
String clientSecret = "KEENDJMC9a";// 애플리케이션 클라이언트 시크릿값";\ 
%>

<%@ include file="Basic/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.0/css/all.min.css"/>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <meta charset="utf-8">
    <style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:10px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:absolute;width:100%;height:500px;float:right;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:50%;height:500px;margin:0 auto;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:10px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h6, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
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
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
</head>
<body>
<%
	String mapcate = request.getParameter("map-category");
	String maploc = request.getParameter("map-location");
	String pname = request.getParameter("pname");
	
	/* int location = Integer.parseInt(request.getParameter("map-location"));
	double x=0;
	double y=0;
	
	switch(location){
	case 0: //서울 
		x=37.53382245583012;
		y=126.99503312444533;
		break;
	case 1: //경기 
		x=37.61594648375436;
		y=127.23145684261847;
		break;
	case 2: //대전
		x=36.3321670022493;
		y=127.44374111207075;
		break;
	case 3: //대구 
		x=35.87311045010902;
		y=128.59340577644787;
		break;
	case 4: //부산 
		x=35.157320178485385;
		y=129.0674864652655;
		break;
	case 5: //울산
		x=35.53507214979942;
		y=129.3117932913699;
		break;
	case 6: //강원 
		x=37.75796038534426;
		y=128.89703376235292;
		break;
	case 7: //인천 
		x=37.488784592240705;
		y=126.72843353464472;
		break;
	}
	if(location==0){
		maploc="서울";
	}else if(location==1){
		maploc="경기";
	}else if(location==2){
		maploc="대전";
	}else if(location==3){
		maploc="대구";
	}else if(location==4){
		maploc="부산";
	}else if(location==5){
		maploc="울산";
	}else if(location==6){
		maploc="강원";
	}else if(location==7){
		maploc="인천";
	} */
	String mapcate2=maploc+" "+mapcate;
%>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light scolled sleep scrolled awake" id="ftco-navbar">
    <div class="container">
      <a class="navbar-brand" href="index">DProject</a>
      <div class="collapse navbar-collapse" id="ftco-nav">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item"><a href="index" class="nav-link-1">Home</a></li>
          <li class="nav-item"><a href="about" class="nav-link-1">Bus</a></li>
          <li class="nav-item"><a href="hotel" class="nav-link-1">Hotels</a></li>
          <li class="nav-item"><a href="restaurant" class="nav-link-1">Restaurant</a></li>
          <li class="nav-item"><a href="board_list.do" class="nav-link-1">Forum</a></li>
         </ul>
      </div>
      
      <div class="header-btns" id="ftco-nav">
      	<ul class="navbar-nav">
      	<li class="nav-item cta"><a href="contact" class="nav-link"><span>Login</span></a>
      		<ul class="submenu">
      			<li><a href="blog.html" class="submenu-1-first" style="color:black">My Page</a></li>
      			<li><a href="blog_details.html" class="submenu-1-second" style="color:black">Wish List</a></li>
                <li><a href="blog_details.html" class="submenu-1-third" style="color:black">Sign Up</a></li>
      		</ul>
      	</li>
      	</ul>
      </div>
      </div> 
  </nav>
<div align="left" style="width:80%; margin:90px auto 2px auto;">
	<h3 style="font-family: 'Do Hyeon', sans-serif;"><%=mapcate2 %> 검색 결과</h3>
</div>
<div>
<div class="map_wrap">
    <div id="map" style="width:60%;height:100%;position:relative;float:right;" ></div>
</div>
    <div id="menu_wrap" class="bg_white" style="width:40%;height:500px;position:relative;float:left;">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    <input type="text" value="<%=mapcate2%>" id="keyword" size="15" style="display:none;"> 
                    <input type="text" value="<%=mapcate%>" id="mapcate" size="15" style="display:none;">
                    <input type="text" value="<%=maploc%>" id="maploc" size="15" style="display:none;">
                    <button type="submit" style="display:none;"></button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a0d77b87f2ec786a69a1ed0c16587f57&libraries=services"></script>
<script>

// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.53382245583012, 126.99503312444533), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

var mapcate = document.getElementById('mapcate').value;
var maploc = document.getElementById('maploc').value;

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch(keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '<a href="search.do?map-category='+mapcate+'&map-location='+maploc+'&pname='+places.place_name+
                		'"><h6>' + places.place_name + '</h6></a>';
	
    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    var Pname=places.place_name;
    
    return el;    
}


// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>
<div align="center" style="margin-top:500px; position:absolute;">
<%  
int cnt=0;
int p=5;
int display = 5; // 검색결과갯수. 최대100개  
try { 
	String text = URLEncoder.encode(pname, "UTF-8"); 
	String apiURL = "https://openapi.naver.com/v1/search/webkr.json?query=" + text+"&display="+display; 
	URL url = new URL(apiURL); 
	HttpURLConnection con = (HttpURLConnection) url.openConnection();

	con.setRequestMethod("GET"); 
	con.setRequestProperty("X-Naver-Client-Id", clientId); 
	con.setRequestProperty("X-Naver-Client-Secret", clientSecret); 
	int responseCode = con.getResponseCode(); 
	BufferedReader br; 
	if (responseCode == 200) { 
		br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8")); 
		} else { 
			br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8")); 
			} 
	sb = new StringBuffer(); 
	String line; 
	
	
	
	int b=0;
	while ((line = br.readLine()) != null) { 
	b++;
	if(b>6 &&38>b){
	if(cnt==0){
		%><div><table align="left" border="1"><%
	}
	if(0==cnt || cnt==5 ){
	}else{
		String a[]=line.split(":");
		if(cnt==1){}else{
		%><tr><%}
		for(int i=0;i<a.length;i++){
			if(i==0){
				if(a[0].contains("title")) p=0;
				if(a[0].contains("link")) p=1;
				if(a[0].contains("description")) p=2;
			}
			if(i>1){}else{
			%><td><% }
			if(p==0){%><font style="font-weight:700"><%}
			if(p==1){%><a href="<%=a[2]%>"><%}
			if(p==2){%><font><%}
			
			if(i>0){
				if(p==1){
					if(i>1) continue;
					%>이동<%
				}else{
					%><%=a[i].substring(2,a[i].length()-2)%><% 
				}
			}
			if(p==0){%></font><%}
			if(p==1){%></a><%}
			if(p==2){%></font><%}		
			
		}
		%></td><% 
		if(cnt==1){}else{
		%><tr><%}
	}
			cnt++;
	
	if(cnt>5){
		cnt=0;
		%></table></div><%
	}}
	} 
	br.close(); 
	con.disconnect();
} catch (Exception e) { 
	System.out.println(e);
} 
%> 
</div>
</body>
</html>