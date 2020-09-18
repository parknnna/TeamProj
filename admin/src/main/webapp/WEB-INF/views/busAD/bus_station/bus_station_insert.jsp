<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../top.jsp" %>
<script>
	function check(){
		if (f.station_name.value == "") {
            alert("터미널 이름를 입력하지 않았습니다.")
            f.seat.focus();
            return;
        }
		if (f.address.value == "") {
            alert("주소를 입력하지 않았습니다.")
            f.seat.focus();
            return;
        }
		
		document.f.submit()
	}
</script>

	<div align="center">
		<form name="f" action="ADbus_station_insert.do" method="post" enctype="multipart/form-data">
			<table width="100%">
				<tr>
					<td>터미널이름 : <input type="text" name="station_name"></td>
				</tr>
				<tr>
					<td>터미널주소 : <input type="text" name="address"></td>
				</tr>
				<tr>
					<td>터미널 이미지 : <input type="file" name="filename" size="30"></td>
				</tr>
				<tr>
					<td><input type="button" value="추가" onclick="javascript:check()">
					<input type="reset" value="다시쓰기">
				</tr>
			</table>
		</form>
	</div>
<%@ include file="../bottom.jsp"%>