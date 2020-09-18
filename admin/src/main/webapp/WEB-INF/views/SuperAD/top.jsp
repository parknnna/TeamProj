<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>호텔관리자</title>
<style type="text/css">
	tr{
		align:"center";
	}
</style>
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.0/css/all.min.css"
  />
</head>
<body>
	<div align="center">
		<h2>호텔관리자 페이지</h2>
		<table>
			<tr>
				<td><a href="ADhotel_board.do">호텔 게시판</a> | </td>
				<td><a href="ADhotel_list.do">호텔리스트</a> | </td>
				<td><a href="home.do">관리자</a></td>
			</tr>
		</table> 
	</div> --%>
<%@include file="head.jsp"%>	
<%
	MemberDTO member=(MemberDTO)session.getAttribute("sedto");
%>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index">DProject</a>
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="index" class="nav-link">Home</a></li>
					<li class="nav-item"><a href="about" class="nav-link">Bus</a></li>
					<li class="nav-item"><a href="hotel" class="nav-link">Hotels</a></li>
					<li class="nav-item"><a href="restaurant" class="nav-link">Restaurant</a></li>
					<li class="nav-item"><a href="board_list.do"
						class="nav-link">Forum</a></li>
				</ul>
			</div>

			<div class="header-btns" id="ftco-nav">
				<ul class="navbar-nav">
			      	<%if(member==null){%>
			      	<li class="nav-item cta"><a href="member_login.do" class="nav-link"><span>Login</span></a>
			      	<%}else {%>
			      	<li class="nav-item cta"><a href="member_logout.do" class="nav-link"><span>Logout
			      	</span></a>
			      	<%} %>
			      		<ul class="submenu">
			      			<li><a href="blog.html" class="submenu-1-first">My Page</a></li>
			      			<li><a href="blog_details.html" class="submenu-1-second">Wish List</a></li>
			                <li><a href="blog_details.html" class="submenu-1-third">Sign Up</a></li>
			                <%if(member!=null){
			                	if(member.getPosition()==0){ %>
			                		<li><a href="ADsuperAD.do" class="submenu-1-second">Admin</a></li>
			                	<%} %>
			                	<%if(member.getPosition()==1){ %>
			                		<li><a href="ADbusAD.do" class="submenu-1-second">Bus AD</a></li>
			               		<%} %>
			               		<%if(member.getPosition()==2){ %>
			                		<li><a href="ADhotel_list.do" class="submenu-1-second">Hotel AD</a></li>
			                	<%} 
			                }%>
			      		</ul>
			      	</li>
			      	</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->
	
		<div class="hero-wrap js-fullheight" style="background-image: url('${pageContext.request.contextPath}/resources/images/bgi_3.jpg'); height:70%;">
	
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
				data-scrollax-parent="true">
				<div class="col-md-9-1 ftco-animate text-center"
					data-scrollax=" properties: { translateY: '70%' }">
					<p class="breadcrumbs"
						data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"
						style="margin-top: 170px">
						<span class="mr-2"><a href="index">Home</a></span> <span><%=request.getAttribute("page_name") %></span>
					</p>
					<h1 class="mb-3 bread"
						data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><%=request.getAttribute("page_name") %></h1>
				</div>
			</div>
		</div>
	</div>
	<%@include file="top2.jsp"%>	