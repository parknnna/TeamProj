<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
</script>
<%
	String img="";
	if(request.getParameter("img")!=null){
		img=request.getParameter("img");
	} 
%>
	<div align="center"style="margin-top:62px">
		<form action="ADroom_update.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="member_num" value="2">
		<input type="hidden" name="room_no" value="${dto.room_no}">
		<table width="100%">
			
			<tr>
				<td><input multiple="multiple" type="file" name="file" /></td>	
			</tr>
			<tr>
				<td>방이름 : <input type="text" name="name" value="${dto.name }"></td>
			</tr>
			<tr>
				<td>방 평수 : <input type="text" name="roomsize" value="${dto.roomsize}"></td>
			</tr>
			<tr>
				<td>인원수 : <input type="text" name="sleeps" value="${dto.sleeps }"></td>
			</tr>
			<tr>
				<td>구비 물품 : <input type="text" name="item" value="${dto.item }"></td>
			</tr>
			<tr>
				<td>방가격 : <input type="text" name="price" value="${dto.price }"></td>
			</tr>
			<tr>
			<td><input type="button" value="수정" onclick="javascript:check()">
			<input type="reset" value="다시쓰기"></td>
			</tr>
		</table>
	</form>
	</div>

<%@ include file="../../Basic/bottom_nav.jsp" %>