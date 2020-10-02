  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../Basic/top_Bus.jsp" %>
<%@include file="../bus_main/top.jsp" %>
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
	table.type10 th {
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
    width: 350px;
    padding: 10px;
    vertical-align: top;
	}
	table.type10 .even {
    background: #fdf3f5;
    font-size:15px;
	}
	table.type10 .none_even {
    
    font-size:20px;
	}
</style>
	<div align="center">
		<form action="bus_station_update.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="station_no" value="${station.station_no}">
			<table width="50%" border="1" class="type10">
				<tr style="background-color:#F2F2F2;">
				<td>터미널번호 : <input type="text" name="station_no" value="${station.station_no}"readonly></td>		
				</tr>
				<tr style="background-color:#F2F2F2;">
					<td>터미널이름 : <input type="text" name="station_name" value="${station.station_name}"></td>
				</tr>
				<tr style="background-color:#F2F2F2;">
					<td>터미널주소 : <input type="text" name="address" value="${station.address}" size="35"></td>
				</tr >
				<tr style="background-color:#F2F2F2;">
					<td>수정할 파일명: <input type="file" name="filename"></td>
	
				</tr >
				<tr style="background-color:#F2F2F2;">
					<td>수정전 파일명:<input type = "text" name = "filename2" value = "${station.filename}" readOnly></td>
				</tr>
				<tr align="right" ><td><input type="submit" value="수정"></td></tr>
			</table>
		</form>
	</div>
<%@ include file="../../Basic/bottom_nav.jsp" %>