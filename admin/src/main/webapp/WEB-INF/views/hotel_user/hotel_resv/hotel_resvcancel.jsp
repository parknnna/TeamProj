<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fm" %>
<%@ include file="../../Basic/head.jsp" %>
<%@ include file="../../Basic/nav_Hotel.jsp" %>
<div class="boxContainer" align="center" style="margin-top:100px">
<table border="1" style="width:30%">
<tr align="center"><h4>상세 내역</h4></tr>
<tr align="center">
<th bgcolor="#ebcbf7">호텔 이름</th>
<td>${hotel_name}</td>
</tr>
<c:if test="${not empty drdto}">
<tr align="center">
<th bgcolor="#ebcbf7">${drdto.name}</th>
<td>
<c:forEach var="ho" items="${dr_no}">
${ho}호<br>
</c:forEach>
</td>
</tr>
</c:if>
<c:if test="${not empty srdto}">
<tr align="center">
<th bgcolor="#ebcbf7">${srdto.name}</th>
<td>
<c:forEach var="ho" items="${sr_no}">
${ho}호<br>
</c:forEach>
</td>
</tr>
</c:if>
<c:if test="${not empty frdto}">
<tr align="center">
<th bgcolor="#ebcbf7">${frdto.name}</th>
<td>
<c:forEach var="ho" items="${fr_no}">
${ho}호<br>
</c:forEach>
</td>
</tr>
</c:if>
<tr align="center">
<th bgcolor="#ebcbf7">체크 인</th>
<td>${f:substring(hrdto.start_resv_date,0,11)}</td>
</tr>
<tr align="center">
<th bgcolor="#ebcbf7">체크 아웃</th>
<td>${f:substring(hrdto.end_resv_date,0,11)}</td>
</tr>
<tr align="center">
<th bgcolor="#ebcbf7">예약 일</th>
<td>${hrdto.resvdate}</td>
</tr>
<tr align="center">
<th bgcolor="#ebcbf7">사용 포인트</th>
<td><fm:formatNumber value="${hrdto.use_point}" type="number" /> P</td>
</tr>
<tr align="center">
<th bgcolor="#ebcbf7">저장 포인트</th>
<td><fm:formatNumber value="${hrdto.save_point}" type="number" /> P</td>
</tr>
<tr align="center">
<th bgcolor="#ebcbf7">결제 금액</th>
<td><fm:formatNumber value="${hrdto.total}" type="number" /> 원</td>
</tr>
</table>
<a href="hotel_resvCancelok?member_no=${sedto.member_no}&hotel_resv_no=${hrdto.hotel_resv_no}">|예약취소|</a> <a href="hotel_paymentoklist?member_no=${sedto.member_no}">|뒤로가기|</a>
</div>
<%@ include file="../../Basic/bottom_nav.jsp" %>