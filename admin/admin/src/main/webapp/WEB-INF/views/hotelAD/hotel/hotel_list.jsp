<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../Basic/head.jsp" %>   
<%@ include file="../../Basic/nav_AD.jsp" %>   

<%
int cnt=0;
%>
<style>

  .infoTable td {
    border-bottom: 1px solid #444444;
    padding: 10px 0;
  }
</style>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<div align="center" class="mainContainer" style="width: 90%;margin: 90px auto 10px auto;">
<div class="firstbox">
	<div class="titleContainer" style="width:100%">
		<h6 style="font-family: 'Nanum Gothic', sans-serif;float: left;border-radius: 10px;border: 2px solid #c94dff;padding: 5px;color: #696969;">호텔 관리자 페이지</h6>
	</div>
</div>

<div class="secbox">	
	<div class="tableContainer" style="width:100%;" align="center">
		<table style="width:100%;font-size:14px;" class="infoTable">
		<tr align="right">
			<td colspan="11"><a href="ADhotel_insert.do">추가</a></td>
		</tr>
		<tr style="text-align:center;">
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
		<%List<hotelDTO> dto = (List)request.getAttribute("list"); %>
		<c:forEach var="dto" items="${list}">
			<tr style="text-align:center;">
				<td>${dto.hotel_no}</td>
				<td>${dto.name}</td>
				<td>${dto.address}</td>
				<td>${dto.hp1} - ${dto.hp2} - ${dto.hp3}</td>
				<td>${dto.hotel_info}</td>
				<td>${dto.star}</td>
				<c:if test="${dto.filesize != 0}">
					<td>
						<img src="${pageContext.request.contextPath}/resources/img/<%=dto.get(cnt).getFilename().split("/")[0] %>" width="60">
					</td>
				</c:if>
				<c:if test="${dto.filesize == 0}">
					<td>이미지없음<%=dto.get(cnt).getFilename() %>
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
</div>
</div>
<%-- <%@ include file="../../Basic/bottom_nav.jsp" %>  --%>