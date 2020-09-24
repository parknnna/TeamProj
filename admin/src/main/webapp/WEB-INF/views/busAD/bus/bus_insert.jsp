<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../Basic/head.jsp" %>   
<%@ include file="../../Basic/nav_AD.jsp" %>    
<%@ include file="../top2.jsp" %>
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
<style>

  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
</style>

	<div width="50%" align="center">
		<form name="f" action="ADbus_insert.do" method="post">
			<table width="50%" align="center">
				<tr align="center">
					<td>버스등급 : 
						<select name="grade">
							<option value="일반">일반</option>
							<option value="우등">우등</option>
						</select>
					</td>
				</tr>
				<tr align="center">
					<td>버스좌석수 : <input type="text" name="seat"></td>
				</tr>
				<tr align="center"><td><input type="button" value="확인" onclick="javascript:check()">
				<input type="reset" value="다시쓰기">
				</td></tr>
				
			</table>
		</form>
	</div>
<%@ include file="../../Basic/bottom_nav.jsp" %>