<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../top.jsp"%> 
<script>
	function check(){
		if (f.name.value == "") {
            alert("룸이름를 입력하지 않았습니다.")
            f.name.focus();
            return;
        }
		if (f.roomsize.value == "") {
            alert("평수를 입력하지 않았습니다.")
            f.roomsize.focus();
            return;
        }
		if (f.sleeps.value == "") {
            alert("인원수를 입력하지 않았습니다.")
            f.sleeps.focus();
            return;
        }
		if (f.item.value == "") {
            alert("구비 물품를 입력하지 않았습니다.")
            f.item.focus();
            return;
        }
		if (f.price.value == "") {
            alert("가격를 입력하지 않았습니다.")
            f.price.focus();
            return;
        }
		if (f.rooms.value == "") {
            alert("방의 수를 입력하지 않았습니다.")
            f.rooms.focus();
            return;
        }
		
		document.f.submit()
	}
</script>

<div align="center">
	<form name="f" action="ADroom_insert.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="hotel_no" value="<%=request.getParameter("hnum")%>">
		<table width="100%">
			<tr>
				<td><input multiple="multiple" type="file" name="file" /></td>	
			</tr>
			<tr>
				<td>방이름 : <input type="text" name="name"></td>
			</tr>
			<tr>
				<td>방 평수 : <input type="text" name="roomsize"></td>
			</tr>
			<tr>
				<td>인원수 : <input type="text" name="sleeps"></td>
			</tr>
			<tr>
				<td>구비 물품 : <input type="text" name="item"></td>
			</tr>
			<tr>
				<td>방가격 : <input type="text" name="price" size="30"></td>
			</tr>
			<tr>
				<td>방의 수 : <input type="text" name="rooms" size="30"></td>
			</tr>
			<tr>
			<td><input type="button" value="추가" onclick="javascript:check()">
			<input type="reset" value="다시쓰기"></td>
			</tr>

		</table>
	</form>
</div>
<%@ include file="../bottom.jsp"%>