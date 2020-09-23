<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<table border="1" width="800">
		<tr bgcolor="green">
			<th>번호</th>
			<th width="40%">호텔이름</th>
			<th>주소</th>
			<th>연락처</th>
			<th>성급</th>
			<th>파일</th>
		</tr> 
	<c:if test="${empty hotelList}">		
		<tr>
			<td colspan="7">
			등록된 호텔이 없습니다.
			</td>
		</tr>
	</c:if>		
	<c:forEach var="dto" items="${hotelList}">		
		<tr>
			<td><c:out value="${dto.hotel_no}"/></td>
			<td>
				<a href="hotelcontent?hotel_no=${dto.hotel_no}">
					${dto.name}
				</a>		
			</td>
			<td>${dto.address}</td>
			<td>${dto.hp1}-${dto.hp2}-${dto.hp3}</td>
			<td>${dto.star}</td>
			<td>
		<c:if test="${dto.filesize > 0}">
				<img src="${pageContext.request.contextPath}/resources/img/folder.gif">	
		</c:if>			
			</td>
		</tr>		
	</c:forEach>	
	</table>

</div>
</body>
</html>