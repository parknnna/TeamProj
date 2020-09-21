  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<script type="text/javascript">
	function check(){
			
			if (f.seat.value==""){
				alert("좌석수를 입력해주세요!!")
				f.seat.focus()
				return
			}
			if (f.grade.value==""){
				alert("등급을 입력해주세요!!")
				f.grade.focus()
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
		<form name="f" action="bus_insert.do" method="post">
			<table width="50%" border="1">

				<tr>
					<td>버스등급 :
					<select name="grade">
						<option value="">선택</option>
						<option value="일반">일반</option>
						<option value="우등">우등</option>
					</select> 
					</td>
				</tr>
				<tr>
					<td>버스좌석수 : <input type="text" name="seat"></td>
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