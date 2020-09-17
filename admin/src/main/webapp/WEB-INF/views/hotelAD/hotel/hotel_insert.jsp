<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	td{
		vertical-align:top;
		    padding: 5px;
	}
	th{
		align:left;
	}
</style>

<div align="center"style="margin-top:90px">
	<form name="f" action="ADhotel_insert.do" method="post" enctype="multipart/form-data">
		<table width="30%">
		<tr><td align="right" colspan="2"><a href="#" onclick="goBack()">뒤로가기</a></tr>
			<tr>
				<td>호텔이름 : </td><td> <input type="text" name="name"></td>
			</tr>
			<tr>
				<td>호텔주소 : </td><td> <input type="text" name="address"></td>
			</tr>
			<tr>
				<td>전화번호 : </td><td> <input type="tel" name="hp1" maxlength="3" size="3"> - <input
					type="tel" name="hp2"maxlength="4"size="5"> - <input type="tel" name="hp3"maxlength="4"size="5">
				</td>
			</tr>
			<tr>
				<td>호텔 소개 : </td><td> <input type="text" name="hotel_info"></td>
			</tr>
			<tr>
				<td>호텔 성급 : </td><td> <select name="star">
						<option value="1">1성급</option>
						<option value="2">2성급</option>
						<option value="3">3성급</option>
						<option value="4">4성급</option>
						<option value="5">5성급</option>
						<option value="6">6성급</option>
						<option value="7">7성급</option>
				</select></td>
			</tr>
			<tr>
				<td>호텔이미지 :</td><td> <input type="file" name="filename" size="30"></td>
			</tr>
			<tr><td colspan="2"><input type="button" value="추가" onclick="javascript:check()">
				<input type="reset" value="다시쓰기"></td></tr>

		</table>
	</form>
</div>
<%@ include file="../../Basic/bottom_nav.jsp" %>