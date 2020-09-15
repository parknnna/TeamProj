<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<c:forTokens var="file" items="${rdto.filename}" delims="/">
			<div>
			 <img  width="25%" height="15%" class="slide" src="c:/hotelimg/${file}">
			</div>
	</c:forTokens>
	</div>
<div align="center">
<table border="1">
		<tr height="30">
			<th width="20%" bgcolor="yellow">룸 이름</th>
			<td align="center" width="30%">${rdto.name}</td>
			<th width="20%" bgcolor="yellow">룸 가격</th>
			<td align="center" width="30%">${rdto.price}원</td>
		</tr>
		<tr height="30">
			<th width="20%" bgcolor="yellow">룸 템</th>
			<td align="center" width="30%">${rdto.item}</td>
			<th width="20%" bgcolor="yellow">룸 사이즈</th>
			<td align="center" width="30%">${rdto.roomsize}m²</td>
		</tr>
		</table>
</div>
</body>
</html>