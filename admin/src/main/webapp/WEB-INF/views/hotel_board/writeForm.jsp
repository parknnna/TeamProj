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
<script>
function goBack() {
	  window.history.back();
	}
	</script>
<body>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<div align="center">
	<form name="f" action="hotel_board_write.do" method="post" onsubmit="return check()" enctype="multipart/form-data">
	<div align="center" style="margin-top:100px;width:80%;margin-bottom:20px;">
		<input type="hidden" value="<%=request.getParameter("hotel_no") %>" name="hotel_no">
		<fieldset align="center" style="margin-top:100px;">
			<legend style="font-family: 'Nanum Gothic', sans-serif;"><%=request.getAttribute("hotel_name") %> 리뷰 작성</legend>
			<label class="forumTitle">
				<div class="labelText" align="left">TITLE</div>
				<input type="text" name="title" class="box" size="108" maxlength="120">
			</label>
			
			<label class="forumContent">
				<div class="labelText" align="left">CONTENT</div>
				<textarea name="content" rows="10" cols="105" class="box" style="padding:10px"placeholder="내용을 입력해주세요"></textarea>
			</label>
			<br>
			
			<label class="forumFile" style="margin-right:460px;">
				<div class="labelText" align="left">FILE</div>
				<input type="file" multiple="multiple" name="file" class="box" size="90">
			</label>
			
			<hr style="width:70%;border:1px solid #dddddd;">
			<input type="reset" value="CANCEL">
			<input type="submit" value="SUMBIT">
			<input type="button" value="BACK" onclick="goBack()">
		</fieldset>
		</div>
	</form>
</div>
  </body>
</html>
<%@ include file="../Basic/bottom_nav.jsp" %>




