<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.*"%>
<%@page import="team.Dproject.main.model.*"%>
<%@ include file="../../Basic/head.jsp" %>   
<%@ include file="../../Basic/nav_AD.jsp" %>    
<%@ include file="../top2.jsp" %>

<%
List<bus_resvDTO> list=(List)request.getAttribute("list");
List<bus_loadDTO> llist=(List)request.getAttribute("llist");
int temp=0;
%>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<style>
.listBox tr td{
	border-bottom: 1px solid #444444;
    padding: 10px;
    }
</style>
	<div align="center" width="70%" align="center" >
		<h4 style="font-family: 'Nanum Gothic', sans-serif;margin-top:20px">예약 리스트</h4>
		<table style="width:60%;" class="listBox">
			<tr><td align="right" colspan="10"><a href="#" onclick="goBack()">뒤로가기</a></tr>
			<tr>
				<td>예약번호</td>
				<td>예약한 사람</td>
				<td>버스 번호</td>
				<td>노선 </td>
				<td>자리</td>
				<td>사용한 포인트</td>
				<td>적립 포인트</td>
				<td>예약 날짜</td>
				<td>가격</td>
				<td>수정/삭제</td>
			</tr> 
			<c:if test="${empty list}">
				<tr>
					<td colspan="10">등록된 버스예약이 없습니다.</td>
				</tr>	
			</c:if>
			<%
			for(bus_resvDTO dto : list){
			%>
			<tr>
				<td><%=dto.getBus_resv_no() %></td> 
				<td><%=dto.getMember_no() %></td>
				<td><%=dto.getBus_no() %></td>
				<td><%=llist.get(temp).getArrival()%> >> <%=llist.get(temp).getDeparture() %></td>
				<td><%=dto.getSeat() %></td>
				<td><%=dto.getUse_point() %></td>
				<td><%=dto.getSave_point() %></td>
				<td><%=dto.getResv_date() %></td>
				<td><%=dto.getPrice() %></td>
				<td>
					<a href="ADbus_resv_update.do?no=<%=dto.getBus_resv_no()%>">수정</a> | 
					<a href="ADbus_resv_delete.do?no=<%=dto.getBus_resv_no()%>">삭제</a>
				</td>
			</tr>
			<%
			temp++;}
			%>
		</table>	
	</div>
<%-- <%@ include file="../../Basic/bottom_nav.jsp" %> --%>