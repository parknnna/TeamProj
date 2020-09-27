<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.*"%>
<%@page import="team.Dproject.main.model.*"%>
<%@ include file="../../Basic/head.jsp" %>   
<%@ include file="../../Basic/nav_AD.jsp" %>    
<%@ include file="../top2.jsp" %>
<%
List<BusDTO> list=(List)request.getAttribute("bus_list");
List<bus_stationDTO> list2=(List)request.getAttribute("bus_station_list");
List<bus_loadDTO> llist=(List)request.getAttribute("llist");
boolean b=true;
%>

<%-- <%@ include file="../sm.jsp" %>
 --%><script>
	function check(){
		if (f.price.value == "") {
            alert("가격를 입력하지 않았습니다.")
            f.price.focus();
            return;
        }
		if (f.arr_time.value == "") {
            alert("출발시간를 입력하지 않았습니다.")
            f.arr_time.focus();
            return;
        }
		if (f.tot_time.value == "") {
            alert("도착시간를 입력하지 않았습니다.")
            f.tot_time.focus();
            return;
        }
		
		
		document.f.submit()
	}
</script>

	<div align="center"style="margin-top:62px"     >
		<form name="f" action="ADbus_load_insert.do" method="post">
			<table width="50%">
				<tr><td align="right" colspan="2"><a href="#" onclick="goBack()">뒤로가기</a></tr>
				<tr>
					<td>버스번호 : 
						<select name="bus_no">
						<%
							for(BusDTO dto : list){
								boolean a=false;
								for(bus_loadDTO ldto : llist){
									if(dto.getBus_no()==ldto.getBus_no()){
										a=true;
									}
								}
								if(!a){b=false;%>
								<option value="<%=dto.getBus_no()%>"><%=dto.getBus_no() %></option>
								<%}%>
						<%	}
							if(b){%>
								<option>버스없음</option>
						<%	}%>
						</select>
					</td>
				</tr>
				<tr>
					<td>출발지 : 
						<select name="arrival">
						<%
							for(bus_stationDTO dto : list2){
							%>
								<option value="<%=dto.getStation_no()%>"><%=dto.getStation_name() %></option>
								
							<%
							}
						%>
						</select>
					</td>
				</tr>
				<tr>
					<td>도착지 : 
						<select name="departure">
						<%
							for(bus_stationDTO dto : list2){
							%>
								<option value="<%=dto.getStation_no()%>"><%=dto.getStation_name() %></option>
								
							<%
							}
						%>
						</select>
					</td>
				</tr>
				<tr>
					<td>가격 : <input type="text" name="price" ></td>
				</tr>
				<tr>
					<td>출발시간 : <input type="text" name="arr_time" ></td>
				</tr>
				<tr>
					<td>도착시간 : <input type="text" name="tot_time"></td>
				</tr>
				<tr><td><input type="button" value="확인" onclick="javascript:check()">
				<input type="reset" value="다시쓰기">
				</tr>
			</table>
		</form>
	</div>
<%@ include file="../../Basic/bottom_nav.jsp" %>