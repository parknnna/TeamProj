<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ include file="../Basic/head.jsp" %>
 <%@ include file="../Basic/nav_Login.jsp" %>
 <%@ include file="top.jsp" %>
	<div align="center"style="margin-top:90px">
		<hr color="green" width="300">
		<c:if test="${mode == 'id' }">
		<h2>아 이 디 찾 기</h2>
		</c:if>
		<c:if test = "${mode == 'passwd' }">
		<h2>비 밀 번 호 찾 기</h2>
		</c:if>
		<hr color="green" width="300">
		<form name="f" action="member_search_ok.do" method="post">
			<input type = "hidden" name = "mode" value = "${mode}">
			<table width = "500" class = "outline">
				<tr>
					<c:if test="${mode == 'id' }">
						<th>이름</th>
					</c:if>
					<c:if test = "${mode == 'passwd' }">
						<th>아이디</th>
					</c:if>
					<td><input type = "text" name = "searchString" class = "box"></td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td>
						<input type = "text" name = "ssn1" class = "box" maxlength = "6"> -
						<input type = "password" name = "ssn2" class = "box" maxlength = "7">
					</td>  
				</tr>
				<tr>
					<td colspan = "2" align = "center">
						<input type = "submit" value = "조회">
						<input type = "reset" value = "취소">
					</td> 
				</tr>
			</table>
		</form>
		
	</div>
  <%@ include file="../Basic/bottom_nav.jsp" %>