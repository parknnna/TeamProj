<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../Basic/head.jsp" %>   
<%@ include file="../../Basic/nav_AD.jsp" %>   
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
	function goBack() {
		  window.history.back();
		}

</script>
<style>
	td{
		vertical-align:top;
		    padding: 5px;
	}
	th{
		align:left;
	}
</style>

<div align="center"style="margin-top:90px" width="50%" >
	<form name="f" action="ADroom_insert.do" method="post" enctype="multipart/form-data" width="50%">
		<input type="hidden" name="hotel_no" value="<%=request.getParameter("hnum")%>">
		<table width="60%" >
		<tr><td align="right" colspan="2"><a href="#" onclick="goBack()">뒤로가기</a></tr>
			<tr align="center">
				<td align="right">방이름 : </td><td align="left"><input type="text" name="name"></td>
			</tr>
			<tr align="center">
				<td align="right">방 평수 : </td><td align="left"><input type="text" name="roomsize"></td>
			</tr>
			<tr align="center">
				<td align="right">인원수 : </td><td align="left"><input type="text" name="sleeps"></td>
			</tr>
			<tr align="center">
				<td align="right">구비 물품 : </td><td align="left"><input type="text" name="item"></td>
			</tr >
			<tr align="center">
				<td align="right">방가격 : </td><td align="left"><input type="text" name="price" size="30"></td>
			</tr>
			<tr align="center">
				<td align="right">방의 수 : </td><td align="left"><input type="text" name="rooms" size="30"></td>
			</tr>
			<tr align="center">
				<td align="right">방등급 : </td><td align="left">
					<select name="grade">
						<option value="1">디럭스</option>
						<option value="2">스텐다드</option>
						<option value="3">패밀리</option>
					</select>
				</td>	
			</tr>
			<tr align="center">
				<td align="right">방이미지 : </td><td align="left"><input multiple="multiple" type="file" name="file" /></td>	
			</tr>
			<tr align="center">
			<td colspan="2"><input type="button" value="추가" onclick="javascript:check()">
			<input type="reset" value="다시쓰기"></td>
			</tr>

		</table>
	</form>
</div>
<%@ include file="../../Basic/bottom_nav.jsp" %>