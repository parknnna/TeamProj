<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ include file="../../Basic/head.jsp" %>
<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
<script  type="text/javascript">
var d_leave = ${dsu};
var s_leave = ${ssu};
var f_leave = ${fsu};
setTimeout(function() {
	  alert("현재 호텔에 남은 방수는\n디럭스 : "+d_leave+"\n스탠다드 : "+s_leave+"\n패밀리 : "+f_leave);
	}, 500);
	
function check() {
	var start = f.start_resv_date.value;
	var end = f.end_resv_date.value;
	var date = new Date();
	var year = date.getFullYear(); //년도
	var month = date.getMonth() + 1; //월
	var day = date.getDate(); //일
	if ((day + "").length < 2) { // 일이 한자리 수인 경우 앞에 0을 붙여주기 위해
		day = "0" + day;
	}
	var today = year + "-" + month + "-" + day; // 오늘 날짜 (2017-02-07)
	if (start == "") {
		alert("입실 시작 날짜를 입력 해 주세요!!")
		return false;
	}
	if (end == "") {
		alert("퇴실 시작 날짜를  입력 해 주세요!!")
		return false;
	}
	if (start >= end) {
		alert("퇴실 날짜를 입실날짜 이후로 지정해주세요!!")
		return false;
	}
	var s = new Date(start);
	var t = new Date(today);
	if (s < t) {
		alert("이전 날짜는 예약할 수 없습니다.")
		return false;
	}
	return true;
}
function openWindowPop(url, name){
    var options = 'top=10, left=10, width=600, height=700, status=no, menubar=no, toolbar=no, resizable=no';
    window.open(url, name, options);
}

function openWindowPop1(url, name){
    var options = 'top=10, left=10, width=600, height=700, status=no, menubar=no, toolbar=no, resizable=no';
    window.open(url, name, options);
}

function openWindowPop2(url, name){
    var options = 'top=10, left=10, width=600, height=700, status=no, menubar=no, toolbar=no, resizable=no';
    window.open(url, name, options);
}

var index = 0;
window.onload = function(){
	slideShow();
}

function slideShow(){
	var i;
	var x = document.getElementsByClassName("slide");
	for(i=0;i<x.length;i++){
		x[i].style.display = "none";
	}
	index++;
	if(index > x.length){
		index=1;
	}
	x[index-1].style.display = "block";
	setTimeout(slideShow,2500);
}
function test(){
	var form = document.getElementById("fo");
	var d_roomsu = $("#d_roomsu option:selected").val();
	var s_roomsu = $("#s_roomsu option:selected").val();
	var f_roomsu = $("#f_roomsu option:selected").val();
	
	/* if(d_roomsu.click){
		alert("예약가능한 방이 "+droom_su+"개 남았습니다.");
	} */
	
	if(d_roomsu == 0 && s_roomsu == 0 && f_roomsu == 0){
		alert("객실을 선택해 주세요.");
	}else if(d_roomsu>d_leave){
		alert("현재 남은 방 수를 확인해 주세요.\n 현재 남은 디럭스 방 수 : "+d_leave);
	}else if(s_roomsu>s_leave){
		alert("현재 남은 방 수를 확인해 주세요.\n 현재 남은 스탠다드 방 수 : "+s_leave);
	}else if(f_roomsu>f_leave){
		alert("현재 남은 방 수를 확인해 주세요.\n 현재 남은 패밀리 방 수 : "+f_leave);
	}else{
		form.submit();
	}	
	
	
}
</script>
<%@ include file="../../Basic/nav_Hotel.jsp" %>
<body>
	<div class="boxContainer" align="center" style="margin-top:100px">
	<c:forTokens var="file" items="${getHotel.filename}" delims="/">
			<div>
			 <img  width="40%" height="20%" class="slide" src="${pageContext.request.contextPath}/resources/img/${file}">
			</div>
	</c:forTokens>
	<table>
	<tr>
		<th>
		지도 보러 가기 -> <a href="javascript:openWindowPop2('hotel_address?address=${getHotel.address}&name=${getHotel.name}', 'popup');">${getHotel.address}</a>
		</th>
	</tr>
	<tr>
	<td><p>${getHotel.hotel_info}</p></td>
	</tr>
	</table>
	</div>
	<div align="center">
		<form name="f" action="hotel_resvlist" onSubmit='return check();'>
			<table border="1">
				<tr>
					<th><label>지역</label></th>
					<td> <select name="address">
							<!-- select값 유지 -->
							<option value="서울"<c:if test="${address=='서울'}">selected</c:if>>서울</option>
							<option value="경기"<c:if test="${address=='경기'}">selected</c:if>>경기</option>
							<option value="대전"<c:if test="${address=='대전'}">selected</c:if>>대전</option>
							<option value="대구"<c:if test="${address=='대구'}">selected</c:if>>대구</option>
							<option value="부산"<c:if test="${address=='부산'}">selected</c:if>>부산</option>
							<option value="울산"<c:if test="${address=='울산'}">selected</c:if>>울산</option>
							<option value="강원"<c:if test="${address=='강원'}">selected</c:if>>강원</option>
							<option value="인천"<c:if test="${address=='인천'}">selected</c:if>>인천</option>
					</select></td>
					<th><label>체크 인</label></th>
					<td> 
					<input type="date" name="start_resv_date" value="${start_resv_date}">
					</td>
					<th> 
					<label>체크 아웃</label>
					</th>
					<td> 
					<input type="date" name="end_resv_date" value="${end_resv_date}">
					</td>
					<th><label>객실</label></th>
					<td> 
						<select name="roomsu">
								<option value="1" <c:if test="${roomsu=='1'}">selected</c:if>>1개</option>
                                <option value="2" <c:if test="${roomsu=='2'}">selected</c:if>>2개</option>
                                <option value="3" <c:if test="${roomsu=='3'}">selected</c:if>>3개</option>
                                <option value="4" <c:if test="${roomsu=='4'}">selected</c:if>>4개</option>
                                <option value="5" <c:if test="${roomsu=='5'}">selected</c:if>>5개</option>
                                <option value="6" <c:if test="${roomsu=='6'}">selected</c:if>>6개</option>
                                <option value="7" <c:if test="${roomsu=='7'}">selected</c:if>>7개</option>
                                <option value="8" <c:if test="${roomsu=='8'}">selected</c:if>>8개</option>
                                <option value="9" <c:if test="${roomsu=='9'}">selected</c:if>>9개</option>
                                <option value="10"<c:if test="${roomsu=='10'}">selected</c:if>>10개</option>
					</select></td>
					<th><label>인원</label></th>
					<td><select name="sleeps">
							  	<option value="1" <c:if test="${sleeps=='1'}">selected</c:if>>1명</option>
                                <option value="2" <c:if test="${sleeps=='2'}">selected</c:if>>2명</option>
                                <option value="3" <c:if test="${sleeps=='3'}">selected</c:if>>3명</option>
                                <option value="4" <c:if test="${sleeps=='4'}">selected</c:if>>4명</option>
                                <option value="5" <c:if test="${sleeps=='5'}">selected</c:if>>5명</option>
                                <option value="6" <c:if test="${sleeps=='6'}">selected</c:if>>6명</option>
                                <option value="7" <c:if test="${sleeps=='7'}">selected</c:if>>7명</option>
                                <option value="8" <c:if test="${sleeps=='8'}">selected</c:if>>8명</option>
                                <option value="9" <c:if test="${sleeps=='9'}">selected</c:if>>9명</option>
                                <option value="10"<c:if test="${sleeps=='10'}">selected</c:if>>10명</option>
					</select></td>
					<th><label>&nbsp;</label></th>
					<td>
						<button type="submit">검색변경</button></td>
				</tr>
			</table>
		</form>
	</div>
	<div align="left">
	<form id="fo"  name = "fo" action="hotel_resvfinal">
	<input type="hidden" name="hotel_no" value="${hotel_no}"/>
	<input type="hidden" name="stay" value="${stay}"/>
	<input type="hidden" name="start_resv_date" value="${start_resv_date}"/>
	<input type="hidden" name="end_resv_date" value="${end_resv_date}"/>
	<input type="hidden" name="member_no" value="${sedto.member_no}"/>
	<input type="hidden" name="d_roomno" value="${d_roomno}"/>
	<input type="hidden" name="s_roomno" value="${s_roomno}"/>
	<input type="hidden" name="f_roomno" value="${f_roomno}"/>
		<table border="1" align="center">
			<tr>
				<th>객실 유형</th>
				<th>정원</th>
				<th>가격</th>
				<th>객실 선택</th>
				<th>
					<c:choose>
						<c:when test="${empty sedto}">
							<input type="button" onclick="javascript:openWindowPop1('loginclear', 'popup1');" value="예약하기">
<!-- 							<a href="javascript:openWindowPop1('memberlogin', 'popup1');">예약하기</a> -->
						</c:when>
						<c:otherwise>
							<input type="button" onclick="test();" value="예약하기"/>
						</c:otherwise>
					</c:choose>
				</th>
				</tr>
				
			<tr>
				<td>
				방 상세 보러 가기 -> <a href="javascript:openWindowPop('hotel_resvroomcontent?hotel_no=${hotel_no}&grade=${1}&stay=${stay}', 'popup');">디럭스</a>
				<br>
				${d.item}
				</td>
				<td>${d.sleeps}명</td>
				<td><f:formatNumber value="${d.price*stay}" type="number"/>원</td>
				<td>
				<select id="d_roomsu" name="d_roomsu">
							<option value="0">0개 0원</option>
							<option value="1">1개
								<f:formatNumber value="${d.price*1*stay}" type="number" />원
							</option>
							<option value="2">2개
								<f:formatNumber value="${d.price*2*stay}" type="number" />원
							</option>
							<option value="3">3개
								<f:formatNumber value="${d.price*3*stay}" type="number" />원
							</option>
							<option value="4">4개
								<f:formatNumber value="${d.price*4*stay}" type="number" />원
							</option>
							<option value="5">5개
								<f:formatNumber value="${d.price*5*stay}" type="number" />원
							</option>
							<option value="6">6개
								<f:formatNumber value="${d.price*6*stay}" type="number" />원
							</option>
							<option value="7">7개
								<f:formatNumber value="${d.price*7*stay}" type="number" />원
							</option>
							<option value="8">8개
								<f:formatNumber value="${d.price*8*stay}" type="number" />원
							</option>
							<option value="9">9개
								<f:formatNumber value="${d.price*9*stay}" type="number" />원
							</option>
							<option value="10">10개
								<f:formatNumber value="${d.price*10*stay}" type="number" />원
							</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
				방 상세 보러 가기 -> <a href="javascript:openWindowPop('hotel_resvroomcontent?hotel_no=${hotel_no}&grade=${2}&stay=${stay}', 'popup');">스탠다드</a><br>
				${s.item}
				</td>
				<td>${s.sleeps}명</td>
				<td><f:formatNumber value="${s.price*stay}" type="number"/>원</td>
				<td>
					<select id="s_roomsu" name="s_roomsu">
							<option value="0">0개 0원</option>
							<option value="1">1개
								<f:formatNumber value="${s.price*1*stay}" type="number" />원
							</option>
							<option value="2">2개
								<f:formatNumber value="${s.price*2*stay}" type="number" />원
							</option>
							<option value="3">3개
								<f:formatNumber value="${s.price*3*stay}" type="number" />원
							</option>
							<option value="4">4개
								<f:formatNumber value="${s.price*4*stay}" type="number" />원
							</option>
							<option value="5">5개
								<f:formatNumber value="${s.price*5*stay}" type="number" />원
							</option>
							<option value="6">6개
								<f:formatNumber value="${s.price*6*stay}" type="number" />원
							</option>
							<option value="7">7개
								<f:formatNumber value="${s.price*7*stay}" type="number" />원
							</option>
							<option value="8">8개
								<f:formatNumber value="${s.price*8*stay}" type="number" />원
							</option>
							<option value="9">9개
								<f:formatNumber value="${s.price*9*stay}" type="number" />원
							</option>
							<option value="10">10개
								<f:formatNumber value="${s.price*10*stay}" type="number" />원
							</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
				방 상세 보러 가기 -> <a href="javascript:openWindowPop('hotel_resvroomcontent?hotel_no=${hotel_no}&grade=${3}&stay=${stay}', 'popup');">패밀리</a><br>
				${f.item} 
				</td>
				<td>${f.sleeps} 명</td>
				<td>
				<f:formatNumber value="${f.price*stay}" type="number"/>원
				</td>
				<td>
					<select id="f_roomsu" name="f_roomsu">
							<option value="0">0개 0원</option>
							<option value="1">1개
								<f:formatNumber value="${f.price*1*stay}" type="number" />원
							</option>
							<option value="2">2개
								<f:formatNumber value="${f.price*2*stay}" type="number" />원
							</option>
							<option value="3">3개
								<f:formatNumber value="${f.price*3*stay}" type="number" />원
							</option>
							<option value="4">4개
								<f:formatNumber value="${f.price*4*stay}" type="number" />원
							</option>
							<option value="5">5개
								<f:formatNumber value="${f.price*5*stay}" type="number" />원
							</option>
							<option value="6">6개
								<f:formatNumber value="${f.price*6*stay}" type="number" />원
							</option>
							<option value="7">7개
								<f:formatNumber value="${f.price*7*stay}" type="number" />원
							</option>
							<option value="8">8개
								<f:formatNumber value="${f.price*8*stay}" type="number" />원
							</option>
							<option value="9">9개
								<f:formatNumber value="${f.price*9*stay}" type="number" />원
							</option>
							<option value="10">10개
								<f:formatNumber value="${f.price*10*stay}" type="number" />원
							</option>
					</select>
				</td>
			</tr>
		</table>
		</form>
	</div>
<%@ include file="../../Basic/bottom_nav.jsp" %>