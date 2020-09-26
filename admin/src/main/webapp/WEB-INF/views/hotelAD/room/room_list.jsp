<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="team.Dproject.main.model.*"%>
<%@page import="java.util.*"%>
<%@ include file="../../Basic/head.jsp" %>   
<%@ include file="../../Basic/nav_AD.jsp" %>   

<script type="text/javascript">
	function show(inum,rooms){
		for(var i=2;i<=rooms;i++){
			num=inum+"-"+i;
			if(document.getElementById(num).style.display==''){
				document.getElementById(num).style.display='none';
			}else{
				document.getElementById(num).style.display='';
			}
		}
	}
</script>
<%
List<roomDTO> list = (List) request.getAttribute("list");
%>

<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<div align="center" class="mainContainer" style="width: 90%;margin: 90px auto 10px auto;">
<div class="firstbox">
	<div class="titleContainer" style="width:100%">
		<h6 style="font-family: 'Nanum Gothic', sans-serif;float: left;border-radius: 10px;border: 2px solid #c94dff;padding: 5px;color: #696969;">호텔 룸 추가</h6>
	</div>
</div>	
<br>
<br>

<div class="secbox">	
	<div class="tableContainer" style="width:100%;" align="center">
		<table style="width:100%;font-size:14px;" class="infoTable">
		<tr align="right">
			<td colspan="7"><a href="ADroom_insert.do?hnum=<%=request.getParameter("hnum")%>">추가&nbsp;&nbsp;</a><a href="ADhotel_list.do">뒤로가기</a>
		</td>
		</tr>
		<tr>
			<td>방번호</td>
			<!-- 멤버넘 -->
			<!-- 호텔넘 -->
			<td>방이름</td>
			<td>방 평수</td>
			<td>인원수</td>
			<td>상세보기</td>
			<td>수정/삭제</td>
		</tr>
		
		<c:if test="${empty list}">
			<tr>
				<td colspan="7">등록된 방이 없습니다.</td>
			</tr>
		</c:if>
		<%
		if(list!=null){
			String num="";
			for(roomDTO dto : list){
				String temp=dto.getRoom_no();
				String[] arrtemp=temp.split("-");
				if(num.equals(arrtemp[0])||num==arrtemp[0]){
					%>
					<TR id="<%=dto.getRoom_no() %>" style="display:none;">
					<td>└ <%=dto.getRoom_no() %></td>
					<%
				}else{
					%>
					<TR style="border-top:2px solid #bc72db; border-bottom:2px solid #bc72db;">
					<td><%=dto.getRoom_no() %>
					&nbsp;<input type="button" onclick="javascript:show(<%=arrtemp[0]%>,<%=dto.getRooms() %>);" value="보기"></td>
					<%
				}
				%>
						<td><%=dto.getName() %></td>
						<td><%=dto.getRoomsize() %></td>
						<td><%=dto.getSleeps()%></td>
						<td><a href="ADroom_show.do?no=<%=dto.getRoom_no()%>">상세보기</a></td>					
						<%if(num.equals(arrtemp[0])||num==arrtemp[0]){%>
		 				<td><a href="ADroom_update.do?no=<%=dto.getRoom_no()%>">수정</a> | 
						<a href="ADroom_delete.do?no=<%=dto.getRoom_no()%>">삭제</a></td>
						<%}else{ %>
						<td><a href="ADroom_update.do?no=<%=dto.getRoom_no()%>">수정</a> | 
						<a href="ADroom_alldelete.do?no=<%=arrtemp[0]%>">전체삭제</a></td>
						<%} %>
					</TR>
				<%
				num=arrtemp[0];
			}
		}
		%>		
	</table>
</div>
<%-- <%@ include file="../../Basic/bottom_nav.jsp" %>
 --%>