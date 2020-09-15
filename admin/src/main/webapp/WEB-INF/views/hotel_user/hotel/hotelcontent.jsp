<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>호텔소개</title>
</head>
<!-- <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'> -->
<script>
var index = 0;
window.onload = function(){
	slideShow();
}

function slideShow(){
	var i;
	var x = document.getElementsByClassName("slide");
	for(i=0;i<x.length;i++){
		x[i].style.display = "none";
	}
	index++;
	if(index > x.length){
		index=1;
	}
	x[index-1].style.display = "block";
	setTimeout(slideShow,2500);
}
</script>
<body>
<div align="center">
	<b>호텔보기</b><br><br>
			<!-- 컨트롤러에서 split사용하지 않고 c:사용하기 -->
			<c:forTokens var="file" items="${getHotel.filename}" delims="/">
			<div>
			 <img  width="25%" height="15%" class="slide" src="c:/hotelimg/${file}">
			</div>
			</c:forTokens>
	<table border="1">
		<tr height="30">
			<th width="20%" bgcolor="yellow">호텔번호</th>
			<td align="center" width="30%">${getHotel.hotel_no}</td>
			<th width="20%" bgcolor="yellow">호텔성급</th>
			<td align="center" width="30%">${getHotel.star}성</td>
		</tr>
		<tr height="30">
			<th width="20%" bgcolor="yellow">MANAGER</th>
			<td align="center" width="30%">${hoteloner}</td>
			<th width="20%" bgcolor="yellow">호텔전화번호</th>
			<td align="center" width="30%">${getHotel.hp1}-${getHotel.hp2}-${getHotel.hp3}</td>
		</tr>
		<tr height="30">
			<th width="20%" bgcolor="yellow">호텔이름</th>
			<td align="center" colspan="3">${getHotel.name}</td>
		</tr>
		<tr height="30">
			<th width="20%" bgcolor="yellow">호텔주소</th>
			<td align="center" colspan="3">${getHotel.address}</td>
		</tr>
		<tr height="80">
			<th width="20%" bgcolor="yellow">글내용</th>
			<td colspan="3" >${getHotel.hotel_info}</td>
		</tr>
		<tr bgcolor="yellow">
			<td colspan="2" align="left">
				<input type="button" value="룸 입력"
				onclick="window.location='roominsert?hotel_no=${getHotel.hotel_no}'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="룸 리스트"
				onclick="window.location='roomlist?hotel_no=${getHotel.hotel_no}'">
				&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
			<td colspan="4" align="right">
				<input type="button" value="호텔수정"
				onclick="window.location='hotelupdate?hotel_no=${getHotel.hotel_no}'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="호텔삭제"
				onclick="window.location='hoteldelete?hotel_no=${getHotel.hotel_no}'">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="글목록" onclick="window.location='hotellist'">
			</td>
		</tr>
	</table>
</div>

</body>
</html>