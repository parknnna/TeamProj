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
	<hr color="green" width="300">
	<h2>회 원 목 록 보 기</h2>	
	<hr color="green" width="300">
	<table width="100%" class="outline" border="1">
	<tr>
		<th class="m3">번호</th>
		<th class="m3">아이디</th>
		<th class="m3">이름</th>
		<th class="m3">이메일</th>
		<th class="m3">전화번호</th>
		<th>성별</th>
		<th class="m3">가입일</th>
		<th class="m3">수정 | 삭제</th>
	</tr>
	<c:if test="${empty memberlist}">
	<tr>
		<td colspan="7">등록된(찾으시는) 회원이 없습니다.</td>
	</tr>	
	</c:if>
	<c:forEach var="dto" items="${memberlist}">			
	<tr>
		<td>${dto.member_no}</td>
		<td>${dto.id}</td>
		<td>${dto.name}</td>
		<td>${dto.email}</td>
		<td>${dto.hp1}-${dto.hp2}-${dto.hp3}</td>
		<c:if test="${dto.sex eq 0}">
		<td>남</td>
		</c:if>
		<c:if test="${dto.sex eq 1}">
		<td>여</td>
		</c:if>
		<td>${dto.joindate}</td>
		<td>
		<a href="member_edit.do?no=${dto.member_no}">수정</a> | 
		<a href="member_delete.do?no=${dto.member_no}">삭제</a></td>
	</tr>	
	</c:forEach>		
	</table>
</div>
</body>
</html>