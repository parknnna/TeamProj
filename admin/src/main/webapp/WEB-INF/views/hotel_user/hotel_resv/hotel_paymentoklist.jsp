<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../../Basic/head.jsp" %>
<%@ include file="../../Basic/nav_Hotel.jsp" %>
<h4 align="center">결제 내역</h4>
<div class="boxContainer" align="center" style="margin-top:100px">
		<table border="1">
		<tr>
			<th>예약 번호</th>
			<th>호텔 이름</th>
			<th>예약 날짜</th>
			<th>가격</th>
			<th>예약 취소</th>
		</tr>
		<c:forEach var="num" items="${hotel_resv_no}" varStatus="status">
		<tr>
			<td>${num}</td>
			<td>${hotel_name[status.index]}</td>
			<td>${hotel_resv_dto[status.index].resvdate}</td>
			<td>${hotel_resv_dto[status.index].total}</td>
			<td>
			<a href="hotel_resvcancel?hotel_resv_no=${num}&member_no=${sedto.member_no}&hotel_name=${hotel_name[status.index]}">
			<input type="button" value="예약 취소">
			</a>
			</td>
		</tr>
		</c:forEach>
		</table>
</div>
<%@ include file="../../Basic/bottom_nav.jsp" %>