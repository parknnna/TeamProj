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
bus_loadDTO LDTO = (bus_loadDTO)request.getAttribute("LDTO");
%>

<%@ include file="../sm.jsp" %>
<script>
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
	<div align="center"style="margin-top:62px"  >
		<form name="f" action="ADbus_load_update.do" method="post">
		<input type="hidden" name="road_no" value="${bus.road_no }">
			<table width="50%">
				<tr><td align="right" colspan="2"><a href="#" onclick="goBack()">뒤로가기</a></tr>
				<tr>
					<td>버스번호 : 
						<select name="bus_no">
						<%
							List<bus_loadDTO> list3=(List)request.getAttribute("bus_lord_list");
							boolean a=true;
							for(BusDTO dto : list){
								a=true;
								for(bus_loadDTO dto2 : list3){
									if(dto2.getBus_no()==dto.getBus_no()){
										a=false;
									}
								}
							if(a){
								if(dto.getBus_no()==LDTO.getBus_no()){%>
									<option value="<%=dto.getBus_no()%>" selected><%=dto.getBus_no() %></option>
								<%}else{%>
										<option value="<%=dto.getBus_no()%>"><%=dto.getBus_no() %></option>
								<%}}}%>
						</select>
					</td>
				</tr>
				<tr>
					<td>출발지 : 
						<select name="arrival">
						<%
							for(bus_stationDTO dto : list2){
								if(dto.getStation_no()==Integer.valueOf(LDTO.getArrival())){%> 
									<option value="<%=dto.getStation_no()%>" selected><%=dto.getStation_name() %></option> 
								<%}else{%> 
								<option value="<%=dto.getStation_no()%>"><%=dto.getStation_name() %></option>	
							<%}}%>
						</select>
					</td>
				</tr>
				<tr>
					<td>도착지 : 
						<select name="departure">
						<%
							for(bus_stationDTO dto : list2){
								if(dto.getStation_no()==Integer.valueOf(LDTO.getDeparture())){%> 
									<option value="<%=dto.getStation_no()%>" selected><%=dto.getStation_name() %></option>
								<%}else{%>
								<option value="<%=dto.getStation_no()%>"><%=dto.getStation_name() %></option>	
							<%}}%>
						</select>
					</td>
				</tr>
				<tr>
					<td>가격 : <input type="text" name="price" value="<%=LDTO.getPrice()%>"></td>
				</tr>
				<tr>
					<td>출발시간 : <input type="text" name="arr_time" value="<%=LDTO.getArr_time()%>"></td>
				</tr>
				<tr>
					<td>도착시간 : <input type="text" name="tot_time" value="<%=LDTO.getTot_time()%>"></td>
				</tr>
				<tr><td><input type="button" value="수정" onclick="javascript:check()">
				<input type="reset" value="다시쓰기">
				</tr>
			</table>
		</form>
	</div>
