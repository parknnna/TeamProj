<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../Basic/head.jsp" %>   
<%@ include file="../../Basic/nav_AD.jsp" %>   
<script>
	function check(){
		if (f.name.value == "") {
            alert("호텔 이름를 입력하지 않았습니다.")
            f.name.focus();
            return;
        }
		if (f.address.value == "") {
            alert("호텔 주소를 입력하지 않았습니다.")
            f.address.focus();
            return;
        }
		if (f.hp1.value == "" ||f.hp2.value == "" ||f.hp3.value == "") {
            alert("전화번호를 입력하지 않았습니다.")
            f.hp1.focus();
            return;
        }
		if (f.hotel_info.value == "") {
            alert("호텔 설명를 입력하지 않았습니다.")
            f.hotel_info.focus();
            return;
        }
		document.f.submit()
	}

	function goBack() {
	  window.history.back();
	}
</script>
<style>
	  .updateTable td {
   	border-bottom: 1px solid #444444;
    padding: 10px 0;
  }
</style>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<div align="center" class="mainContainer" style="width: 90%;margin: 90px auto 10px auto;">
<div class="firstbox">
	<div class="titleContainer" style="width:100%">
		<h6 style="font-family: 'Nanum Gothic', sans-serif;float: left;border-radius: 10px;border: 2px solid #c94dff;padding: 5px;color: #696969;">호텔 정보 수정</h6>
	</div>
</div>
<br>
<br>
<div class="secbox">
<div class="tableContainer" align="center" style="width:90%">
		<form name="f" action="ADhotel_update.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="member_num" value="0">
		<input type="hidden" name="hotel_no" value="${dto.hotel_no}">
		<table style="width:100%;font-size:14px;" class="updateTable">
		<tr><td align="right" colspan="2"><a href="#" onclick="goBack()">뒤로가기</a></tr>
			<tr>
				<td>호텔 이름</td>
				<td><input type="text" style="width:300px" name="name" value="${dto.name}"></td>
			</tr>
			<tr>
				<td>호텔 주소</td>
				<td><input type="text" style="width:300px" name="address" value="${dto.address}"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>
				<input type="text" name="hp1" value="${dto.hp1}" size="3"> - <input
					type="text" name="hp2" value="${dto.hp2}" size="4"> - <input type="text" name="hp3" value="${dto.hp3}"size="4">
				</td>
			</tr>
			<tr>
				<td>호텔 소개</td>
				<td><textarea cols="60" rows="5" style="width:90%;" name="hotel_info">${dto.hotel_info}</textarea></td>
			</tr>
			<tr>
				<td>호텔 성급</td>
				<Td>
					<select name="star">
						<option value="1">1성급</option>
						<option value="2">2성급</option>
						<option value="3">3성급</option>
						<option value="4">4성급</option>
						<option value="5">5성급</option>
						<option value="6">6성급</option>
						<option value="7">7성급</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>호텔 이미지</td>
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

<%-- <%@ include file="../../Basic/bottom_nav.jsp" %> --%>