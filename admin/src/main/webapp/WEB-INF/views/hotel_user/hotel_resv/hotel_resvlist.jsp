<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="team.Dproject.main.model.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	<div align="center">
		<form action="hotel_resvlist">
			<table border="1">
				<tr>
					<th><label>지역</label></th>
					<td> <select name="address">
							<!-- select값 유지 -->
							<option value="서울"<c:if test="${address=='서울'}">selected</c:if>>서울</option>
							<option value="경기"<c:if test="${address=='경기'}">selected</c:if>>경기</option>
							<option value="대전"<c:if test="${address=='대전'}">selected</c:if>>대전</option>
							<option value="대구"<c:if test="${address=='대구'}">selected</c:if>>대구</option>
							<option value="부산"<c:if test="${address=='부산'}">selected</c:if>>부산</option>
							<option value="울산"<c:if test="${address=='울산'}">selected</c:if>>울산</option>
							<option value="강원"<c:if test="${address=='강원'}">selected</c:if>>강원</option>
							<option value="인천"<c:if test="${address=='인천'}">selected</c:if>>인천</option>
					</select></td>
					<th><label>체크 인</label></th>
					<td> 
					<input type="date" name="start_resv_date" value="${start_resv_date}">
					</td>
					<th> 
					<label>체크 아웃</label>
					</th>
					<td> 
					<input type="date" name="end_resv_date" value="${end_resv_date}">
					</td>
					<th><label>객실</label></th>
					<td> 
						<select name="roomsu">
								<option value="1" <c:if test="${roomsu=='1'}">selected</c:if>>1개</option>
                                <option value="2" <c:if test="${roomsu=='2'}">selected</c:if>>2개</option>
                                <option value="3" <c:if test="${roomsu=='3'}">selected</c:if>>3개</option>
                                <option value="4" <c:if test="${roomsu=='4'}">selected</c:if>>4개</option>
                                <option value="5" <c:if test="${roomsu=='5'}">selected</c:if>>5개</option>
                                <option value="6" <c:if test="${roomsu=='6'}">selected</c:if>>6개</option>
                                <option value="7" <c:if test="${roomsu=='7'}">selected</c:if>>7개</option>
                                <option value="8" <c:if test="${roomsu=='8'}">selected</c:if>>8개</option>
                                <option value="9" <c:if test="${roomsu=='9'}">selected</c:if>>9개</option>
                                <option value="10"<c:if test="${roomsu=='10'}">selected</c:if>>10개</option>
					</select></td>
					<th><label>인원</label></th>
					<td><select name="sleeps">
							  	<option value="1" <c:if test="${sleeps=='1'}">selected</c:if>>1명</option>
                                <option value="2" <c:if test="${sleeps=='2'}">selected</c:if>>2명</option>
                                <option value="3" <c:if test="${sleeps=='3'}">selected</c:if>>3명</option>
                                <option value="4" <c:if test="${sleeps=='4'}">selected</c:if>>4명</option>
                                <option value="5" <c:if test="${sleeps=='5'}">selected</c:if>>5명</option>
                                <option value="6" <c:if test="${sleeps=='6'}">selected</c:if>>6명</option>
                                <option value="7" <c:if test="${sleeps=='7'}">selected</c:if>>7명</option>
                                <option value="8" <c:if test="${sleeps=='8'}">selected</c:if>>8명</option>
                                <option value="9" <c:if test="${sleeps=='9'}">selected</c:if>>9명</option>
                                <option value="10"<c:if test="${sleeps=='10'}">selected</c:if>>10명</option>
					</select></td>
					<th><label>&nbsp;</label></th>
					<td>
						<button type="submit">검색변경</button></td>
				</tr>
			</table>
		</form>
	</div>
	<div align="center">
		<table border="1">
			<tr bgcolor="green">
				<th>사진</th>
				<th>호텔이름</th>
				<th>주소</th>
				<th>연락처</th>
				<th>성급</th>
				<th>객실</th>
			</tr>
			<!-- 호텔,룸 리스트 불러오기. -->
			<%
				List<HotelDTO_sks> hlist=(List<HotelDTO_sks>)request.getAttribute("hlist");
				List<RoomDTO_sks> rlist=(List<RoomDTO_sks>)request.getAttribute("rlist");
				int su = (Integer)request.getAttribute("stay");
				
				for(int i=0;i<hlist.size();i++){%>
				<tr>
					<td>
					<a href="hotel_resvcontent?hotel_no=<%=hlist.get(i).getHotel_no()%>&room_no=<%=rlist.get(i).getRoom_no()%>
							&stay=${stay}&address=${address}&roomsu=${roomsu}&sleeps=${sleeps}
							&start_resv_date=${start_resv_date}&end_resv_date=${end_resv_date}"> 
						<img width="100px" height="70px"
						src="c:/hotelimg/<%=hlist.get(i).getFilename() %>"/>
						</a>
					</td>
					<td>
					<a href="hotel_resvcontent?hotel_no=<%=hlist.get(i).getHotel_no()%>&room_no=<%=rlist.get(i).getRoom_no()%>
							&stay=${stay}&address=${address}&roomsu=${roomsu}&sleeps=${sleeps}
							&start_resv_date=${start_resv_date}&end_resv_date=${end_resv_date}">
						<%=hlist.get(i).getName() %>
					</a>	
					</td>
					<td>
						<%=hlist.get(i).getAddress() %>
					</td>
					<td>
						<%=hlist.get(i).getHp1() %>-
						<%=hlist.get(i).getHp2() %>-
						<%=hlist.get(i).getHp3() %>
					</td>
					<td>
						<%=hlist.get(i).getStar() %>
					</td>
					<td>
						<div align="right">
						<%=rlist.get(i).getName() %> 정원 <%=rlist.get(i).getSleeps()%>명<br>
						</div>
						<c:set var="su" value="${stay}" ></c:set>
						<%=su%>박 <%=rlist.get(i).getPrice()*su%> 원<br>
						<a href="hotel_resvcontent?hotel_no=<%=hlist.get(i).getHotel_no()%>&room_no=<%=rlist.get(i).getRoom_no()%>
								&stay=${stay}&address=${address}&roomsu=${roomsu}&sleeps=${sleeps}
								&start_resv_date=${start_resv_date}&end_resv_date=${end_resv_date}">
						<div align="center">
							<input type="button" value="객실선택">
						</div>
						</a>
					</td>
					</tr>
				<%} %>
			
		</table>
		</div>
	</div>
</body>
</html>