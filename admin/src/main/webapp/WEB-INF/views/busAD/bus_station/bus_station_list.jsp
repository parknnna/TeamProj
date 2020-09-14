<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../Basic/head.jsp" %>   
<%@ include file="../../Basic/nav_AD.jsp" %>    
<%@ include file="../top2.jsp" %>
	<div align="center"style="margin-top:62px"   >
		<table width="70%" align="center">
			<tr align="right">
				<td colspan="4">
					<a href="ADbus_station_insert.do">추가</a>
				</td>
			</tr>
			<tr>
				<td>터미널번호</td>
				<td>터미널이름</td>
				<td>터미널주소</td>
				<td>수정/삭제</td>
			</tr> 
			<c:if test="${empty bus_station_list}">
				<tr>
					<td colspan="4">등록된 버스가 없습니다.</td>
				</tr>	
			</c:if>
			<c:forEach var="dto" items="${bus_station_list}">			
			<tr>
				<td>${dto.station_no}</td>
				<td>${dto.station_name}</td>
				<td>${dto.address}</td>
				<c:if test="${dto.filesize != 0}">
					<td>
						<img src="${pageContext.request.contextPath}/resources/img/${dto.filename }" width="40">
					</td>
				</c:if>
				<c:if test="${dto.filesize == 0}">
					<td>이미지없음</td>
				</c:if>
				<td>
					<a href="ADbus_station_update.do?no=${dto.station_no}">수정</a> | 
					<a href="ADbus_station_delete.do?no=${dto.station_no}">삭제</a>
				</td>
			</tr>	
			</c:forEach>
		</table>	
	</div>
<%@ include file="../../Basic/bottom.jsp" %> 