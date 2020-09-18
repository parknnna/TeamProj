<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<%@ include file="../../Basic/head.jsp" %>

<body>
<c:set var = "member_no" value = "${sedto.member_no}"/>
  	
  	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    	<div class="container">
      		<a class="navbar-brand" href="index.do">DProject</a>
     		 <div class="collapse navbar-collapse" id="ftco-nav">
        		<ul class="navbar-nav ml-auto">
          			<li class="nav-item active">
          				<c:if test="${empty sedto}">
							<a href="member_login_resv.do" class="nav_link">로그인</a>/<a href="member_input_resv.do" class="nav_link">회원가입</a>
						</c:if> 
						<c:if test="${not empty sedto}">
							<a href="member_logout_resv.do" class="nav_link">로그아웃</a>/<a href="member_mypage_resv.do" class="nav_link">마이페이지</a>
						</c:if>	
          			</li>
          			&nbsp&nbsp&nbsp&nbsp&nbsp
          			<li class="nav-item">
          				<a href="bus_user_resv_lookup.do" class="nav_link">배자정보 조회 </a>
          			</li>
          			&nbsp&nbsp&nbsp&nbsp&nbsp
          			<li class="nav-item">
          				<a href="bus_resv_user_resvlist.do" class="nav_link">예약내역</a>
          			</li>
          			&nbsp&nbsp&nbsp&nbsp&nbsp
          			<li class="nav-item">
          				<a href="bus_station_info.do" class="nav_link">터미널 정보</a>
          			</li>
          			&nbsp&nbsp&nbsp&nbsp&nbsp
          			<c:if test="${sedto.position==0 || sedto.position==1}">
          			<li class="nav-item"><a href="bus_list.do" class="nav_link">버스리스트</a></li>&nbsp&nbsp&nbsp&nbsp&nbsp
          			<li class="nav-item"><a href="bus_station_list.do" class="nav_link">버스정류소 리스트</a></li>&nbsp&nbsp&nbsp&nbsp&nbsp
          			<li class="nav-item"><a href="bus_road_list.do" class="nav_link">버스노선 리스트</a></li>&nbsp&nbsp&nbsp&nbsp&nbsp
          			<li class="nav-item"><a href="bus_resv_list.do" class="nav_link">버스예약 리스트</a></li>
         			</c:if>
         		</ul>
      	</div>
     		 </div>
     </nav>
     
	<div class="hero-wrap js-fullheight"
		style="background-image: url('${pageContext.request.contextPath}/resources/images/bus_bg.jpg'); height:70%;">
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
				data-scrollax-parent="true">
				<div class="col-md-9-1 ftco-animate text-center"
					data-scrollax=" properties: { translateY: '70%' }">
					<p class="breadcrumbs"
						data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"
						style="margin-top: 170px">
						<span class="mr-2"><a href="index">Home</a></span> <span>Forum</span>
					</p>
					<h1 class="mb-3 bread"
						data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Forum</h1>
						
				</div>
			</div>
		</div>
	</div>
	
	
	
<!-- loader -->
  <div id="ftco-loader" class="show fullscreen">
  <svg class="circular" width="48px" height="48px">
  <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
  <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#c94dff"/>
  </svg>
  </div>
<!-- 결제 api  -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-x.y.z.js"></script> 
 <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/aos.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.timepicker.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${pageContext.request.contextPath}/resources/js/google-map.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/main2.js"></script>		

	