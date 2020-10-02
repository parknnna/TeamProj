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
			<th>룸 번호</th>
			<th width="40%">룸 이름</th>
			<th>객실 크기</th>
			<th>정원</th>
			<th>사진</th>
		</tr> 
	<c:if test="${empty roomList}">		
		<tr>
			<td colspan="7">
				등록된 게시글이 없습니다.
			</td>
		</tr>
	</c:if>		
	<c:forEach var="dto" items="${roomList}">		
		<tr>
			<td><c:out value="${dto.room_no}"/></td>
			<td>
			<a href="roomcontent?room_no=${dto.room_no}">
					${dto.name}
				</a>
			</td>
			<td>${dto.roomsize}m²</td>
			<td>${dto.sleeps}명</td>
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