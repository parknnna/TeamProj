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
		
		
		document.f.submit()
	}
</script>
<%
	String img="";
	if(request.getParameter("img")!=null){
		img=request.getParameter("img");
	} 
%>
<style>
	  .updateTable td {
   	border-bottom: 1px solid #444444;
    padding: 10px 0;
  }
</style>
<a href="#" onclick="goBack()">Back</a>

<script>
function goBack() {
  window.history.back();
}
</script>

<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<div align="center" class="mainContainer" style="width: 90%;margin: 90px auto 10px auto;">
<div class="firstbox">
	<div class="titleContainer" style="width:100%">
		<h6 style="font-family: 'Nanum Gothic', sans-serif;float: left;border-radius: 10px;border: 2px solid #c94dff;padding: 5px;color: #696969;">방 정보 수정</h6>
	</div>
</div>
<br>
<br>
<div class="secbox">
<div class="tableContainer" align="center" style="width:90%">
		<form name="f" action="ADroom_update.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="member_num" value="2">
		<input type="hidden" name="room_no" value="${dto.room_no}">
		<table style="width:100%;font-size:14px;" class="updateTable">
			<tr><td align="right" colspan="2"><a href="#" onclick="goBack()">뒤로가기</a></tr>
			<tr>
				<td>방 이름</td>
				<td><input type="text" style="width:100px" name="name" value="${dto.name }"></td>
			</tr>
			<tr>
				<td>방 평수</td>
				<td><input type="text" style="width:50px" name="roomsize" value="${dto.roomsize}">평</td>
			</tr>
			<tr>
				<td>인원 수</td>
				<td><input type="text" style="width:40px" name="sleeps" value="${dto.sleeps }">명</td>
			</tr>
			<tr>
				<td>구비 물품</td>
				<td><textarea cols="60" rows="5" style="width:90%;" name="item">${dto.item}</textarea></td>
			</tr>
			<tr>
				<td>방 가격</td>
				<td><input type="text" name="price" value="${dto.price }"></td>
			</tr>
			<tr>
				<td>방 등급</td>
				<td>
					<select name="grade">
						<option value="1">디럭스</option>
						<option value="2">스텐다드</option>
						<option value="3">패밀리</option>
					</select>
				</td>	
			</tr>
			<tr>
				<td>이미지</td>
				<td><input multiple="multiple" type="file" name="file" /></td>	
			</tr>
			<tr>
			<td colspan="2" align="center">
			<input type="button" value="수정" onclick="javascript:check()">
			<input type="reset" value="다시쓰기"></td>
			</tr>
		</table>
	</form>
	</div>
</div>
</div>
<%-- 
<%@ include file="../../Basic/bottom_nav.jsp" %> --%>