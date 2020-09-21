  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../bus_main/top.jsp" %>
	<div align="center">
		<form action="bus_update.do" method="post">
		<input type="hidden" name="bus_no" value="${bus.bus_no }">
			<table width="50%" border="1">
				<tr>
					<td>버스번호 : <input type="text" name="bus_no" value="${bus.bus_no}" readonly></td>
				</tr>
				<tr>
					<td>버스등급 : 
					<select name="grade">
						<option>${bus.grade}</option>
						<c:if test="${bus.grade=='일반' }"><!-- 버스 등급이 일반인 경우 우등 출력 추가c -->
							<option value="우등">우등</option>
						</c:if>
						<c:if test="${bus.grade=='우등' }"><!-- 버스 등급이 우등인 경우 일반출력 추가 -->
							<option value="일반">일반</option>
						</c:if>
					</select>
					
				</tr>
				<tr>
					<td>버스좌석수 : <input type="text" name="seat" value="${bus.seat}"></td>
				</tr>
				<tr align="right"><td><input type="submit" value="수정"></td></tr>
			</table>
		</form>
	</div>

<%@ include file="../bus_main/bottom.jsp" %> 