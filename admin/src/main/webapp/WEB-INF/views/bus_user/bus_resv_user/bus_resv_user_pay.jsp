<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<script type="text/javascript"> 
function point(val){ //포인트계산 스크립트
	var usepoint=parseInt(val);
	var resetpoint=${sedto.point}-usepoint;
	var price=${resv_dto.price*seat_no}-usepoint;
    document.getElementById("total_point").value = resetpoint;
	document.getElementById("price").value=price;
}

</script>

<%@ include file="../bus_main/top.jsp" %>
	<fmt:parseNumber var="save_point" integerOnly="true" value="${resv_dto.price*seat_no*0.1}"/> <!-- 저장될 포인트 int 형으로 변환 -->
	<div>
		<form action="bus_resv_user_payok.do">
		<input type="hidden" name="one_date" value="${one_date}">
		<input type="hidden" name="road_no" value="${resv_dto.road_no}">
		<input type="hidden" name="save_point" value="${save_point}"> <!-- 저장될 포인트 int 형으로 보내서 넘겨줌 -->
		<input type="hidden" name="price" value="${resv_dto.price*seat_no}">
		<c:forEach var="seat" items="${seat}">
			<input type="hidden" name="seat" value="${seat}">
		</c:forEach>
		
			<table border="1">
				<tr align="center">
					<td colspan="4">${one_date}</td>
				</tr>
				<tr>
					<td colspan="2">출발지:${dto.arrival}</td>
					<td colspan="2">도착지:${dto.departure}</td>
				</tr>
				<tr>
					<td colspan="2">출발시간:${resv_dto.arr_time}시</td>
					<td colspan="2">도착시간:${resv_dto.arr_time+resv_dto.tot_time}시</td>
				</tr>
				<tr>
					<td colspan="3">1장 가격:${resv_dto.price}원</td>
					<td>인원수:${seat_no}명</td>
				</tr>
				<tr>
					<td colspan="4">좌석번호: 
					<c:forEach var="seat" items="${seat}"> ${seat}번</c:forEach>
					</td>
				</tr>
				<tr>
					<td colspan="2">사용 포인트:<input  type="text" name="use_point"  onkeyup="point(this.value)" value="0">점 </td>
					<td colspan="2">총 포인트:<input type="text" id="total_point" value="${sedto.point}" disabled>점</td>
				</tr>
				<tr align="right">
					<td colspan="4">총가격:<input type="text" id="price" value="${resv_dto.price*seat_no}" disabled></td>
				</tr>
				
				<tr align="right">
					<td colspan="4"><input type="submit" value="결제" size="100"></td>
				</tr>
			</table>
		</form>
	</div>
<%@ include file="../bus_main/bottom.jsp" %>
