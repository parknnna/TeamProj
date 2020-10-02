  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	function check(){
			
			if (f.station_name.value==""){
				alert("터미널명을 입력하세요!!")
				f.station_name.focus()
				return
			}
			if (f.address.value==""){
				alert("주소를 입력하세요!!")
				f.address.focus()
				return
			}
			document.f.submit()
		}
		function reset(){
			document.f.reset()
			
		}
</script>
<style>
 table.type10 {
    border-collapse: collapse;
    font-family: "Trebuchet MS";
    font-weight:bold;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    margin: 20px 10px;
    font-size:15px;
    width:80%;
	}
	table.type10  th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    color: #fff;
    background: #c94dff;
    margin: 20px 10px;
	}
	table.type10 th {
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
    font-size:20px;
	}
	table.type10 .none_even {
    
    font-size:20px;
	}

</style>
<%@ include file="../../Basic/top_Bus.jsp" %>
<%@include file="../bus_main/top.jsp" %>
	<div align="center">
		<form name="f" action="bus_station_insert.do" method="post" enctype="multipart/form-data">
			<table width="50%" border="1" class="type10">

				<tr style="background-color:#F2F2F2;">
					<td>터미널이름 : <input type="text" name="station_name"></td>
				</tr>
				<tr style="background-color:#F2F2F2;">
					<td>터미널주소 : <input type="text" name="address"></td>
				</tr>
				<tr style="background-color:#F2F2F2;">
					<td>파일명: <input type="file" name="filename"></td>
				</tr>
				<tr align="right" >
					<td>
					<input type="button" value="추가" onclick="javascript:check()">
	 				<input type = "button" value = "다시쓰기" onclick = "javascript:reset()">
					</td>
				</tr>
			</table>
		</form>
	</div>
<%@ include file="../../Basic/bottom_nav.jsp" %>