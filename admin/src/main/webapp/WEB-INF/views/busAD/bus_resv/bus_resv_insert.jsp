<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../Basic/head.jsp" %>   
<%@ include file="../../Basic/nav_AD.jsp" %>    
<%@ include file="../top2.jsp" %>
<%@page import="java.util.*"%>
<%@page import="team.Dproject.main.model.*"%>

<%@ include file="../sm.jsp" %>
<%
List<MemberDTO> mlist=(List)request.getAttribute("mlist");
bus_loadDTO bdto=(bus_loadDTO)request.getAttribute("dto");
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
	<div align="center"style="margin-top:62px">
		<form name="f" action="ADbus_resv_insert.do" method="post">
			<table align="center" width="50%">
				<tr><td align="right" colspan="2"><a href="#" onclick="goBack()">뒤로가기</a></tr>
				<tr>
					<td>회원 번호 : 
					<select name="member_no">
					<%for(MemberDTO dto : mlist){%>
						<option value="<%=dto.getMember_no()%>"><%=dto.getMember_no()%> . <%=dto.getName() %></option>
					<%}%>
					</select>
					</td>
				</tr>
				<tr>
					<td>버스번호 : <%=bdto.getBus_no() %><input type="hidden" name="bus_no" value="<%=bdto.getBus_no() %>"></td>
				</tr>
				<tr>
					<td>노선번호 : <%=bdto.getRoad_no()%> : <%=bdto.getArrival() %>--><%=bdto.getDeparture() %>
					<input type="hidden" name="road_no" value="<%=bdto.getRoad_no()%>"></td>
				</tr>
				<tr>
					<td>자리번호 : <input type="text" name="seat" value="${bus.seat}"></td>
				</tr>
				<tr>
					<td>사용한 포인트 : <input type="text" name="use_point" value="${bus.use_point}"></td>
				</tr>
				<tr>
					<td>적립 : <input type="text" name="save_point" value="${bus.save_point}"></td>
				</tr>
				<tr>
					<td>금액 : <input type="text" name="price" value="${bus.save_point}"></td>
				</tr>
				<tr>
					<td>날짜 : <input type="date" name="resv_date" value="${bus.resv_date}"></td>
				</tr>
				<tr><td><input type="button" value="입력" onclick="javascript:check()">
				<input type="reset" value="다시쓰기"></td></tr>

			</table>
		</form>
	</div>
<%@ include file="../../Basic/bottom_nav.jsp" %>