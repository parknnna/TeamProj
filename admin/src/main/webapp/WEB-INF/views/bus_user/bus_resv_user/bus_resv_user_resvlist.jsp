<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../Basic/top_Bus.jsp" %>
<%@include file="../bus_main/top.jsp" %>
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
    font-size:14px;
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
<div align="center">
		
		<table width="100%" border="1"class="type10">
			<tr align="center" class="even">
				<th>노선번호</th>
				<th>버스번호</th>
				<th>출발지</th>
				<th>도착지</th>
				<th>출발시간</th>
				<th>도착시간</th>
				<th>좌석</th>
				<th>가격</th>
				<th>출발일</th>
				<th>환불</th>
			</tr> 
			<c:if test="${empty resv_list}">
				<tr>
					<td colspan="10">예약한 목록이 없습니다</td>
				</tr>	
			</c:if>
			<c:if test="${not empty resv_list}">
			<c:forEach var="dto" items="${resv_list}">			
			<tr align="center">
				
				<td>${dto.road_no}</td>
				<td>${dto.bus_no}</td>
				<td>${dto.arrival}</td>
				<td>${dto.departure}</td>
				<td>${dto.arr_time}시</td>
				<c:if test="${dto.arr_time+dto.tot_time>24}">
					<td>${dto.arr_time+dto.tot_time-24}시</td>
				</c:if>
				<c:if test="${dto.arr_time+dto.tot_time<=24}">
					<td>${dto.arr_time+dto.tot_time}시</td>
				</c:if>
				<td>${dto.seat}</td>
				<td>${dto.price}원</td>
				<td>${dto.resv_date}</td>
				<td><a href="bus_resv_user_refund.do?bus_resv_no=${dto.bus_resv_no}&use_point=${dto.use_point}&save_point=${dto.save_point}">환불</a></td>
			</tr>	
			</c:forEach>
			</c:if>
		</table>
		
		</div>
		<br><br><br>
<%@ include file="../../Basic/bottom_nav.jsp" %>