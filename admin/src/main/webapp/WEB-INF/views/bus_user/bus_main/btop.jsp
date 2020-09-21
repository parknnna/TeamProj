<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bus_main</title>
<!-- 결제 api  -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-x.y.z.js"></script> 

</head>
<body>
	<c:set var = "member_no" value = "${sedto.member_no}"/>
	<div align="center">
		<table border="1" width="800" height="600">
			<tr align="center">
				
				<c:if test="${empty sedto}">
					<td><a href="member_login_resv.do">로그인</a>/<a href="member_input_resv.do">회원가입</a></td>
				</c:if> 
				<c:if test="${not empty sedto}">
					<td><a href="member_logout_resv.do">로그아웃</a>/<a href="member_mypage_resv.do">마이페이지</a></td>
				</c:if>
				<td><a href="bus_user_resv_lookup.do">배자정보 조회  및 예약</a></td>
				<td><a href="bus_resv_user_resvlist.do">예약내역</a></td>
				<td><a href="bus_station_info.do">터미널 정보</a></td>
				
				<c:if test="${sedto.position==0 || sedto.position==1}">
					<td><a href="bus_insert.do">버스등록</a>/<a href="bus_list.do">버스리스트</a></td>
					<td><a href="bus_station_insert.do">버스정류소 등록</a>/<a href="bus_station_list.do">버스정류소 리스트</a></td>
					<td><a href="bus_road_insert.do">버스노선 등록</a>/<a href="bus_road_list.do">버스노선 리스트</a></td>
					<td><a href="bus_resv_insert.do">버스예약 등록</a>/<a href="bus_resv_list.do">버스예약 리스트</a></td>
				</c:if>
			</tr>
			<tr height="70%" align="center">
				<td colspan="8">