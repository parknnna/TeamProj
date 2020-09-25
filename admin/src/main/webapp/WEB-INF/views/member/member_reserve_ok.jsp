<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ include file="../Basic/head.jsp" %>
 <%@ include file="../Basic/nav_Login.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript"> 
	function point(val){ //포인트계산 스크립트
		var usepoint = parseInt(val);
		var totalpoint = ${sedto.point};
 		if(document.getElementById("use_point").value == ""){
 			document.getElementById("use_point").value="";
 			document.getElementById("sedto_point").value=${sedto.point};
 			usepoint=0;
 			
			
		}
 		if(usepoint > totalpoint){
			usepoint=${sedto.point};
			document.getElementById("sedto_point").value=0;
			document.getElementById("use_point").value=${sedto.point};
		}
		var resetpoint = ${sedto.point} - usepoint;
		var resetprice = ${total_price} - usepoint;
		document.getElementById("sedto_point").value = resetpoint;
		document.getElementById("total_price").value = resetprice;
		
	}
</script>
<%@ include file="top.jsp" %>
<div align = "center"style="margin-top:90px">
	<form name = "f" method = "post" action="member_reserve_ok.do">
		<table class = "outline" border = "1">
			<tr>
				<th>예약번호</th>
				<th>호텔이름</th>
				<th>방 번호</th>
				<th>가격</th>
			</tr>
			<c:forEach var = "dto" items = "${List}">
					<tr align = "center">
						<td>${dto.hotel_resv_no}</td>
						<td>${dto.name}</td>
						<td>${dto.room_no}</td>
						<td>${dto.price}</td>
					</tr>
			</c:forEach>
			<tr>
				<th align = "center">내 포인트</th>
				<td align = "center"><input type = "text" id = "sedto_point" name = "sedto_point" value = "${sedto.point}" disabled size="10"></td>
				<th align = "center">사용할 포인트</th>
				<td align = "center">
					<input type = "hidden" name = "a" id = "a" value = "1">
					<input type = "text"  id="use_point" name = "use_point" size="10" onkeyup = "point(this.value)" value = "0">
				</td>
			</tr>
			<tr>
				<th align = "center">최종 결제액</th>
				<td align = "right" colspan = "3"><input type = "text" id = "total_price" name = "total_price" value = "${total_price}" disabled>원</td>
			</tr>
			<tr>
				<td colspan = "4" align = "center">
					<input type = "button" value = "결제" onClick = >
					<input type = "button" value = "취소" onClick = "window.location='member_mypage.do'">
				</td>
			</tr>
		</table>
	</form>
</div>

  <%@ include file="../Basic/bottom_nav.jsp" %>