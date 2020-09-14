<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="team.Dproject.main.model.*"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.ss:link{
		color:black;
	}
	.ss{ 
	text-decoration: none;
	}
	.ss:hover{
		color:red;
	}
	.ss:visited{
		color:black;
	}
</style>
<body>
<%
	hotelDTO hdto=(hotelDTO)request.getAttribute("hdto");
%>
<%@ include file="../Basic/head.jsp" %>   
<%@ include file="../Basic/nav_Hotel.jsp" %>
<div align="center"style="margin-top:62px">
		<br>
		<font style="font-weight:700">☆<%=hdto.getName()%> 호텔게시판☆</font>
		<table bgcolor="white" width="80%" style="border-inline:1px solid #adadad">
		<tr align="right">
		<td colspan="6"><a href="hotel_board_write.do?hotel_no=<%=hdto.getHotel_no()%>">쓰기</a>
		</td>
		</tr>
			<tr bgcolor="#dbdbdb" align="center">
			<!-- 게시글 번호 -->
			<th >Nr.</th> 
			
			<!-- 작성자 -->
			<th>User</th>
			
			<!-- 제목 -->
			<th width="40%">Title</th> 
			
			<!-- 조회수 -->
			<th>View</th>
			
			<!-- 작성일 -->
			<th>Date</th>
		</tr> 
			<c:if test="${empty listBoard}">
			<tr>
				<td colspan="5">
					No Contents
				</td>
			</tr>
			</c:if>
			<c:forEach var="dto" items="${listBoard}">
			<tr align="center">
				<td style="border-bottom:1px solid #ebebeb"><c:out value="${dto.hotel_board_no}"/></td>
				<td style="border-right:1px solid #ebebeb;border-left:1px solid #ebebeb;border-bottom:1px solid #ebebeb">${dto.member_no}</td>
				<td style="border-right:1px solid #ebebeb;border-left:1px solid #ebebeb;border-bottom:1px solid #ebebeb"><a class="ss" href="hotel_content.do?hotel_board_no=${dto.hotel_board_no}&hotel_no=<%=hdto.getHotel_no()%>">${dto.title}&nbsp;&nbsp;[${dto.re_step }]</a></td>
				<td style="border-right:1px solid #ebebeb;border-left:1px solid #ebebeb;border-bottom:1px solid #ebebeb">${dto.readcount}</td>
				<td style="border-bottom:1px solid #ebebeb">${dto.reg_date}</td>
			</tr>
			</c:forEach>
		</table>
	<!-- 페이지 이전? 다음? -->
	<c:if test="${count>0}">
	<c:set var="startPage" value="${startPage}"/>
	<c:set var="endPage" value="${endPage}"/>
	<c:set var="pageBlock" value="${pageBlock}"/>
	<c:set var="pageCount" value="${pageCount}"/>
	<c:if test="${startPage>pageBlock}">
			[<a href="hotel_board_list.do?pageNum=${startPage-1}">이전</a>]		
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage }" step="1">
		[<a href="hotel_board_list.do?pageNum=${i}">${i}</a>]
	</c:forEach>
		<c:if test="${endPage<pageCount}">
			[<a href="hotel_board_list.do?pageNum=${endPage+1}">다음</a>]		
		</c:if>
	</c:if>		
	</div>
  </body>
</html>
<%@ include file="../Basic/bottom.jsp" %>  