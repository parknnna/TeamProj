<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../Basic/head.jsp" %>   
<%@ include file="../../Basic/nav_AD.jsp" %>   

<%
Calendar cal = Calendar.getInstance();
int month = cal.get(Calendar.MONTH);
int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
%>
<style>
  table {
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
</style>
<div align="center" style="margin-top:62px">
	<table width="90%">
		<tr align="right">
			<td colspan="11"><a href="ADhotel_insert.do">추가</a></td>
		</tr>
		<tr align="center" style="font-weight:700">
			<td>호텔번호</td>
			<td>호텔이름</td>
			<td>호텔주소</td>
			<td>전화번호</td>
			<td>호텔정보</td>
			<td>방정보</td>
			<td>호텔 예약보기</td>
			<td>호텔 게시판 보기</td>
			<td>수정/삭제</td>
		</tr>
		<c:if test="${empty list}">
			<tr>
				<td colspan="7">등록된 호텔가 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${list}">
			<tr align="center">
				<td>${dto.hotel_no}</td>
				<td>${dto.name}</td>
				<td>${dto.address}</td>
				<td>${dto.hp1} - ${dto.hp2} - ${dto.hp3}</td>
				<td>
					<a href="ADhotel_show.do?hnum=${dto.hotel_no}">호텔정보 보기</a>
				</td>
				<td>
					<a href="ADroom_list.do?hnum=${dto.hotel_no}">방정보 보기</a>
				</td>
				<td>
					<a href="ADresv_list.do?hnum=${dto.hotel_no}">호텔예약 보기</a>
				</td>
				<td>
					<a href="hotel_board_list.do?hnum=${dto.hotel_no}">호텔 게시판 보기</a>
				</td>
				<td>
					<a href="ADhotel_update.do?hnum=${dto.hotel_no}">수정</a> | <a
					href="ADhotel_delete.do?hnum=${dto.hotel_no}">삭제</a></td>
			</tr>
		</c:forEach>
	</table>
</div>
<%@ include file="../../Basic/bottom.jsp" %>