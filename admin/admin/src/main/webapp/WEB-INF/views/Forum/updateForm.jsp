<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../Basic/head.jsp" %>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
html {
	overflow: -moz-scrollbars-vertical;
	overflow-y: scroll;
}

#slider {
	position: relative;
	overflow: hidden;
	margin-left: auto;
	margin-right: auto;
}

#slider .slides {
	margin: 0;
	padding: 0;
}

#slider .slide {
	float: left;
	list-style-type: none;
}


#slider-nav {
	position: absolute;
	height: 2em;
	bottom: 0em;
	width: 100%;
	cursor: default;
}

#slider-nav-prv {
	height: 1.5em;
	line-height: 1.5em;
	width: 1.5em;
	text-align: center;
	position: absolute;
	left: 0.5em;
	background: white;
}

#slider-nav-nxt {
	height: 1.5em;
	line-height: 1.5em;
	width: 1.5em;
	text-align: center;
	position: absolute;
	right: 0.5em;
	background: white;
}

#slider-nav-prv:hover, #slider-nav-nxt:hover {
	color: white;
	background: black;
}

#slider-nav-dot-con {
	text-align: center;
}

.slider-nav-dot {
	list-style: none;
	border: 0.15em solid white;
	box-sizing: border-box;
	width: 1em;
	height: 1em;
	display: inline-block;
	border-radius: 50%;
	vertical-align: middle;
}

.slider-nav-dot:hover {
	background: white;
}
</style>
<script>
	'use strict';

	$(function() {

		//이 부분을 자신의 상황에 맞게 수정
		var width = 400; //슬라이드 한 개의 폭
		var height = 250; //슬라이드 높이
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
<body>
<%@ include file="../Basic/nav_Forum.jsp" %>
<% BoardDTO dto = (BoardDTO)request.getAttribute("dto");
	String img = dto.getFilename();
	int location_no = dto.getLocation_no();
	String[] location = {"서울", "경기", "대전", "대구", "부산", "울산", "강원", "인천"};
%>
<div align="center">
	<form name="f" action="board_update.do?filename=<%=img %>" method="post" onsubmit="return check()" enctype="multipart/form-data">
		<div align="center" style="margin-top:100px;width:80%">
		<input type = "hidden" name = "filename" value = "<%=img%>">
		<input type="hidden" name="main_board_no" value="<%=request.getParameter("main_board_no")%>">
		<input type="hidden" name="member_no" value="<%=request.getParameter("member_no")%>">
			<label class="forumLoc">
				<div class="labelText" align="left">LOCATION</div>
				<select name="location_no" style="padding:3px 10px 3.6px 10px;margin-right:14px;">
					<option value="" selected>지역선택</option>
					<% for (int i = 0 ; i < 7 ; i ++){
						if(i == location_no){%>
					<option value = "<%=i%>" selected><%=location[i] %></option>
					<% }else{ %>
					<option value = "<%=i%>"><%=location[i] %></option>
					<%}
					}%>
					<!-- <option value="0">서울</option>
					<option value="1">경기</option>
					<option value="2">대전</option>
					<option value="3">대구</option>
					<option value="4">부산</option>
					<option value="5">울산</option>
					<option value="6">강원</option>
					<option value="7">인천</option> -->
				</select>
			</label>
			
			<label class="forumTitle">
				<div class="labelText" align="left">TITLE</div>
				<input type="text" name="title" class="box" size="90" maxlength="120" value="<%=dto.getTitle()%>">
			</label>
			
			<label class="forumContent">
				<div class="labelText" align="left">CONTENT</div>
				<textarea name="content" rows="10" cols="105" class="box" style="padding:10px"><%=dto.getContent()%></textarea>
			</label>
			<br>
			
			<label class="forumFile">
				<div class="labelText" align="left">FILE</div>
				<input type="file" multiple="multiple" name="file" class="box" size="90">
		<%
			if(img!=null){
		%>
		<div id="slider">
			<ul class="slides">
				<%
					String cla = "slide slide";
				String[] SPimg;
				if (img != null) {
					SPimg = img.split("/");
					cla = cla + SPimg.length;
				%><li class="<%=cla%>"><img
					src="${pageContext.request.contextPath}/resources/img/<%=SPimg[SPimg.length-1] %>"
					width="400" height="250"></li>
				<%
					for (int i = 0; i < SPimg.length; i++) {
					cla = "slide slide";
					int tmp = i + 1;
					cla = cla + tmp;
				%>
				<li class="<%=cla%>"><img
					src="${pageContext.request.contextPath}/resources/img/<%=SPimg[i] %>"
					width="500" height="350"></li>
				<%
					}
				%><li class="slide slide1"><img
					src="${pageContext.request.contextPath}/resources/img/<%=SPimg[0] %>"
					width="500" height="350"></li>
				<%
					} else {
				%><li>이미지 없음</li>
				<%
					}
				%>

			</ul>

			<div id="slider-nav">
				<div id="slider-nav-prv">&#10094;</div>
				<div id="slider-nav-nxt">&#10095;</div>
				<div id="slider-nav-dot-con">
					<%
						if (img != null) {
						SPimg = img.split("/");

						for (int i = 1; i <= SPimg.length; i++) {
							String id = "nav-dot" + i;
					%>
					<span class="slider-nav-dot" style="background: white" id="<%=id%>"></span>
					<%
						}
					}
					%>
				</div>
			</div>
		</div>
<%} %>
			</label>
			
			<hr style="width:60%;border:1px solid #dddddd;">
			<input type="reset" value="CANCEL">
			<input type="submit" value="SUMBIT">
		</div>
	</form>
</div>
    
<%@ include file="../Basic/bottom_nav.jsp"%>