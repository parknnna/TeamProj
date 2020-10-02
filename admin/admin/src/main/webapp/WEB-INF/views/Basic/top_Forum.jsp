<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="head.jsp" %>
  <body>
    
  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
      <a class="navbar-brand" href="index">DProject</a>
      <div class="collapse navbar-collapse" id="ftco-nav">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item"><a href="index" class="nav-link">Home</a></li>
          <li class="nav-item"><a href="bus_main.do" class="nav-link">Bus</a></li>
          <li class="nav-item"><a href="hotel_resv" class="nav-link">Hotels</a></li>
          <li class="nav-item active"><a href="board_list.do" class="nav-link">Forum</a></li>
         </ul>
      </div>
      
      <%MemberDTO member=(MemberDTO)session.getAttribute("sedto");%>
      <div class="header-btns" id="ftco-nav">
      	<ul class="navbar-nav">
      	<%if(member==null){%>
      	<li class="nav-item cta"><a href="member_login.do" class="nav-link"><span>Login</span></a>
      	<%}else {%>
      	<li class="nav-item cta"><a href="member_logout.do" class="nav-link"><span>LogOut</span></a>
      	<%} %>
      		<ul class="submenu">
      			<%if(member==null){ %>
                <li><a href="member_input.do" class="submenu-1-third">Sign Up</a></li>
               <%} %>
                <%if(member!=null){
                	%>
                	<li><a href="member_mypage.do" class="submenu-1-first">My Page</a></li>
          			<li><a href="member_wishlist.do" class="submenu-1-second">Wish List</a></li>
                	<li><a href="loginProcess.do" class="submenu-1-chat">Chat</a></li><%
                	if(member.getPosition()==0){ %>
                		<li><a href="ADsuperAD.do" class="submenu-1-admin">Admin</a></li>
                	<%} %>
                	<%if(member.getPosition()==1){ %>
                		<li><a href="ADbus_list.do" class="submenu-1-busAD">Bus AD</a></li>
               		<%} %>
               		<%if(member.getPosition()==2){ %>
                		<li><a href="ADhotel_list.do" class="submenu-1-hotelAD">Hotel AD</a></li>
                	<%} 
                }%>
      		</ul>
      	</li>
      	</ul>
      </div>
      </div>
  </nav>
  
  	<div class="hero-wrap js-fullheight"
		style="background-image: url('${pageContext.request.contextPath}/resources/images/forum_img.jpg'); height:70%;">
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
				data-scrollax-parent="true">
				<div class="col-md-9-1 ftco-animate text-center"
					data-scrollax=" properties: { translateY: '70%' }">
					<p class="breadcrumbs"
						data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"
						style="margin-top:25%">
						<span class="mr-2"><a href="index">Home</a></span> <span>Forum</span>
					</p>
					<h1 class="mb-3 bread"
						data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Forum</h1>
				</div>
			</div>
		</div>
	</div>