<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../Basic/head.jsp" %>   
<%@ include file="../../Basic/nav_AD.jsp" %>    
<%@ include file="../top2.jsp" %>

<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<style>
.listBox tr td{
	border-bottom: 1px solid #444444;
    padding: 10px;
    }
</style>
	<div align="center" width="70%" align="center" >
		<h4 style="font-family: 'Nanum Gothic', sans-serif;margin-top:20px">버스 노선 리스트</h4>
		<table style="width:60%;" class="listBox">
	
			<tr align="right">
				<td colspan="9">
					<a href="ADbus_insert.do">추가</a> | 
				<a href="#" onclick="goBack()">뒤로가기</a>
				</td>
			</tr>
			<tr>
				<td>노선번호</td>
				<td>버스번호</td>
				<td>노선 등록 회원</td>
				<td>출발지</td>
				<td>도착지</td>
				<td>가격</td>
				<td>출발시간</td>
				<td>도착시간</td>
				<td>예약 | 수정 | 삭제</td>
			</tr> 
			<c:if test="${empty bus_load_list}">
				<tr>
					<td colspan="9">등록된 노선이 없습니다.</td>
				</tr>	
			</c:if>
			<c:forEach var="dto" items="${bus_load_list}">			
			<tr>
				<td>${dto.road_no}</td>
				<td>${dto.bus_no}</td>
				<td>${dto.member_no}</td>
				<td>${dto.arrival}</td>
				<td>${dto.departure}</td>
				<td>${dto.price}</td>
				<td>${dto.arr_time}</td>
				<td>${dto.tot_time}</td>
				<td>
					<a href="ADbus_resv_insert.do?no=${dto.road_no}">예약</a> | 
					<a href="ADbus_load_update.do?no=${dto.road_no}">수정</a> | 
					<a href="ADbus_load_delete.do?no=${dto.road_no}">삭제</a>
				</td>
			</tr>	
			</c:forEach>
		</table>	
	</div>
<%-- <%@ include file="../../Basic/bottom_nav.jsp" %> --%>