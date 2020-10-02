<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../Basic/head.jsp" %>   
<%@ include file="../../Basic/nav_AD.jsp" %>
<%@ include file="../top2.jsp" %> 
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">

<%
Calendar cal = Calendar.getInstance();
int month = cal.get(Calendar.MONTH);
int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
int cnt=0;
List<hotelDTO> dto=(List)request.getAttribute("list");
%>

<style>
.listBox tr td{
	border-bottom: 1px solid #444444;

    }
</style>
<div align="center" width="70%" align="center" >
		<h4 style="font-family: 'Nanum Gothic', sans-serif;margin-top:20px">호텔 리스트</h4>
		<table style="width:90%;font-size:14px;" class="listBox">
		<tr align="right">
			<td colspan="11"><a href="ADhotel_insert.do">추가</a> |
			<a href="#" onclick="goBack()">뒤로가기</a>
			</td>
		</tr>
		<tr>
			<td>No.</td>
			<td>이름</td>
			<td>주소</td>
			<td>Tel</td>
			<!-- 멤버넘 -->
			<td style="width:30%">호텔정보</td>
			<td>성급</td>
			<td>이미지</td>
			<td>방정보</td>
			<td>호텔 예약</td>
			<td>리뷰 게시판</td>
			<td>수정 | 삭제</td>
		</tr>
		<c:if test="${empty list}">
			<tr>
				<td colspan="11">등록된 호텔이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.hotel_no}</td>
				<td>${dto.name}</td>
				<td>${dto.address}</td>
				<td>${dto.hp1} - ${dto.hp2} - ${dto.hp3}</td>
				<td>${dto.hotel_info}</td>
				<td>${dto.star}</td>
				<c:if test="${dto.filesize != 0}">
					<td>
						<img src="${pageContext.request.contextPath}/resources/img/<%=dto.get(cnt).getFilename().split("/")[0] %>" width="40">
					</td>
				</c:if>
				<c:if test="${dto.filesize == 0}">
					<td>이미지없음
					</td>
				</c:if>

				<td>
					<a href="ADroom_list.do?hnum=${dto.hotel_no}">보기</a>
				</td>
				<td>
					<a href="ADresv_list.do?hnum=${dto.hotel_no}">보기</a>
				</td>
				<td>
					<a href="hotel_board_list.do?hotel_no=${dto.hotel_no}">보기</a>
				</td>
				<td>
					<a href="ADhotel_update.do?hnum=${dto.hotel_no}">수정</a> | <a
					href="ADhotel_delete.do?hnum=${dto.hotel_no}">삭제</a></td>
			</tr>
			<%cnt++; %>
		</c:forEach>
	</table>
</div>
