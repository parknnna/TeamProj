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
		<h4 style="font-family: 'Nanum Gothic', sans-serif;margin-top:20px">버스 리스트</h4>
		<table style="width:60%;" class="listBox">
			<tr align="right">
				<td colspan="4">
					<a href="ADbus_insert.do">추가</a> | 
				<a href="#" onclick="goBack()">뒤로가기</a>
				</td>
			</tr>
			<tr>
				<td>버스번호</td>
				<td>버스등급</td>
				<td>버스좌석수</td>
				<td>수정/삭제</td>
			</tr> 
			<c:if test="${empty bus_list}">
				<tr>
					<td colspan="4">등록된 버스가 없습니다.</td>
				</tr>	
			</c:if>
			<c:forEach var="dto" items="${bus_list}">			
			<tr>
				<td>${dto.bus_no}</td>
				<td>${dto.grade}</td>
				<td>${dto.seat}</td>
				<td>
					<a href="ADbus_update.do?no=${dto.bus_no}">수정</a> | 
					<a href="ADbus_delete.do?no=${dto.bus_no}">삭제</a>
				</td>
			</tr>	
			</c:forEach>
		</table>	
	</div>
<%-- <%@ include file="../../Basic/bottom_nav.jsp" %> --%>