<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>호텔검색</title>
</head>
<body>
	<div align="right">
		<c:choose>
			<c:when test="${empty sedto}">
				<input type="button" value="로그인"
					onClick="location.href='memberlogin'" />
			</c:when>
			<c:otherwise>
				<input type="button" value="로그아웃"
					onClick="location.href = 'memberlogout'" />
			</c:otherwise>
		</c:choose>
	</div>

	<div>
		<form action="hotel_resvlist">
			<table border="1">
				<tr>
					<th><label>지역</label></th>
					<td> <select name="address">
							<option value="서울" selected>서울</option>
							<option value="경기">경기</option>
							<option value="대전">대전</option>
							<option value="대구">대구</option>
							<option value="부산">부산</option>
							<option value="울산">울산</option>
							<option value="강원">강원</option>
							<option value="인천">인천</option>
					</select></td>
					<th><label>체크 인</label></th>
					<td> 
					<input type="date" name="start_resv_date" >
					</td>
					<th> 
					<label>체크 아웃</label>
					</th>
					<td> 
					<input type="date" name="end_resv_date" >
					</td>
					<th><label>객실</label></th>
					<td> 
						<select name="roomsu">
							<option value="1" selected>1개</option>
							<option value="2">2개</option>
							<option value="3">3개</option>
							<option value="4">4개</option>
							<option value="5">5개</option>
							<option value="6">6개</option>
							<option value="7">7개</option>
							<option value="8">8개</option>
							<option value="9">9개</option>
							<option value="10">10개</option>
					</select></td>
					<th><label>인원</label></th>
					<td><select name="sleeps">
							<option value="1">1명</option>
							<option value="2" selected>2명</option>
							<option value="3">3명</option>
							<option value="4">4명</option>
							<option value="5">5명</option>
							<option value="6">6명</option>
							<option value="7">7명</option>
							<option value="8">8명</option>
							<option value="9">9명</option>
							<option value="10">10명</option>
					</select></td>
					<th><label>&nbsp;</label></th>
					<td>
						<button type="submit">검색</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>