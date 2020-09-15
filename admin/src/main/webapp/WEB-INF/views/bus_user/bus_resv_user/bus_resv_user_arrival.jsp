<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../bus_main/top.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>출발지 도착지 선택</title>
</head>
<body>

	<div>
		<div align="center"style="width:100%; float:center;">
			<div align="center" style="width:100%; folat:center; background:#CEECF5";><h2>출발지선택</h2></div>
				<div align="left" style="border:1px solid blue; width:100%; folat:center;">
					<form action="resv_user_arrival_find.do">
					<table border="1">
						<tr>
							<td>
								검색:<input type="text" name="searchString" size="111">
								<input type="submit" value="찾기">
							</td>
						</tr>
					</table>
					</form>
				</div><!-- 검색 -->
			<form action="bus_resv_user_arrival.do" method="post">
				<div align="center" style="border:1px solid blue;width:50%;  background:#EFF5FB;">
					<table border="1">
						<tr>
							<td width="4000">출발지:
								<c:if test="${not empty arr_dto.station_name}">
									<input type="hidden" name="arrival" value="${arr_dto.station_name}">${arr_dto.station_name}
									
								</c:if>
							</td>
							
						</tr>
					</table>
				</div><!-- 출발지 -->
		

				
				<div align="center" style="display: inline-block;border:1px solid blue;">
						<h3>출발지</h3>
					<table border="1">
						<c:if test="${not empty find_station}">
							<c:forEach var="list" items="${find_station}">
								<tr>
									<td><input type="button" onclick="javascript:location.href='bus_resv_user_arrival_select.do?arrival=${list.station_no}'" value="${list.station_name}"></td>
								</tr>
							</c:forEach>
						</c:if>
						<c:forEach var="dto" items="${bus_station_list}">
						
						<tr>
							<td width="100">
							<input type="button" onclick="javascript:location.href='bus_resv_user_arrival_select.do?arrival=${dto.station_no}'"  value="${dto.station_name}" style="width:100%;">
							</td>
						</tr>
						</c:forEach>
					</table>
					<input type="submit" value="선택">
				</div><!-- 터미널 출발지 버튼 -->
				
				
			</form>
		</div>
	</div>
</body>
</html>
<%@ include file="../bus_main/bottom.jsp"%>