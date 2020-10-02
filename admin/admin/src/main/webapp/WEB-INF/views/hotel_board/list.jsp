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
	List<hotel_boardDTO> hotel_list=(List)request.getAttribute("listBoard");
%>
<%@ include file="../Basic/head.jsp" %>   
<%@ include file="../Basic/nav_Hotel.jsp" %>
<!-- 관리자만 볼 수 있는 게시판 페이지일 경우 -->
<!-- include file="../Basic/nav_AD.jsp 추가 -->

<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<div align="center" class="mainContainer" style="width: 90%;margin: 90px auto 10px auto;">
<div class="firstbox">
	<div class="titleContainer" style="width:100%">
		<h6 style="font-family: 'Nanum Gothic', sans-serif;float: left;border-radius: 10px;border: 2px solid #c94dff;padding: 5px;color: #696969;"><%=hdto.getName()%> 이용 후기</h6>
	</div>
</div>

<div class="secbox">	
	<div class="tableContainer" style="width:100%;" align="center">
		<table style="width:100%;font-size:16px;" class="infoTable">
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
			
			<th>LIKE</th>
			
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
			<%int i=0; %>
			<c:forEach var="dto" items="${listBoard}">
			<tr align="center">
				<td style="border-bottom:1px solid #ebebeb"><c:out value="${dto.hotel_board_no}"/></td>
				<td style="border-right:1px solid #ebebeb;border-left:1px solid #ebebeb;border-bottom:1px solid #ebebeb">${dto.member_no}</td>				
				<td style="border-right:1px solid #ebebeb;border-left:1px solid #ebebeb;border-bottom:1px solid #ebebeb">
				<%if(hotel_list.get(i).getUp()>=10){%>
					<img src="${pageContext.request.contextPath}/resources/images/crown.svg" width="30px" height="30px">
				<%} %>
				<a class="ss" href="hotel_content.do?hotel_board_no=${dto.hotel_board_no}&hotel_no=<%=hdto.getHotel_no()%>">${dto.title}&nbsp;&nbsp;[${dto.re_step }]</a></td>
				<td style="border-right:1px solid #ebebeb;border-left:1px solid #ebebeb;border-bottom:1px solid #ebebeb">${dto.up}</td>
				<td style="border-right:1px solid #ebebeb;border-left:1px solid #ebebeb;border-bottom:1px solid #ebebeb">${dto.readcount}</td>
				<td style="border-bottom:1px solid #ebebeb">${dto.reg_date}</td>
			</tr>
			<%i++; %>
			</c:forEach>
		</table>
	<!-- 페이지 이전? 다음? -->
	<c:if test="${count>0}">
	<c:set var="startPage" value="${startPage}"/>
	<c:set var="endPage" value="${endPage}"/>
	<c:set var="pageBlock" value="${pageBlock}"/>
	<c:set var="pageCount" value="${pageCount}"/>
	<c:if test="${startPage>pageBlock}">
			[<a href="hotel_board_list.do?hotel_no=<%=hdto.getHotel_no()%>&pageNum=${startPage-1}">이전</a>]		
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage }" step="1">
		[<a href="hotel_board_list.do?hotel_no=<%=hdto.getHotel_no()%>&pageNum=${i}">${i}</a>]
	</c:forEach>
		<c:if test="${endPage<pageCount}">
			[<a href="hotel_board_list.do?hotel_no=<%=hdto.getHotel_no()%>&pageNum=${endPage+1}">다음</a>]		
		</c:if>
	</c:if>		
	</div>
	</div>
	</div>
  </body>
</html>
<%@ include file="../Basic/bottom_nav.jsp" %>