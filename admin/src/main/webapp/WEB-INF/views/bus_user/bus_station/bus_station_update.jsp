  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../bus_main/top.jsp" %>
	<div align="center">
		<form action="bus_station_update.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="station_no" value="${station.station_no}">
			<table width="50%" border="1">
				<tr>
				<td>터미널번호 : <input type="text" name="station_no" value="${station.station_no}"readonly></td>		
				</tr>
				<tr>
					<td>터미널이름 : <input type="text" name="station_name" value="${station.station_name}"></td>
				</tr>
				<tr>
					<td>터미널주소 : <input type="text" name="address" value="${station.address}" size="35"></td>
				</tr>
				<tr>
					<td>수정할 파일명: <input type="file" name="filename"></td>
	
				</tr>
				<tr>
					<td>수정전 파일명:<input type = "text" name = "filename2" value = "${station.filename}" readOnly></td>
				</tr>
				<tr align="right"><td><input type="submit" value="수정"></td></tr>
			</table>
		</form>
	</div>
<%@ include file="../bus_main/bottom.jsp" %> 