<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../../Basic/head.jsp" %>
<%@ include file="../../Basic/nav_Hotel.jsp" %>
<h4 align="center">결제 내역서</h4>
<div align="center">
<div align="left"><a href="hotel_resv"><input type="button" value="검색창으로"></a></div>
	<c:forEach var="dto" items="${h_resvdto}" varStatus="status">
	<table border="1" id="show${status.index}" class="conBox">
		<tr>
		<th>예약 날짜</th>
		<td>${dto.RESVDATE}</td>
		</tr>
		<tr>
		<th>체크 인<br>15:00</th>
		<td>${dto.START_RESV_DATE}</td>
		</tr>
		<tr>
		<th>체크 아웃<br>12:00</th>
		<td>${dto.END_RESV_DATE}</td>
		</tr>		
		<c:if test="${not empty droom_no}">
		<tr>
		<th>디럭스</th>
			<td>
			<c:forEach var="d" items="${droom_no}">
			${d} 호<br>
			</c:forEach>
			</td>
		</tr>
		</c:if>
		<c:if test="${not empty sroom_no}">
		<tr>
		<th>스탠다드</th>
			<td>
			<c:forEach var="s" items="${sroom_no}">
			${s} 호<br>
			</c:forEach>
			</td>
		</tr>
		</c:if>
		<c:if test="${not empty froom_no}">
		<tr>
		<th>패밀리</th>
			<td>
			<c:forEach var="f" items="${froom_no}">
			${f} 호<br>
			</c:forEach>
			</td>
		</tr>
		</c:if>
		<tr>
		<th>결제 금액</th>
		<td>${total}</td>
		</tr>
		<tr>
		<th>사용 포인트</th>
		<td>${dto.USE_POINT}</td>
		</tr>
		<tr>
		<th>지급 포인트</th>
		<td>${dto.SAVE_POINT}</td>
		</tr>
		<%-- <tr>
		<th>잔여 포인트</th>
		<td>${sedto.point}</td>
		</tr> --%>
	</table>
	</c:forEach>
	<%-- <div class="tab">
		<ul>
		<c:forEach var="dto" items="${hrdto}" varStatus="status">
        <li data-id="con${status.index }" class="on">tab #1</li>
		</c:forEach>
		</ul>
	</div> --%>
</div>
<%@ include file="../../Basic/bottom_nav.jsp" %>