<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="team.Dproject.main.model.*"%>
<%@page import="java.util.*"%>
<head>
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

.slide1 {
	background: red;
}

.slide2 {
	background: blue;
}

.slide3 {
	background: green;
}

.slide4 {
	background: purple;
}

.slide5 {
	background: pink;
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
</head>
<script>
	'use strict';

	$(function() {

		//이 부분을 자신의 상황에 맞게 수정
		var width = 500; //슬라이드 한 개의 폭
		var height = 350; //슬라이드 높이
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
<script type="text/javascript">
	function check(member_no){
		if (member_no<0){
			alert("로그인을 해주세요.")
			window.location="member_login.do";
			return
		}
		document.commentInsertForm.submit()
	}
</script>
<style>
.contentContainer {
	width: 60%;
	margin: 20px auto;
	align: center;
}

.btn-default:hover {
	border: 2px solid #c94dff;
}
</style>
<%@ include file="../Basic/head.jsp"%>
<body>
	<%@ include file="../Basic/nav_Forum.jsp"%>
	<%
		int member_no = -1;
	if (member != null) {
		member_no = member.getMember_no();
	}
	List<CommentDTO> cdto3 = (List) request.getAttribute("commentList2");
	int temp = 0;
	%>
	<!-- END nav -->

	<!-- body 전체 div -->
	<div class="BoxContainer" align="center">
		<!-- Content -->
		<div class="contentContainer">
			<div class="infoBox" style="width: 100%">
				<div
					style="margin-top: 100px; width: 100%; text-align: left; margin-bottom: 10px">
					<span style="margin-right: 10px"><img
						src="${pageContext.request.contextPath}/resources/img/<%=request.getAttribute("proimg") %>"
						style="width: 40px; height: 40px; border-radius: 40px;"></span> <span>
						<font>${getBoard.member_no}</font>
					</span>
				</div>
			</div>
			<%
				BoardDTO bdto = (BoardDTO) request.getAttribute("getBoard");
			String getNo = (String) request.getAttribute("getNo");
			%>
			<div class="titleBox">
				<div class="title" style="text-align: left; margin-bottom: 10px">
					<span><font style="font-weight: 700; font-size: 16px">${getBoard.title }</font></span>
				</div>
			</div>

			<div class="contentBox" style="margin-top: 10px; width: 100%">
				<textarea rows="15" cols="90" readOnly
					style="padding: 10px; width: 100%;">${getBoard.content}</textarea>
			</div>
			<%
				if (Integer.parseInt(getNo) == member_no) {
			%>
			<div class="updelBox">
				<a href="board_update.do?main_board_no=${getBoard.main_board_no }">수정</a>
				<a href="board_delete.do?main_board_no=${getBoard.main_board_no }">삭제</a>
			</div>
			<%
				}
			%>
		</div>
		<%
			BoardDTO dto=(BoardDTO)request.getAttribute("getBoard"); 
			String img=dto.getFilename(); 
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
					width="500" height="350"></li>
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
		<div class="buttonContainer" style="margin-bottom: 10px;">
			<%
				if (request.getAttribute("prevNum") != null) {
			%>
			<a
				href="board_content.do?main_board_no=<%=request.getAttribute("prevNum")%>"><i
				class="fas fa-chevron-left" style="font-size: 1.5em;"></i></a>
			<%
				}
			%>
			<a href="board_list.do"><i class="fas fa-bars"
				style="font-size: 1.5em;"></i></a>
			<%
				if (request.getAttribute("nextNum") != null) {
			%>
			<a
				href="board_content.do?main_board_no=<%=request.getAttribute("nextNum")%>"><i
				class="fas fa-chevron-right" style="font-size: 1.5em;"></i></a>
			<%
				}
			%>
		</div>

		<div class="commentContainer" style="width: 60%;">
			<label for="content" style="float: left;"><i
				class="far fa-comments"></i> comment</label>
			<form name="commentInsertForm" action="comment_write.do"
				method="post">
				<div class="input-group">
					<input type="hidden" name="bno" value="${getBoard.main_board_no}" />
					<%
						if (member != null) {
					%>
					<input id="writer" type="hidden" name="writer"
						value="<%=member.getMember_no()%>" />
					<%
						}
					%>

					<%
						if (member == null) {
					%>
					<input type="text" class="form-control" id="content" name="content"
						placeholder="로그인 후 이용이 가능합니다." readOnly>
					<%
						}
					%>

					<%
						if (member != null) {
					%>
					<input type="text" class="form-control" id="content" name="content"
						placeholder="내용을 입력하세요.">
					<%
						}
					%>

					<span class="input-group-btn"> <input type="button"
						class="btn btn-default" name="commentInsertBtn"
						style="margin-left: 15px; margin-top: 5px;"
						onclick="javascript:check(<%=member_no%>)" value="등록">
					</span>
				</div>
			</form>
		</div>

		<div class="container" style="margin-bottom: 30px; width: 60%">
			<div class="commentList">
				<c:forEach var="cdto" items="${commentList}">
					<table style="width: 100%;">
						<tr style="border-bottom: 1px solid #e0e0e0">
							<td style="width: 20%">${cdto.writer}</td>
							<td style="width: 50%">${cdto.content}</td>
							<td style="width: 10%">${cdto.com_date }</td>
							<td style="width: 10%">
								<%
									int q = -2;
								if (cdto3 != null) {
									q = Integer.parseInt(cdto3.get(temp).getWriter());
								}
								if (member != null) {
									if (member.getMember_no() == q) {
								%> <a href="comment_update.do?cno=${cdto.cno }&bno=${cdto.bno}">수정</a>
								| <a href="comment_delete.do?cno=${cdto.cno }&bno=${cdto.bno}">삭제</a>
								<%
									}
								}
								temp++;
								%>
							</td>
						</tr>
					</table>
				</c:forEach>
			</div>
		</div>
	</div>

	<%-- <%@ include file="commentS.jsp" %> --%>
	<%@ include file="../Basic/bottom_nav.jsp"%>