<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">	
	function check(){
			
			//출발지,도착지,편도일시,왕복일시 유효성 검사 해야함 아직 안함
			if (f.grade.value==""){
				alert("등급을 선택해주세요")
				f.grade.focus()
				return
			}
			
			document.f.submit()
		}
	 
	function setDisplay(){ //편도 왕복 선택시 보이고 안보이고
	    if($('input:radio[id=oneway]').is(':checked')){
	        $('#two').hide();
	        $('#one').show();
	    }else if($('input:radio[id=twoway]').is(':checked')){
	    	 $('#one').hide();
		     $('#two').show();
	    }
	}

	
	</script>
<%@ include file="../bus_main/top.jsp"%>

<div align="center">
	<form name="f" action="bus_resv_user_dispatch.do">
	<div style="border:1px solid gray; width:50%; float:center;">
		
		<table	border="1">
			<tr align="center">
				<td colspan="4" width="400">
					<input id="oneway" type="radio" name="mode" value="oneway" onchange="setDisplay()">☞편도
					<input id="twoway" type="radio" name="mode" value="twoway" onchange="setDisplay()">☞☜왕복
				</td>
			</tr>
			<tr align="left">
				<td colspan="2">
					
					<a href="bus_resv_user_arrival.do">
						출발지
					</a>
				</td>
				<td colspan="2">
					
					<a href="bus_resv_user_departure.do">
						도착지
					</a>
				</td>
			</tr>
			<tr>
			
				<td colspan="2"><c:if test="${not empty arr_dto.station_name}"><input type="hidden" name="arrival" value="${arrnoDTO.station_no}">${arr_dto.station_name}</c:if></td>
				<td colspan="2"><c:if test="${not empty dep_dto.station_name}"><input type="hidden" name="departure" value="${depnoDTO.station_no}">${dep_dto.station_name}</c:if></td>
			</tr>
			
			<tr id="one">
				<td  colspan="4" width="100%">날짜선택<input  type="date" name="one_date"></td>
			</tr>
			
			<tr align="center" id="two" style="display:none"> 
				<td colspan="2" width="50%">출발일<input type="date" name="arr_date"></td>
				<td colspan="2" width="50%">도착일<input type="date"  name="dep_date"></td>
			</tr>
			<tr align="left">
				<td>등급</td>
				<td><input type="radio" name="grade" value="전체" >전체</td>
				<td><input type="radio" name="grade" value="우등">우등</td>
				<td><input type="radio" name="grade" value="일반">일반</td>
			</tr>
			<tr align="right">
				<td colspan="4">
					<input type="button" value="조회" onclick="javascript:check()">
				</td>
			</tr>
		</table>
	</div>
	
</form>
</div>


<%@ include file="../bus_main/bottom.jsp"%>