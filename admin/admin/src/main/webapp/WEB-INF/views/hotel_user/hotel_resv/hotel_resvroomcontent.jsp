<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %> 
<%@ include file="../../Basic/head.jsp" %>
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
<%@ include file="../../Basic/nav_Hotel.jsp" %>
<div class="boxContainer" align="center" style="margin-top:100px">
	<c:forTokens var="file" items="${rdto.filename}" delims="/">
			<div>
			 <img  width="25%" height="15%" class="slide" src="${pageContext.request.contextPath}/resources/img/${file}">
			</div>
	</c:forTokens>
	</div>
<div class="boxContainer" align="center" style="margin-top:85px">
<table border="1">
		<tr height="30">
			<th width="20%" bgcolor="#ebcbf7">룸 이름</th>
			<td align="center" width="30%">${rdto.name}</td>
			<th width="20%" bgcolor="#ebcbf7">룸 가격</th>
			<td align="center" width="30%">
			<f:formatNumber value="${rdto.price*stay}" type="number"/>원
			</td>
		</tr>
		<tr height="30">
			<th width="20%" bgcolor="#ebcbf7">룸 템</th>
			<td align="center" width="30%">${rdto.item}</td>
			<th width="20%" bgcolor="#ebcbf7">룸 사이즈</th>
			<td align="center" width="30%">${rdto.roomsize}m²</td>
		</tr>
		</table>
</div>
<%@ include file="../../Basic/bottom_nav.jsp" %>