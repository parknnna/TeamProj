  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
#btn button{
		border:0;
		font-size:18px;
		background-color:rgba(0,0,0,0);
		color:#c94dff;
		padding:5px;
		font-family: "Trebuchet MS";
		border-top-left-radius: 3px;
  		border-top-right-radius: 5px;
   		border-bottom-right-radius: 8px;
   		border-bottom-left-radius: 10px;
		
		}
	#btn a{
		font-family: "Trebuchet MS";
		font-size:25px;
   	 	font-weight:bold;
	}
	#btn button:hover{
		color:white;
		background-color:#c94dff;
		}
		
	table.type10 {
    border-collapse: collapse;
    font-family: "Trebuchet MS";
    font-weight:bold;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    margin: 20px 10px;
    font-size:20px;
	}
	table.type10  th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background: #c94dff;
    margin: 20px 10px;
	}
	table.type10  th {
    width: 150px;
    padding: 10px;
	}
	table.type10 td {
    width: 300px;
    padding: 10px;
    vertical-align: top;
	}
	table.type10 .even {
    background: #fdf3f5;
    font-size:20px;
	}
	table.type10 .none_even {
    
    font-size:20px;
	}
</style>
<%@ include file="../../Basic/top_Bus.jsp" %>
<%@include file="../bus_main/top.jsp" %>

	<div align="center">
		<form action="bus_update.do" method="post">
		<input type="hidden" name="bus_no" value="${bus.bus_no }">
			<table width="50%" border="1" class="type10">
				<tr style="background-color:#F2F2F2;">
					<td>버스번호 : <input type="text" name="bus_no" value="${bus.bus_no}" readonly></td>
				</tr>
				<tr style="background-color:#F2F2F2;">
					<td>버스등급 : 
					<select name="grade">
						<option>${bus.grade}</option>
						<c:if test="${bus.grade=='일반' }"><!-- 버스 등급이 일반인 경우 우등 출력 추가c -->
							<option value="우등">우등</option>
						</c:if>
						<c:if test="${bus.grade=='우등' }"><!-- 버스 등급이 우등인 경우 일반출력 추가 -->
							<option value="일반">일반</option>
						</c:if>
					</select>
					
				</tr>
				<tr style="background-color:#F2F2F2;">
					<td>버스좌석수 : <input type="text" name="seat" value="${bus.seat}"></td>
				</tr>
				<tr align="right"><td><input type="submit" value="수정"></td></tr>
			</table>
		</form>
	</div>
<%@ include file="../../Basic/bottom_nav.jsp" %>
