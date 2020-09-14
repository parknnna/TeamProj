<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="team.Dproject.main.model.*"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="head.jsp" %>
<%
	MemberDTO member=(MemberDTO)session.getAttribute("sedto");
%>
  <body>
    
  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
      <a class="navbar-brand" href="index">DProject</a>
      <div class="collapse navbar-collapse" id="ftco-nav">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active"><a href="index" class="nav-link">Home</a></li>
          <li class="nav-item"><a href="bus_main.do" class="nav-link">Bus</a></li>
          <li class="nav-item"><a href="hotel_resv" class="nav-link">Hotels</a></li>
          <li class="nav-item"><a href="restaurant" class="nav-link">Restaurant</a></li>
          <li class="nav-item"><a href="board_list.do" class="nav-link">Forum</a></li>
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
                		<li><a href="ADbus_list.do" class="submenu-1-second">Bus AD</a></li>
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