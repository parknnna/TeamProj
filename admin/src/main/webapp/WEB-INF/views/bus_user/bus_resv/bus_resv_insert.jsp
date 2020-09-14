<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../bus_main/top.jsp" %>
	<div align="center">
		<form action="bus_resv_insert.do" method="post">
			<table width="100%">
				<tr>
					<td>회원 번호 : <input type="text" name="member_no" value="${bus.member_no}"></td>
				</tr>
				<tr>
					<td>버스번호 : <input type="text" name="bus_no" value="${bus.bus_no}"></td>
				</tr>
				<tr>
					<td>노선번호 : <input type="text" name="road_no" value="${bus.road_no}"></td>
				</tr>
				<tr>
					<td>자리번호 : <input type="text" name="seat" value="${bus.seat}"></td>
				</tr>
				<tr>
					<td>사용한 포인트 : <input type="text" name="use_point" value="${bus.use_point}"></td>
				</tr>
				<tr>
					<td>적립 : <input type="text" name="save_point" value="${bus.save_point}"></td>
				</tr>
				<tr>
					<td>날짜 : <input type="text" name="resv_date" value="${bus.resv_date}"></td>
				</tr>
				<tr><td><input type="submit" value="수정"></td></tr>
			</table>
		</form>
	</div>
<%@ include file="../bus_main/bottom.jsp"%>