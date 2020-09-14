<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="team.Dproject.main.model.*"%>
<%@page import="java.util.*" %>
<%@ include file="../Basic/head.jsp" %>   
<%@ include file="../Basic/nav_Hotel.jsp" %> 
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
	html {
	    overflow: -moz-scrollbars-vertical; 
	    overflow-y: scroll;
	}
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
		var width = 300; //슬라이드 한 개의 폭
		var height = 150; //슬라이드 높이
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

<body>
	<div align="center"style="margin-top:70px">
			<fieldset style="width: 900;">
				<div>
					<table border="1">
						<tr>
							<td align="left" width="60%">제목 : ${getBoard.title }</td>
							<td width="28%">글쓴이 : ${getBoard.member_no}</td>
							<td width="12%"><a href="hotel_board_list.do?hnum=${getBoard.hotel_no}">뒤로가기</a></td>
						</tr>
						
						
						
						<!-- ------------------------------------------------------------------------- -->
						
						
						
						<%
						hotel_boardDTO dto=(hotel_boardDTO)request.getAttribute("getBoard"); 
						String img=dto.getFilename();
						if(img!=null){
						%><tr>
						<td colspan="3">
						<div id="slider">
							<ul class="slides">
								<%
								String cla="slide slide";
								String[] SPimg;
								if(img!=null){
									SPimg=img.split("/");
									cla=cla+SPimg.length;
									%><li class="<%=cla%>"><img src="${pageContext.request.contextPath}/resources/img/<%=SPimg[SPimg.length-1] %>" width="300" height="150"></li><%
									for(int i=0;i<SPimg.length;i++){
										cla="slide slide";
										int temp=i+1;
										cla=cla+temp;
										%>
										<li class="<%=cla%>">
										<img src="${pageContext.request.contextPath}/resources/img/<%=SPimg[i] %>" width="300" height="150">
										</li>
										<% 
									}
									%><li class="slide slide1"><img src="${pageContext.request.contextPath}/resources/img/<%=SPimg[0] %>" width="300" height="150"></li><%
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
						</td>
						</tr>	
						<%}%>
						
						<!-- ------------------------------------------------------------------------- -->
											
						<tr>
							<td colspan="3"><textarea rows="20" cols="90" readOnly style="resize: none;">${getBoard.content}</textarea></td>
						</tr>
						<tr>
							<td colspan="3">
								<form name="f" action="re_insert.do" method="post">
									<input type="hidden" value="${getBoard.hotel_board_no }" name="hotel_board_no"> 
									<input type="hidden" value="<%=Integer.parseInt(request.getParameter("hotel_no"))%>" name="hotel_no">
									<input type="hidden" name="re_step" value="${getBoard.re_step}"> 
									<input type="hidden" name="re_group" value="${getBoard.re_group}">
									<input type="hidden" name="re_step" value="${getBoard.re_level}"> 
									<input type="text" size="75" name="content">
									<input type="submit" value="댓글달기">
								</form>
							</td>
						</tr>
						<tr><td colspan="3">
						<table style="border:1px solid red" width="100%" border="1">
						<tr>
							<td width="13%">댓글쓴사람</td>
							<td width="67%" align="left">댓글</td>
							<td width="10%">날짜</td>
						</tr>
						<c:if test="${empty listBoard}">
							<tr>
								<td colspan="3">댓글없음</td>
							</tr>
						</c:if>
						<%
							List<hotel_boardDTO> list=(List)request.getAttribute("listBoard");
							hotel_boardDTO boarddto=(hotel_boardDTO)request.getAttribute("getBoard");
							for(hotel_boardDTO re_dto : list){
						%>
							<tr align="center">
								<%if(re_dto.getMember_no().equals(boarddto.getMember_no())) {%>
								<td width="10%">☆관리자☆<%=re_dto.getMember_no() %></td>
								<%}else{ %>
								<td width="10%"><%=re_dto.getMember_no() %></td>
								<%} %>
								<td width="70%" align="left"><%=re_dto.getContent() %></td>
								<td width="10%"><%=re_dto.getReg_date() %></td>
							</tr>
						<%} %>
						</table></td>
						</tr>
						
					</table>
				</div>

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
			</fieldset>
	</div>
</body>
<%@ include file="../Basic/bottom.jsp" %> 