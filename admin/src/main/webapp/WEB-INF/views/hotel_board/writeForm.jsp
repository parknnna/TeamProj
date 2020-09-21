<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="top.jsp"%>
<body>
<div align="center" width="80%">
	<form name="f" action="hotel_board_write.do" method="post" onsubmit="return check()" enctype="multipart/form-data">
		<input type="hidden" value="<%=request.getParameter("hotel_no") %>" name="hotel_no">
		<fieldset align="center" style="margin-top:100px;">
			<legend>새로운 게시글 작성</legend>
			<label>TITLE</label>
			<input type="text" name="title" class="box">
			<br>
			<label>CONTENT</label>
			<textarea name="content" rows="12" cols="60" class="box"></textarea>
			<br>
			<label>FILE</label>
			<input multiple="multiple" type="file" name="file" />	
			<br>
			<input type="reset" value="CANCEL">
			<input type="submit" value="SUMBIT">
		</fieldset>
	</form>
</div>
  </body>
</html>
<%@ include file="bottom.jsp"%>