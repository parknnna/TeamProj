<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ include file="../Basic/head.jsp" %>
 <%@ include file="../Basic/nav_Login.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align = "center" style="margin-top:90px">

<h2>위 시 리 스 트</h2>

<form name = "f" method = "post" action="member_reserve_ok.do">
	<table class = "outline" border = "1">
		<tr align = "center">
			<th>선택</th>
			<th>예약번호</th>
			<th>호텔이름</th>
			<th>방 번호</th>
			<th>가격</th>
			<th>예약 취소</th>
		</tr>
		<c:choose>
			<c:when test="${empty List}">
				<tr align = "center">
					<td colspan = "6">
						예약 정보가 없습니다.
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var = "dto" items = "${List}">
					<tr align = "center">
						<td><input type = "checkbox" name = "choose" value = "${dto.hotel_resv_no}"></td>
						<td>${dto.hotel_resv_no}</td>
						<td>${dto.name}</td>
						<td>${dto.room_no}</td>
						<td>${dto.price}</td>
						<td><a href = "member_resv_cancel.do?hotel_resv_no=${dto.hotel_resv_no}">취소</a></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan = "6" align ="center">
					<input type = "submit" value = "결제">
					<input type = "button" style = "width : 50px;" value = "취소" onClick = "window.location='member_mypage.do'">
					</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
</form>
</div>

  <%@ include file="../Basic/bottom_nav.jsp" %>