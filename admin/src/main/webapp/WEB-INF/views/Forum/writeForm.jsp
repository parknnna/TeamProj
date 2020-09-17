<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../Basic/head.jsp" %>
<body>
<%@ include file="../Basic/nav_Forum.jsp" %>
<div align="center">
	<form name="f" action="board_write.do" method="post" onsubmit="return check()" enctype="multipart/form-data">
		<div align="center" style="margin-top:100px;width:80%">
		
			<label class="forumLoc">
				<div class="labelText" align="left">LOCATION</div>
				<select name="location_no" style="padding:3px 10px 3.6px 10px;margin-right:14px;">
					<option value="" selected>지역선택</option>
					<option value="0">서울</option>
					<option value="1">경기</option>
					<option value="2">대전</option>
					<option value="3">대구</option>
					<option value="4">부산</option>
					<option value="5">울산</option>
					<option value="6">강원</option>
					<option value="7">인천</option>
				</select>
			</label>
			
			<label class="forumTitle">
				<div class="labelText" align="left">TITLE</div>
				<input type="text" name="title" class="box" size="90" maxlength="120">
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
			
			<hr style="width:60%;border:1px solid #dddddd;">
			<input type="reset" value="CANCEL">
			<input type="submit" value="SUMBIT">
		</div>
	</form>
</div>
    
<%@ include file="../Basic/bottom_nav.jsp"%>