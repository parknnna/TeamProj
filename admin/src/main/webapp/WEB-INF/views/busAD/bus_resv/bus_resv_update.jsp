<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../Basic/head.jsp" %>   
<%@ include file="../../Basic/nav_AD.jsp" %>    
<%@ include file="../top2.jsp" %>
<%@page import="java.util.*"%>
<%@page import="team.Dproject.main.model.*"%>
<%
List<MemberDTO> mlist=(List)request.getAttribute("mlist");
List<bus_loadDTO> llist=(List)request.getAttribute("llist");
bus_resvDTO rdto=(bus_resvDTO)request.getAttribute("rdto");
%>
<script>
	function check(){
		if (f.seat.value == "") {
            alert("자리를 입력하지 않았습니다.")
            f.seat.focus();
            return;
        }
		if (f.use_point.value == "") {
            alert("사용포인트를 입력하지 않았습니다.")
            f.use_point.focus();
            return;
        }
		if (f.save_point.value == "") {
            alert("적립포인트를 입력하지 않았습니다.")
            f.save_point.focus();
            return;
        }
		if (f.resv_date.value == "") {
            alert("날짜를 입력하지 않았습니다.")
            f.resv_date.focus();
            return;
        }
		
		
		document.f.submit()
	}
</script>
	<div align="center"style="margin-top:62px"     >
		<form action="ADbus_resv_update.do" method="post">
		<input type="hidden" name="resv_no" value="${bus.resv_no }">
			<table width="100%">
				<tr>
					<td>회원 번호 : 
					<select name="member_no">
					<%for(MemberDTO dto : mlist){
						if(dto.getMember_no()==rdto.getMember_no()){%>
								<option value="<%=dto.getMember_no()%>" selected><%=dto.getMember_no()%> . <%=dto.getName() %></option>
					<%	}else{
					%>	
						<option value="<%=dto.getMember_no()%>"><%=dto.getMember_no()%> . <%=dto.getName() %></option>
					<%}}%>
					</select>
					</td>
				</tr>
<!-- 버스번호 -->
				<tr>
					<td>노선번호 번호 : 
					<select name="member_no">
					<%for(bus_loadDTO dto : llist){
						if(dto.getRoad_no()==rdto.getRoad_no()){%>
						<option value="<%=dto.getRoad_no()%>" selected>번호 : <%=dto.getRoad_no()%>   <%=dto.getArrival()%> >> <%=dto.getDeparture() %></option>
						<%}else{%>
						<option value="<%=dto.getRoad_no()%>">번호 : <%=dto.getRoad_no()%>   <%=dto.getArrival()%> >> <%=dto.getDeparture() %></option>
					<%}}%>
					</select>
					</td>
				</tr>
				<tr>
					<td>자리번호 : <input type="text" name="seat" value="<%=rdto.getSeat()%>"></td>
				</tr>
				<tr>
					<td>사용한 포인트 : <input type="text" name="use_point" value="<%=rdto.getUse_point()%>"></td>
				</tr>
				<tr>
					<td>적립 : <input type="text" name="save_point" value="<%=rdto.getSave_point()%>"></td>
				</tr>
				<tr>
					<td>날짜 : <input type="text" name="resv_date" value="<%=rdto.getResv_date()%>"></td>
				</tr>
				<tr><td><input type="button" value="수정" onclick="javascript:check()">
				<input type="reset" value="다시쓰기"></td></tr>

			</table>
		</form>
	</div>

<%@ include file="../../Basic/bottom.jsp" %>