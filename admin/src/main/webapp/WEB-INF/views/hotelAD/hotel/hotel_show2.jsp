<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="team.Dproject.main.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../Basic/head.jsp" %>   
<%@ include file="../../Basic/nav_AD.jsp" %>   
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
	#slider {
		position:relative;
		overflow: hidden;
		margin-left: auto;
	 	margin-right: auto;
	}

	#slider .slides {
		margin:0;
		padding: 0;
	}

	#slider .slide {
		float: left;
		list-style-type: none;
	}

	.slide1 {background: red;}
	.slide2 {background: blue;}
	.slide3 {background: green;}
	.slide4 {background: purple;}
	.slide5 {background: pink;}

	#slider-nav {
	position:absolute;
	height:2em;
	bottom:0em;
	width:100%;
	cursor:default;
	}

	#slider-nav-prv {
	height:1.5em;
	line-height:1.5em;
	width:1.5em;
	text-align:center;
	position:absolute;
	left:0.5em;
	background:white;
	}

	#slider-nav-nxt {
	height:1.5em;
	line-height:1.5em;
	width:1.5em;
	text-align:center;
	position:absolute;
	right:0.5em;
	background:white;
	}

	#slider-nav-prv:hover, #slider-nav-nxt:hover {
	color:white;
	background:black;
	}

	#slider-nav-dot-con {
	text-align:center;
	}

	.slider-nav-dot {
	list-style:none;
	border: 0.15em solid white;
	box-sizing:border-box;
	width:1em;
	height:1em;
	display:inline-block;
	border-radius:50%;
	vertical-align:middle;
	}

	.slider-nav-dot:hover {
	background:white;
	}

</style>

<script>
	'use strict';

	$(function() {

		//이 부분을 자신의 상황에 맞게 수정
		var width = 720; //슬라이드 한 개의 폭
		var height = 400; //슬라이드 높이
		var animationSpeed = 1000; //화면전환 속도
		var pause = 3000; //화면전환 후 일시 정지 속도
		var totalSlides = 7; //복제 슬라이드를 포함한 전체 슬라이드 개수

		var currentSlide = 2; //이 항목은 수정하지 않음
		var interval;
		var action;
		var dotNum;
		var dMinusC;

		//cache DOM elements
		var $slideCon = $('#slider');
		var $slideUl = $('.slides');
		var $slides = $('.slide');
		var $dots = $('.slider-nav-dot');
		var $sliderNavPrv = $('#slider-nav-prv');
		var $sliderNavNxt = $('#slider-nav-nxt');

		function initSlider(){
			$slideCon.css('width',width);
			$slideCon.css('height',height);
			$slideUl.css('margin-left',-width);
			$slideUl.css('width',totalSlides*width);
			$slides.css('width',width);
			$slides.css('height',height);
		}

		function startSlider(action, dotNum) {

			if(action == 'prv'){
				$slideUl.animate({'margin-left': '+='+width}, animationSpeed, function() {
					if (--currentSlide === 1) {
						currentSlide = $slides.length-1;
						$slideUl.css('margin-left', -($slides.length-2)*width);
					}else{}

					for(var i=0; i<$dots.length; i++){$dots[i].style.background = "";}
					$dots[currentSlide-2].style.background = "white";
				});
			} else if(action == 'nxt') {
				$slideUl.animate({'margin-left': '-='+width}, animationSpeed, function() {
					if (++currentSlide === $slides.length) {
						currentSlide = 2;
						$slideUl.css('margin-left', -width);
					}else{}

					for(var i=0; i<$dots.length; i++){$dots[i].style.background = "";}
					$dots[currentSlide-2].style.background = "white";
				});
			} else if(action == 'dot') {
				dMinusC = dotNum-currentSlide;
				currentSlide = dotNum;

				for(var i=0; i<$dots.length; i++){$dots[i].style.background = "";}
				$dots[currentSlide-2].style.background = "white";

				$slideUl.animate({'margin-left': '-='+(dMinusC*width)}, animationSpeed);

			} else {
				// setInterval(function,milliseconds)
				// 지정한 시간에 한번씩 함수를 실행
				// 3초 마다 $slideUl 의 왼쪽 마진을 -width 함. 에니메이션 속도는 1초.
				interval = setInterval(function() {

					//.animate( CSS properties [, duration ] [, complete ] )
					$slideUl.animate({'margin-left': '-='+width}, animationSpeed, function() {
						if (++currentSlide === $slides.length) { // $slides.length == 7
							currentSlide = 2;
							$slideUl.css('margin-left', -width);
						}

						for(var i=0; i<$dots.length; i++){$dots[i].style.background = "";}
						$dots[currentSlide-2].style.background = "white";
					});	

				}, pause);
			}

		}


		function pauseSlider() {
			clearInterval(interval);
		}

		function prvSlide(){
			startSlider('prv');
		}

		function nxtSlide(){
			startSlider('nxt');
		}

		function dotSelected(){
			dotNum = $(this).attr('id');
			dotNum = parseInt(dotNum.substring(7))+1;
			startSlider('dot', dotNum);
		}


		$slideUl
			.on('mouseenter', pauseSlider)
			.on('mouseleave', startSlider);

		$sliderNavPrv
			.on('click',prvSlide)
			.on('mouseenter', pauseSlider)
			.on('mouseleave', startSlider);

		$sliderNavNxt
			.on('click',nxtSlide)
			.on('mouseenter', pauseSlider)
			.on('mouseleave', startSlider);

		$dots
			.on('click', dotSelected)
			.on('mouseenter', pauseSlider)
			.on('mouseleave', startSlider);		

		
		initSlider();
		startSlider();

	});

</script>
</head>
<%
Calendar cal = Calendar.getInstance();
int month = cal.get(Calendar.MONTH);
int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
%>
<style>
  table {
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
</style>
<% hotelDTO dto = (hotelDTO)request.getAttribute("dto");
String img=dto.getFilename();
if(img!=null){
%>
<div id="slider"style="margin-top:62px">
	<ul class="slides">
		<%
		String cla="slide slide";
		String[] SPimg;
		if(img!=null){
			SPimg=img.split("/");
			cla=cla+SPimg.length;
			%><li class="<%=cla%>"><img src="${pageContext.request.contextPath}/resources/img/<%=SPimg[SPimg.length-1] %>" width="720" height="400"></li><%
			for(int i=0;i<SPimg.length;i++){
				cla="slide slide";
				int temp=i+1;
				cla=cla+temp;
				%>
				<li class="<%=cla%>">
				<img src="${pageContext.request.contextPath}/resources/img/<%=SPimg[i] %>" width="720" height="400">
				</li>
				<% 
			}
			%><li class="slide slide1"><img src="${pageContext.request.contextPath}/resources/img/<%=SPimg[0] %>" width="720" height="400"></li><%
		}else{
			%><li>이미지 없음</li><%
		}
		%>
		
	</ul>

	<div id="slider-nav">
		<div id="slider-nav-prv">&#10094;</div>
		<div id="slider-nav-nxt">&#10095;</div>
		<div id="slider-nav-dot-con">
			<% 
			if(img!=null){				
			SPimg=img.split("/");	
			
			for(int i=1;i<=SPimg.length;i++){
				String id="nav-dot"+i; %>
				<span class="slider-nav-dot" style="background:white" id="<%=id%>"></span>
			<%}
			}%>
		</div>
	</div>
</div>
		<%}else{ %>
<div align="center" style=" width:720px; height:200px"><p>이미지 없음</p></div>
<%} %>
<div align="center" style="margin-top:10px">
	<table width="60%">
		<tr align="right">
			<th>${dto.name} 호텔의 정보</th>
			<td><a href="hotel_board_list.do?hotel_no=${dto.hotel_no }">게시판 이동  </a><a href="ADhotel_list.do">뒤로가기</a></td>
		</tr>
		<tr align="center" >
			<td>호텔번호</td><td>${dto.hotel_no}</td>
		</tr>
		<tr align="center" >
			<td>호텔주소</td><td>${dto.address}</td>
		</tr>
		<tr align="center" >
			<td>전화번호</td><td>${dto.hp1} - ${dto.hp2} - ${dto.hp3}</td>
		</tr>
		<tr align="center">
			<td>등급</td>
			<td>
			<%
			hotelDTO dto2=(hotelDTO)request.getAttribute("dto");
			int cnt=dto2.getStar();
			for(int i=0;i<cnt;i++){ %>
				<i class="fas fa-star"></i>
			<%}for(int i=cnt;i<7;i++){ %>
				<i class="far fa-star"></i>
			<%} %>
			</td>
		</tr>
		<tr align="center">
			<td>호텔정보</td><td>${dto.hotel_info }</td>
		</tr>
			
			
	
		
	</table>
</div>
<%@ include file="../../Basic/bottom_nav.jsp" %>