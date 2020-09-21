<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="top.jsp"%>
<div align="center">
	<table width="100%">
		<tr>
			<td>호텔번호</td>
			<td>호텔이름</td>
			<td>호텔주소</td>
			<td>전화번호</td>
			<td>회원번호</td>
			<td>호텔정보</td>
			<td>호텔 성급</td>
			<td>이미지</td>
			<td>게시판</td>
		</tr>
		<c:if test="${empty list}">
			<tr>
				<td colspan="7">등록된 호텔이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.hotel_no}</td>
				<td>${dto.name}</td>
				<td>${dto.address}</td>
				<td>${dto.hp1} - ${dto.hp2} - ${dto.hp3}</td>
				<td>${dto.member_num } </td>
				<td>${dto.hotel_info}</td>
				<td>${dto.star}</td>
				<c:if test="${dto.filesize != 0}">
					<td><img
						src="${pageContext.request.contextPath}/resources/img/${dto.filename }" width="40">
					</td>
				</c:if>
				<c:if test="${dto.filesize == 0}">
					<td>이미지없음
					</td>
				</c:if>

				<td>
					<a href="hotel_board_list.do?hotel_no=${dto.hotel_no}">게시판</a>
				</td>
				
			</tr>
		</c:forEach>
	</table>
</div>
<%@ include file="bottom.jsp"%>
