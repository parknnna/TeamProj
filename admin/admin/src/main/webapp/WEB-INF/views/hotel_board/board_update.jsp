<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../Basic/head.jsp" %>   
<%@ include file="../Basic/nav_Hotel.jsp" %>
<style>
	td{
		vertical-align:top;
		    padding: 5px;
	}
</style>
<body>
<div align="center" width="80%"style="margin-top:62px">
	<form name="f" action="hotel_board_update.do" method="post" onsubmit="return check()" enctype="multipart/form-data">
		<%hotel_boardDTO dto = (hotel_boardDTO)request.getAttribute("dto"); %>
		<input type="hidden" value="<%=dto.getHotel_board_no() %>" name="hotel_board_no">
		<input type="hidden" value="<%=dto.getMember_no() %>" name="member_no">
		<input type="hidden" value="<%=dto.getHotel_no() %>" name="hotel_no">
		<input type="hidden" value="<%=dto.getReadcount() %>" name="readcount">
		<input type="hidden" value="<%=dto.getReg_date() %>" name="reg_date">
		<input type="hidden" value="<%=dto.getRe_group() %>" name="re_group">
		<input type="hidden" value="<%=dto.getRe_step() %>" name="re_step">
		<input type="hidden" value="<%=dto.getRe_level() %>" name="re_level">
		<fieldset align="center" style="margin-top:100px;">
			<legend>게시글 수정</legend>
			<table align="center">
				<tr>
					<td >TITLE</td>
					<td><input type="text" name="title" class="box"></td>
				</tr>
				<tr>
					<td >CONTENT</td>
					<td><textarea name="content" rows="12" cols="60" class="box"></textarea></td>
				</tr>
				<tr>
					<td>FILE</td>
					<td><input multiple="multiple" type="file" name="file" />	</td>
				</tr>
				<tr><td colspan="2" align="center"><input type="reset" value="CANCEL">
			<input type="submit" value="SUMBIT"></td></tr>
			</table>
		</fieldset>
	</form>
</div>
  </body>
</html>
<%@ include file="../Basic/bottom_nav.jsp" %>