<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../bus_main/top.jsp"%>
<div align="center">
		
		<table width="100%" border="1">
			<tr align="center">
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
				<td>${dto.price}</td>
				<td>${dto.resv_date}</td>
				<td><a href="bus_resv_user_refund.do?bus_resv_no=${dto.bus_resv_no}&use_point=${dto.use_point}&save_point=${dto.save_point}">환불</a></td>
			</tr>	
			</c:forEach>
			</c:if>
		</table>
		</div>
<%@include file="../bus_main/bottom.jsp"%>