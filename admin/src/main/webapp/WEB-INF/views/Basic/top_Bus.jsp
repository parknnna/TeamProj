<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="head.jsp" %>
  <body onload="load();">
    
  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
      <a class="navbar-brand" href="index">DProject</a>
      <div class="collapse navbar-collapse" id="ftco-nav">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item"><a href="index" class="nav-link">Home</a></li>
          <li class="nav-item active"><a href="bus_main.do" class="nav-link">Bus</a></li>
          <li class="nav-item"><a href="main" class="nav-link">Hotels</a></li>
          <li class="nav-item"><a href="restaurant_main.do" class="nav-link">Restaurant</a></li>
          <li class="nav-item"><a href="board_list.do" class="nav-link">Forum</a></li>
         </ul>
      </div>
      
      <div class="header-btns" id="ftco-nav">
      	<ul class="navbar-nav">
      	<c:if test="${empty sedto}">
      	<li class="nav-item cta"><a href="member_login_resv.do" class="nav-link"><span>Login</span></a>
      	</c:if>	
      	<c:if test="${not empty sedto}">
      	<li class="nav-item cta"><a href="member_logout_resv.do" class="nav-link"><span>LogOut</span></a>
      	</c:if>
      		<ul class="submenu">
      			<li><a href="member_mypage_resv.do" class="submenu-1-first">My Page</a></li>
      			<li><a href="member_wishlist.do" class="submenu-1-second">Wish List</a></li>
                <li><a href="member_input_resv.do" class="submenu-1-third">Sign Up</a></li>
      		</ul>
      	</li>
      	</ul>
      </div>
      </div>
  </nav>
  
  <div class="hero-wrap js-fullheight"
		style="background-image: url('${pageContext.request.contextPath}/resources/images/bus_img.jpg'); height:70%;">
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
				data-scrollax-parent="true">
				<div class="col-md-9-1 ftco-animate text-center"
					data-scrollax=" properties: { translateY: '70%' }">
					<p class="breadcrumbs"
						data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"
						style="margin-top: 170px">
						<span class="mr-2"><a href="bus_main.do">Home</a></span> <span>Bus</span>
					</p>
					<h1 class="mb-3 bread"
						data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Bus</h1>
				</div>
			</div>
		</div>
	</div>
	
