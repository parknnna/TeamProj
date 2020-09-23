<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %> 
<%@ include file="../../Basic/head.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"> 
function check(){
	if(document.getElementById("use_point").value==""){
		document.getElementById("use_point").value=0;
	}
	document.f.submit();
}

function point(val){ //포인트계산 스크립트

	var usepoint=parseInt(val);
	var userpoint=${sedto.point};
	if (document.getElementById("use_point").value==""){
		usepoint=0;
		document.getElementById("use_point").value="";
		document.getElementById("user_point").value = 0;
	}
	if(usepoint>userpoint){
		usepoint=${sedto.point};
		document.getElementById("user_point").value = 0;
		document.getElementById("use_point").value=${sedto.point};
	}
	var resetpoint=${sedto.point}-usepoint;
	var price=${total}-usepoint;
	var save_point=Math.floor(price*0.1);
	document.getElementById("user_point").value = resetpoint;
	document.getElementById("total").value=price;
	document.getElementById("save_point").value=save_point;
}
</script>
<%@ include file="../../Basic/nav_Hotel.jsp" %>
<div align="center">${sedto.name}님의 예약 내용</div>
<div align="center" class="boxContainer" align="center" style="margin-top:100px">
<form action="hotel_resvpayment" name ="f">
<input type="hidden" name="start_resv_date" value="${start_resv_date}"/>
<input type="hidden" name="end_resv_date" value="${end_resv_date}"/>
<input type="hidden" name="member_no" value="${sedto.member_no}"/>
<input type="hidden" name="hotel_no" value="${hotel_no}"/>
<!-- 디럭스 선택 후 결제로 넘기기 -->
<c:if test="${not empty drdto}">
<input type="hidden" name="d_roomsu" value="${d_roomsu}"/>
<input type="hidden" name="d_rn" value="${d_rn}"/>
<input type="hidden" name="d_pay" value="${drdto.price * stay * d_roomsu}"/>
</c:if>
<!-- 스탠다드 선택 후 결제로 넘기기 -->
<c:if test="${not empty srdto}">
<input type="hidden" name="s_roomsu" value="${s_roomsu}"/>
<input type="hidden" name="s_rn" value="${s_rn}"/>
<input type="hidden" name="s_pay" value="${srdto.price * stay * s_roomsu}"/>
</c:if>
<!-- 패밀리 선택 후 결제로 넘기기 -->
<c:if test="${not empty frdto}">
<input type="hidden" name="f_roomsu" value="${f_roomsu}"/>
<input type="hidden" name="f_rn" value="${f_rn}"/>
<input type="hidden" name="f_pay" value="${frdto.price * stay * f_roomsu}"/>
</c:if>
<table border="1">
<c:if test="${not empty drdto}">
<tr>
	<th>체크 인 : 15:00</th>
	<th>체크 아웃 : 12:00</th>
	<th>호텔</th>
	<th>룸 등급</th>
	<th>룸 호실</th>
	<th>가격</th>
</tr>
<tr>
	<td>${start_resv_date}</td>
	<td>${end_resv_date}</td>
	<td>${hotelname}</td>
	<td>디럭스</td>
	<td>
	<c:forEach var="ho" items="${d_rn}">
	${ho}호<br>
	</c:forEach>
	</td>
	<td>
	<f:formatNumber value="${drdto.price * stay * d_roomsu}" type="number"/>
	</td>
</tr>
</c:if>
<c:if test="${not empty srdto}">
<tr>
	<th>체크 인 : 15:00</th>
	<th>체크 아웃 : 12:00</th>
	<th>호텔</th>
	<th>룸 등급</th>
	<th>룸 호실</th>
	<th>가격</th>
</tr>
<tr>
	<td>${start_resv_date}</td>
	<td>${end_resv_date}</td>
	<td>${hotelname}</td>
	<td>스탠다드</td>
	<td>
	<c:forEach var="ho" items="${s_rn}">
	${ho}호<br>
	</c:forEach>
	</td>
	<td>
	<f:formatNumber value="${srdto.price * stay * s_roomsu}" type="number"/>
	</td>
</tr>
</c:if>
<c:if test="${not empty frdto}">
<tr>
	<th>체크 인 : 15:00</th>
	<th>체크 아웃 : 12:00</th>
	<th>호텔</th>
	<th>룸 등급</th>
	<th>룸 호실</th>
	<th>가격</th>
</tr>
<tr>
	<td>${start_resv_date}</td>
	<td>${end_resv_date}</td>
	<td>${hotelname}</td>
	<td>패밀리</td>
	<td>
	<c:forEach var="ho" items="${f_rn}">
	${ho}호<br>
	</c:forEach>
	</td>
	<td>
	<f:formatNumber value="${frdto.price * stay * f_roomsu}" type="number"/>
	</td>
</tr>
</c:if>
<tr>
<td align="right">사용 포인트 : <input type="text" name="use_point"  onkeyup="point(this.value)" value="0" id="use_point"> point</td>
<td align="right">남은 포인트 : <input type="text" id="user_point" name="user_point" value="${sedto.point}" readonly> point</td>
</tr>
<tr>
<td align="left">총 금액</td>
<td align="right">
<input type="text" id="total" name="total" value="${total-usepoint}" readonly> 원
</td>
</tr>
<tr>
<td align="left"> 적립 포인트
</td>
<td align="right">
<f:parseNumber var="save_point" integerOnly="true" value="${(total-usepoint)*0.1}"/>
<input type="text" id="save_point" name="save_point" value="${save_point}" readonly> point
</td>
</tr>
</table> 
<div align="center">
<input type="submit" onclick="javascript:check();"value="결제">
</div>
</form>
</div>
<%@ include file="../../Basic/bottom_nav.jsp" %>
<!-- jstl로 값 구하기 -->
<%-- <table border="1">
<tr>
<td align="left">총 금액</td>
<td align="right">
<c:if test="${not empty drdto}">
<c:set var="d" value="${drdto.price * stay * d_roomsu}"/>
</c:if>
<c:if test="${empty drdto}">
<c:set var="d" value="0"/>
</c:if>
<c:if test="${not empty srdto}">
<c:set var="s" value="${srdto.price * stay * s_roomsu}"/>
</c:if>
<c:if test="${empty srdto}">
<c:set var="s" value="0"/>
</c:if>
<c:if test="${not empty frdto}">
<c:set var="f" value="${frdto.price * stay * f_roomsu}"/>
</c:if>
<c:if test="${empty frdto}">
<c:set var="f" value="${frdto.price * stay * f_roomsu}"/>
</c:if>
<f:formatNumber value="${d+s+f}" type="number"/>
<input type="hidden" name="total" value="${d+s+f}"/>
<f:parseNumber var="save_point" integerOnly="true" value="${(d+s+f)*0.1}"/>
<input type="hidden" name="save_point" value="${save_point}"/>
</td>
</tr>
</table> --%>
<!-- controller에서 값 받아오기. -->