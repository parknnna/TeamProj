<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<script type="text/javascript"> 
function point(val){ //포인트계산 스크립트
	var usepoint=parseInt(val);
	var resetpoint=${sedto.point}-usepoint;
	var price=${(arr_seat_dto.price*seat_no)+(dep_seat_dto.price*seat_no_reverse)}-usepoint;
    document.getElementById("total_point").value = resetpoint;
	document.getElementById("price").value=price;
}

</script>
<%@ include file="../bus_main/top.jsp" %>
	
	<div>
		 
		<form action="bus_resv_user_total_payok.do">
		<input type="hidden" name="arr_date" value="${arr_date}">
		<input type="hidden" name="dep_date" value="${dep_date}">
		<input type="hidden" name="road_no" value="${road_no}">
		<input type="hidden" name="road_no_reverse" value="${road_no_reverse}">
		<input type="hidden" name="price" value="${(arr_seat_dto.price*seat_no)+(dep_seat_dto.price*seat_no_reverse)}">
		<input type="hidden" name="arr_price" value="${arr_seat_dto.price*seat_no}">
		<input type="hidden" name="dep_price" value="${dep_seat_dto.price*seat_no_reverse}">
		<c:forEach var="seat" items="${seat}">
			<input type="hidden" name="seat" value="${seat}">
		</c:forEach>
		<c:forEach var="seat_reverse" items="${seat_reverse}">
			<input type="hidden" name="seat_reverse" value="${seat_reverse}">
		</c:forEach>
			<div align="center" style="display: inline-block;">
			<table border="1">
				<tr align="center">
					<td colspan="4">${arr_date}(출발일)</td>
				</tr>
				<tr>
					<td colspan="2">출발지:${arr_seat_dto.arrival}</td>
					<td colspan="2">도착지:${arr_seat_dto.departure}</td>
				</tr>
				<tr>
					<td colspan="2">출발시간:${arr_seat_dto.arr_time}시</td>
					<td colspan="2">도착시간:${arr_seat_dto.arr_time+arr_seat_dto.tot_time}시</td>
				</tr>
				<tr>
					<td colspan="3">1장 가격:${arr_seat_dto.price}원</td>
					<td>인원수:${seat_no}명</td>
				</tr>
				<tr>
					<td colspan="2">좌석번호: 
					<c:forEach var="seat" items="${seat}"> ${seat}번</c:forEach>
					</td>
					<td colspan="2">총가격:<input type="text"  value="${arr_seat_dto.price*seat_no}" disabled></td>
				</tr>
				
				
			</table>
			</div>
			<div align="center" style="display: inline-block;">
			<table border="1">
				<tr align="center">
					<td colspan="4">${dep_date}(도착일)</td>
				</tr>
				<tr>
					<td colspan="2">출발지:${dep_seat_dto.arrival}</td>
					<td colspan="2">도착지:${dep_seat_dto.departure}</td>
				</tr>
				<tr>
					<td colspan="2">출발시간:${dep_seat_dto.arr_time}시</td>
					<td colspan="2">도착시간:${dep_seat_dto.arr_time+dep_seat_dto.tot_time}시</td>
				</tr>
				<tr>
					<td colspan="3">1장 가격:${dep_seat_dto.price}원</td>
					<td>인원수:${seat_no_reverse}명</td>
				</tr>
				<tr>
					<td colspan="2">좌석번호: 
					<c:forEach var="seat_reverse" items="${seat_reverse}">${seat_reverse}번</c:forEach>
					</td>
					<td colspan="2">총가격:<input type="text"  value="${dep_seat_dto.price*seat_no_reverse}" disabled></td>
				</tr>
			</table>
			</div>
			<div align="right">
				<table border="1">
					<tr>
						<td colspan="2">총가격<input type="text"  value="${(arr_seat_dto.price*seat_no)+(dep_seat_dto.price*seat_no_reverse)}" disabled></td>
					</tr>
					<tr align="right">
						<td colspan="2"><input type="submit" value="결제"></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
<%@ include file="../bus_main/bottom.jsp" %>
