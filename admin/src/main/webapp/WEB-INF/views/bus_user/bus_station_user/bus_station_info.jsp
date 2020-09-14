<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="../bus_main/top.jsp"%>
	<div align="center">
		<h3>터미널 정보</h3>
		<c:if test="${empty bus_station_list}">
			등록된 터미널 정보가 없습니다.
		</c:if>
		
		<c:forEach var="dto" items="${bus_station_list}">	
			<c:set var="Path" value="${pageContext.request.contextPath}/resources/img/${dto.filename}"/>
			
		<div  style="border: 1px solid gold; float: left; width: 33%;">
		<table border="1">
			<tr align="center" height="50">
				<th width="200">
					
					<a href="bus_station_info_detail.do?station_no=${dto.station_no}">${dto.station_name}</a>
					
				</th>
			</tr>
			<c:if test="${dto.filesize != 0}">
				<tr align="center" height="70">	
					<td>
						<a href="javascript:void(window.open('bus_station_info_map.do','${dto.station_name}지도','width=500px, height=500px'))">
							<img src="${Path}" width="200" height="100">
						</a>
						
					</td>
				</tr>
			</c:if>
			<c:if test="${empty dto.filesize}">
				<tr align="center">	
					<td>사진을 첨가해주세요</td>
				</tr>
			</c:if>
			<tr align="center">
				<td>${dto.address}</td>
			</tr>
			<c:if test="${count%1==0}">
				<tr></tr>
			</c:if>
			
			
		</table>
		</div>	
		</c:forEach>
	</div>

<%@ include file="../bus_main/bottom.jsp"%>