
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../bus_main/top.jsp" %>
	<div align="center">
		
		<table width="800">
			<tr align="right">
				<td colspan="5">
					<a href="bus_station_insert.do">추가</a>
				</td>
			</tr>
		</table>
		<table width="100%" border="1">
			<tr align="center">
				<th>터미널번호</th>
				<th>터미널이름</td>
				<th>터미널주소</th>
				<th>파일</th>
				<th>수정/삭제</th>
			</tr> 
			<c:if test="${empty bus_station_list}">
				<tr>
					<td colspan="5">등록된 버스가 없습니다.</td>
				</tr>	
			</c:if>
			<c:forEach var="dto" items="${bus_station_list}">
			<c:set var="location" value="${pageContext.request.contextPath}/resources/img/${dto.filename}"/>			
			<tr align="center">
				<td>${dto.station_no}</td>
				<td>${dto.station_name}</td>
				<td>${dto.address}</td>
			<c:if test="${dto.filesize != 0}">
			<td>
				<img src="${location}" width="50" height="50">
			</td>
		</c:if>
		<c:if test="${dto.filesize == 0}">
			<td></td>
		</c:if>	
				<td>
					<a href="bus_station_update.do?no=${dto.station_no}">수정</a> | 
					<a href="bus_station_delete.do?no=${dto.station_no}">삭제</a>
				</td>
			</tr>	
			</c:forEach>
		</table>	
	</div>
<%@ include file="../bus_main/bottom.jsp" %> 