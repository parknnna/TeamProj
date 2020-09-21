<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


 <%@ include file="../../Basic/top_Bus.jsp" %>
 <%@ include file="../bus_main/top.jsp" %>
<script type="text/javascript"> 
function point(val){ //포인트계산 스크립트
	var usepoint=parseInt(val);
	var resetpoint=${sedto.point}-usepoint;
	var price=${(arr_seat_dto.price*seat_no)+(dep_seat_dto.price*seat_no_reverse)}-usepoint;
    document.getElementById("total_point").value = resetpoint;
	document.getElementById("price").value=price;
}

</script>
<style>
	#btn button{
		border:0;
		font-size:18px;
		background-color:rgba(0,0,0,0);
		color:#c94dff;
		padding:5px;
		font-family: "Trebuchet MS";
		border-top-left-radius: 3px;
  		border-top-right-radius: 5px;
   		border-bottom-right-radius: 8px;
   		border-bottom-left-radius: 10px;
		
		}
	#btn a{
		font-family: "Trebuchet MS";
		font-size:25px;
   	 	font-weight:bold;
	}
	#btn button:hover{
		color:white;
		background-color:#c94dff;
		}
		
	table.type10 {
    border-collapse: collapse;
    font-family: "Trebuchet MS";
    font-weight:bold;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    margin: 20px 10px;
    font-size:20px;
	}
	table.type10 thead th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background: #c94dff;
    margin: 20px 10px;
	}
	table.type10 tbody th {
    width: 150px;
    padding: 10px;
	}
	table.type10 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
	}
	table.type10 .even {
    background: #fdf3f5;
    font-size:20px;
	}
	table.type10 .none_even {
    
    font-size:20px;
	}
</style>

	
	<div>
		 
		<form action="bus_resv_user_total_payok.do">
		<input type="hidden" name="one_date" value="${one_date}">
		<input type="hidden" name="two_date" value="${two_date}">
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
			<table border="1" class="type10">
				<tr align="center">
					<td colspan="4">${one_date}(출발일)</td>
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
			<table border="1" class="type10">
				<tr align="center">
					<td colspan="4">${two_date}(도착일)</td>
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
				<table border="1" class="type10">
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
<%@ include file="../../Basic/bottom_nav.jsp" %>