<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../bus_main/top.jsp" %>
 <div align="center">
		<table width="100%">
			<tr align="right">
				<td colspan="9">
					<a href="bus_insert.do">추가</a>
				</td>
			</tr>
			<tr>
				<td>예약번호</td>
				<td>예약한 사람</td>
				<td>버스 번호</td>
				<td>노선 번호</td>
				<td>자리</td>
				<td>사용한 포인트</td>
				<td>적립 포인트</td>
				<td>예약 날짜</td>
				<td>수정/삭제</td>
			</tr> 
			<c:if test="${empty list}">
				<tr>
					<td colspan="9">등록된 버스예약이 없습니다.</td>
				</tr>	
			</c:if>
			<c:forEach var="dto" items="${list}">			
			<tr>
				<td>${dto.resv_no}</td>
				<td>${dto.member_no}</td>
				<td>${dto.bus_no}</td>
				<td>${dto.road_no}</td>
				<td>${dto.seat}</td>
				<td>${dto.use_point}</td>
				<td>${dto.save_point}</td>
				<td>${dto.resv_date}</td>
				<td>
					<a href="bus_resv_update.do?no=${dto.resv_no}">수정</a> | 
					<a href="bus_resv_delete.do?no=${dto.resv_no}">삭제</a>
				</td>
			</tr>	
			</c:forEach>
		</table>	
	</div>
 <%@ include file="../bus_main/bottom.jsp" %>   
