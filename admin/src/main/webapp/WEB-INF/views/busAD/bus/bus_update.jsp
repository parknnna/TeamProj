<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../Basic/head.jsp" %>   
<%@ include file="../../Basic/nav_AD.jsp" %>    
<%@ include file="../top2.jsp" %>
<style>
	table{
		margin:auto;
		text-align:center;
	}
</style>
<script>
	function check(){
		if (f.seat.value == "") {
            alert("좌석수를 입력하지 않았습니다.")
            f.seat.focus();
            return;
        }
		
		document.f.submit()
	}
</script>

<%@ include file="../sm.jsp" %>

	<div align="center">
		<form name="f" action="ADbus_update.do" method="post">
		<input type="hidden" name="bus_no" value="${bus.bus_no }">
			<table width="30%" text-align="center">
			<tr><td align="right" colspan="2"><a href="#" onclick="goBack()">뒤로가기</a></tr>
				<tr>
					<td align="right">버스등급 : </td><td><input type="text" name="grade" value="${bus.grade}"></td>
				</tr>
				<tr>
					<td align="right">버스좌석수 : </td><td><input type="text" name="seat" value="${bus.seat}"></td>
				</tr>
				<tr><td colspan="2"><input type="button" value="수정" onclick="javascript:check()">
			</table>
		</form>
	</div>
<%@ include file="../../Basic/bottom_nav.jsp" %>