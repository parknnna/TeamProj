<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="team.Dproject.main.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../Basic/head.jsp" %>   
<%@ include file="../../Basic/nav_AD.jsp" %>   
<%
Calendar cal = Calendar.getInstance();
int month = cal.get(Calendar.MONTH);
int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
%>
<style>
  table {
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
</style>
<% hotelDTO dto = (hotelDTO)request.getAttribute("dto"); %>
<div align="center" style="margin-top:62px">
	<table width="60%">
		<tr align="right">
			<th>${dto.name} 호텔의 정보</th>
			<td><a href="ADhotel_list.do">뒤로가기</a></td>
		</tr>
		<tr align="center" >
			<td>호텔번호</td><td>${dto.hotel_no}</td>
		</tr>
		<tr align="center" >
			<td>호텔주소</td><td>${dto.address}</td>
		</tr>
		<tr align="center" >
			<td>전화번호</td><td>${dto.hp1} - ${dto.hp2} - ${dto.hp3}</td>
		</tr>
		<tr align="center">
			<td>등급</td>
			<td>
			<%
			hotelDTO dto2=(hotelDTO)request.getAttribute("dto");
			int cnt=dto2.getStar();
			for(int i=0;i<cnt;i++){ %>
				<i class="fas fa-star"></i>
			<%}for(int i=cnt;i<7;i++){ %>
				<i class="far fa-star"></i>
			<%} %>
			</td>
		</tr>
		<tr align="center">
			<td>호텔정보</td><td>${dto.hotel_info }</td>
		</tr>
			
		<tr>
			<td colspan="2" align="center">
				<a href="ADhotel_update.do?hnum=${dto.hotel_no}">수정</a> | 
				<a href="ADhotel_delete.do?hnum=${dto.hotel_no}">삭제</a>
			</td>
		</tr>	
	
		
	</table>
</div>
<%@ include file="../../Basic/bottom.jsp" %>