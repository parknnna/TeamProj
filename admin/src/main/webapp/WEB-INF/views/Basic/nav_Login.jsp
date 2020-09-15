<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light scolled sleep scrolled awake" id="ftco-navbar">
    <div class="container">
      <a class="navbar-brand" href="index">DProject</a>
      <div class="collapse navbar-collapse" id="ftco-nav">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item"><a href="index" class="nav-link-1">Home</a></li>
          <li class="nav-item"><a href="bus_main.do" class="nav-link-1">Bus</a></li>
          <li class="nav-item"><a href="hotel_main.do" class="nav-link-1">Hotels</a></li>
          <li class="nav-item"><a href="restaurant_main.do" class="nav-link-1">Restaurant</a></li>
          <li class="nav-item"><a href="board_list.do" class="nav-link-1">Forum</a></li>
         </ul>
      </div>
      
      <%@page import="team.Dproject.main.model.*"%>
     <%MemberDTO member=(MemberDTO)session.getAttribute("sedto");%>
      <div class="header-btns" id="ftco-nav">
      	<ul class="navbar-nav">
      	<%if(member==null){%>
      	<li class="nav-item cta"><a href="member_login.do" class="nav-link"><span>Login</span></a>
      	<%}else {%>
      	<li class="nav-item cta"><a href="member_logout.do" class="nav-link"><span>Logout
      	</span></a>
      	<%} %>
      		<ul class="submenu">
      			<li><a href="member_mypage.do" class="submenu-1-first">My Page</a></li>
      			<li><a href="member_wishlist.do" class="submenu-1-second">Wish List</a></li>
                <li><a href="member_input.do" class="submenu-1-third">Sign Up</a></li>
                <%if(member!=null){
                	if(member.getPosition()==0){ %>
                		<li><a href="ADsuperAD.do" class="submenu-1-second" style="color:black">Admin</a></li>
                	<%} %>
                	<%if(member.getPosition()==1){ %>
                		<li><a href="ADbus_list.do" class="submenu-1-second" style="color:black">Bus AD</a></li>
               		<%} %>
               		<%if(member.getPosition()==2){ %>
                		<li><a href="ADhotel_list.do" class="submenu-1-second" style="color:black">Hotel AD</a></li>
                	<%} 
                }%>
      		</ul>
      	</li>
      	</ul>
      </div>
      </div> 
  </nav>