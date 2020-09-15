  
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
<%@ include file="../bus_main/top.jsp" %>
	<div align="center">
		<form name="f" action="bus_station_insert.do" method="post" enctype="multipart/form-data">
			<table width="50%" border="1">

				<tr>
					<td>터미널이름 : <input type="text" name="station_name"></td>
				</tr>
				<tr>
					<td>터미널주소 : <input type="text" name="address"></td>
				</tr>
				<tr>
					<td>파일명: <input type="file" name="filename"></td>
				</tr>
				<tr align="right">
					<td>
					<input type="button" value="추가" onclick="javascript:check()">
	 				<input type = "button" value = "다시쓰기" onclick = "javascript:reset()">
					</td>
				</tr>
			</table>
		</form>
	</div>
<%@ include file="../bus_main/bottom.jsp"%>