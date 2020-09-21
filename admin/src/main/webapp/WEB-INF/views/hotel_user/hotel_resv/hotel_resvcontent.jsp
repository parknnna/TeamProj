<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
<script  type="text/javascript">

function openWindowPop(url, name){
    var options = 'top=10, left=10, width=600, height=700, status=no, menubar=no, toolbar=no, resizable=no';
    window.open(url, name, options);
}

function openWindowPop1(url, name){
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
	var form = document.getElementById("f");
	var d_roomsu = $("#d_roomsu option:selected").val();
	var s_roomsu = $("#s_roomsu option:selected").val();
	var f_roomsu = $("#f_roomsu option:selected").val();

	if(d_roomsu == 0 && s_roomsu == 0 && f_roomsu == 0){
		alert("값 입력해 ㅄ아");
	}else{

		form.submit();
	}
	console.log(form);
	
	
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
<div align="right">
		<c:choose>
			<c:when test="${empty sedto}">
				<input type="button" value="로그인"
					onClick="location.href='memberlogin'" />
			</c:when>
			<c:otherwise>
				<input type="button" value="로그아웃"
					onClick="location.href = 'memberlogout'" />
			</c:otherwise>
		</c:choose>
	</div>
	<div align="center">
	<c:forTokens var="file" items="${getHotel.filename}" delims="/">
			<div>
			 <img  width="40%" height="20%" class="slide" src="c:/hotelimg/${file}">
			</div>
	</c:forTokens>
	<table>
	<tr>
	<td><p>${getHotel.hotel_info}</p></td>
	</tr>
	</table>
	</div>
	<div align="center">
		<form action="hotel_resvlist">
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
	<form id="f"  name = "f" action="hotel_resvfinal">
		<table border="1" align="center">
			<tr>
				<th>객실 유형</th>
				<th>정원</th>
				<th>가격</th>
				<th>선택사항</th>
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
				<td><a href="javascript:openWindowPop('hotel_resvroomcontent?hotel_no=${hotel_no}&grade=${1}', 'popup');">디럭스</a><br>
				${d.item}
				</td>
				<td>${d.sleeps}명</td>
				<td>${d.price}원</td>
				<td>조식 30,000원</td>
				<td>
				<select id="d_roomsu" name="d_roomsu">
							<option value="0">0개 0원</option>
							<option value="1">1개 ${d.price*1}원</option>
							<option value="2">2개 ${d.price*2}원</option>
							<option value="3">3개 ${d.price*3}원</option>
							<option value="4">4개 ${d.price*4}원</option>
							<option value="5">5개 ${d.price*5}원</option>
							<option value="6">6개 ${d.price*6}원</option>
							<option value="7">7개 ${d.price*7}원</option>
							<option value="8">8개 ${d.price*8}원</option>
							<option value="9">9개 ${d.price*9}원</option>
							<option value="10">10개 ${d.price*10}원</option>
				</select>
				</td>
			</tr>
			<tr>
				<td><a href="javascript:openWindowPop('hotel_resvroomcontent?hotel_no=${hotel_no}&grade=${2}', 'popup');">스탠다드</a><br>
				${s.item}
				</td>
				<td>${s.sleeps}명</td>
				<td>${s.price}원</td>
				<td>조식 30,000원</td>
				<td>
					<select id="s_roomsu" name="s_roomsu">
							<option value="0">0개 0원</option>
							<option value="1">1개 ${s.price*1}원</option>
							<option value="2">2개 ${s.price*2}원</option>
							<option value="3">3개 ${s.price*3}원</option>
							<option value="4">4개 ${s.price*4}원</option>
							<option value="5">5개 ${s.price*5}원</option>
							<option value="6">6개 ${s.price*6}원</option>
							<option value="7">7개 ${s.price*7}원</option>
							<option value="8">8개 ${s.price*8}원</option>
							<option value="9">9개 ${s.price*9}원</option>
							<option value="10">10개 ${s.price*10}원</option>
				</select>
				</td>
			</tr>
			<tr>
				<td><a href="javascript:openWindowPop('hotel_resvroomcontent?hotel_no=${hotel_no}&grade=${3}', 'popup');">패밀리</a><br>
				${f.item} 
				</td>
				<td>${f.sleeps} 명</td>
				<td>${f.price}원</td>
				<td>조식 30,000원</td>
				<td>
					<select id="f_roomsu" name="f_roomsu">
							<option value="0">0개 0원</option>
							<option value="1">1개 ${f.price*1}원</option>
							<option value="2">2개 ${f.price*2}원</option>
							<option value="3">3개 ${f.price*3}원</option>
							<option value="4">4개 ${f.price*4}원</option>
							<option value="5">5개 ${f.price*5}원</option>
							<option value="6">6개 ${f.price*6}원</option>
							<option value="7">7개 ${f.price*7}원</option>
							<option value="8">8개 ${f.price*8}원</option>
							<option value="9">9개 ${f.price*9}원</option>
							<option value="10">10개 ${f.price*10}원</option>
				</select>
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>