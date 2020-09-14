<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../bus_main/top.jsp"%>

<div align="center" >
		<table border="1">
			<tr align="center">
				<td width="500">${get_busstation.station_name}</td>
			</tr>
			<tr height="200" align="center">
				<td><img src="${pageContext.request.contextPath}/resources/img/${get_busstation.filename}" width="500" height="200"></td>
			</tr>
			<tr align="center">
				<td>api 지도</td>
			</tr>
			<tr align="center">
				<td>${get_busstation.address}</td>
			</tr>
		</table>
		<table border="1">
			<tr align="center">
				<td width="500">주변호텔</td>
			</tr>
			<tr>
									

				
			</tr>
		</table>
</div>
<%@include file="../bus_main/bottom.jsp"%>