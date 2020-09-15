<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="team.Dproject.main.model.*"%>
<%@page import="java.util.*"%>
<%@ include file="../top.jsp"%>
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
<div align="center">
	<table width="70%" border="1">
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
					<TR id="<%=dto.getRoom_no() %>" style="display:none; background-color:#c4fffd;'">
					<td>└<%=dto.getRoom_no() %></td>
					<%
				}else{
					%>
					<TR style="background-color:#00cfc8;">
					<td><%=dto.getRoom_no() %><input type="button" onclick="javascript:show(<%=arrtemp[0]%>,<%=dto.getRooms() %>);" value="보기"></td>
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
<%@ include file="../bottom.jsp"%>
