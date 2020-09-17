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
		var width = 681; //슬라이드 한 개의 폭
		var height = 300; //슬라이드 높이
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
	
	
	function check(a){
		if (a<0) {
		    alert("로그인을 하셔야 게시글 작성이 가능합니다.");
		    window.location = "member_login.do";
		    return;
		}else {
			f.submit();
			return;	
		}	
	};
	
	function check2(a,link){
		if (a<0) {
		    alert("로그인을 하셔야 가능합니다.");
		    window.location = "member_login.do";
		    return;
		}else {
			window.location = link;
			return;	
		}	
	};

</script>

</head>

<body>
<%
	MemberDTO sedto=(MemberDTO)session.getAttribute("sedto");
	hotel_boardDTO boarddto2=(hotel_boardDTO)request.getAttribute("getBoard2");
	int memberno=-1;
	int pos=-1;
	if(sedto!=null){
		memberno=sedto.getMember_no();
		pos=sedto.getPosition();
	}
	int boardno=-2;
	int hotelNO=-1;
	int getbod=-1;
	if(boarddto2!=null){
		String s=boarddto2.getMember_no();
		boardno=Integer.parseInt(s);
		hotelNO=boarddto2.getHotel_no();
		getbod=boarddto2.getHotel_board_no();
	}
	List<hotel_boardDTO> list=(List)request.getAttribute("listBoard");
	List<hotel_boardDTO> list2=(List)request.getAttribute("listBoard2");
	hotel_boardDTO boarddto=(hotel_boardDTO)request.getAttribute("getBoard");
	int Hmember=(Integer)request.getAttribute("member");

	List<upDTO> ulist=(List)request.getAttribute("ulist");
	List<upDTO> dlist=(List)request.getAttribute("dlist");
	
	
	MemberDTO member2=(MemberDTO)session.getAttribute("sedto");
	int a=-1;
	if(member2!=null){			
		a=member2.getMember_no();
	}

%>
	<div align="center"style="margin-top:90px">
				<div class="tableContainer" style="width:60%">
					
					<table width="45%" border="1px">
						<tr>
							<td align="left" width="50%">제목 : ${getBoard.title }</td>
							<td width="28%">글쓴이 : ${getBoard.member_no}</td>
						<%if(boardno==memberno||memberno==Hmember||pos==0){%>
							<td width="12%" align="right"><a href="hotel_board_list.do?hotel_no=${getBoard.hotel_no}">뒤로가기</a></td>
						</tr>
						<tr>
							<td width="10%" colspan="3" align="right">
								<a href="hotel_board_update.do?hotel_board_no=<%=getbod%>">수정</a> |
								<a href="hotel_board_delete2.do?hotel_board_no=<%=getbod%>">삭제</a>
							</td>
						<%}else{ %>
							<td width="12%">
								<a href="hotel_board_list.do?hotel_no=${getBoard.hotel_no}">뒤로가기</a>
							</td>
						</tr>
						<tr>
							
						<%} %>
						</tr>
						<tr align="center">
							<td colspan="4">
								좋아요수 : <%=ulist.size() %>  싫어요수 : <%=dlist.size() %>
							</td>
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
									%><li class="<%=cla%>"><img src="${pageContext.request.contextPath}/resources/img/<%=SPimg[SPimg.length-1] %>" width="681" height="300"></li><%
									for(int i=0;i<SPimg.length;i++){
										cla="slide slide";
										int temp=i+1;
										cla=cla+temp;
										%>
										<li class="<%=cla%>">
										<img src="${pageContext.request.contextPath}/resources/img/<%=SPimg[i] %>" width="681" height="300">
										</li>
										<% 
									}
									%><li class="slide slide1"><img src="${pageContext.request.contextPath}/resources/img/<%=SPimg[0] %>" width="681" height="300"></li><%
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
							<td colspan="3"><textarea rows="15" cols="92" readOnly style="resize: none;">${getBoard.content}</textarea></td>
						</tr>
						<%
						boolean up=(boolean)request.getAttribute("up");
						boolean down=(boolean)request.getAttribute("down");
						%>
						<tr align="center">
							<td colspan="4">
								<%if(up){ %>
									<a href="javascript:check2(<%=a %>,'hotel_board_up.do?hotel_board_no=<%=dto.getHotel_board_no()%>&hotel_no=<%=Integer.parseInt(request.getParameter("hotel_no")) %>')"><i class="far fa-laugh-squint fa-3x"></i></a>
								<%}else{ %>
									<a href="hotel_board_up_re.do?hotel_board_no=<%=dto.getHotel_board_no()%>&hotel_no=<%=Integer.parseInt(request.getParameter("hotel_no")) %>"><i class="fas fa-laugh-squint fa-3x"></i></a>
								<%} %>
								<%if(down){ %>
									<a href="javascript:check2(<%=a %>,'hotel_board_down.do?hotel_board_no=<%=dto.getHotel_board_no()%>&hotel_no=<%=Integer.parseInt(request.getParameter("hotel_no")) %>')"><i class="far fa-frown fa-3x"></i></a>
								<%}else{ %>
									<a href="hotel_board_down_re.do?hotel_board_no=<%=dto.getHotel_board_no()%>&hotel_no=<%=Integer.parseInt(request.getParameter("hotel_no")) %>"><i class="fas fa-frown fa-3x"></i></a>
								<%} %>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<form name="f" action="re_insert.do" method="post">
									<input type="hidden" value="${getBoard.hotel_board_no }" name="hotel_board_no"> 
									<input type="hidden" value="<%=Integer.parseInt(request.getParameter("hotel_no"))%>" name="hotel_no">
									<input type="hidden" name="re_step" value="${getBoard.re_step}"> 
									<input type="hidden" name="re_group" value="${getBoard.re_group}">
									<input type="hidden" name="re_step" value="${getBoard.re_level}"> 
									<input type="text" size="77" name="content">
									<input type="button" onclick="javascript:check(<%=a%>)" value="댓글달기">
								</form>
							</td>
						</tr>
						<tr><td colspan="3">
						<table  width="100%" >
						<tr align="center" style="border-bottom: 1px solid;">
							<td width="13%">댓글쓴사람</td>
							<td width="67%" align="left">댓글</td>
							<td width="10%">날짜</td>
							<td></td>
						</tr>
						<c:if test="${empty listBoard}">
							<tr>
								<td colspan="3">댓글없음</td>
							</tr>
						</c:if>
						<%
							for(int i=0;i<list.size();i++){
						%>
							<tr align="center" style="border-bottom: 1px solid;">
								<%
								String temp=list2.get(i).getMember_no();
								int lmember=Integer.parseInt(temp);
								if(list.get(i).getMember_no().equals(boarddto.getMember_no())) {%>
								<td width="18%">☆글쓴이☆<%=list.get(i).getMember_no() %></td>
								<%}else if(lmember==Hmember){%>
								<td width="18%">★호텔 관리자★<%=list.get(i).getMember_no() %></td>
								<%}else{ %>
								<td width="18%"><%=list.get(i).getMember_no() %></td>
								<%} %>
								<td width="59%" align="left"><%=list.get(i).getContent() %></td>
								<td width="9%" ><%=list.get(i).getReg_date() %></td>
								<%
								int listno=Integer.parseInt(list2.get(i).getMember_no());
								
								if(listno==memberno||memberno==Hmember||pos==0) {%>
								<td width="14%"><a href="hotel_board_delete.do?hotel_board_no=<%=list.get(i).getHotel_board_no()%>">삭제</a></td>
								<%} else{%>
								<td width="14%"></td>
								<%} %>
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
			[<a href="hotel_content.do?pageNum=${startPage-1}">이전</a>]		
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage }" step="1">
		[<a href="hotel_content.do?pageNum=${i}&hotel_board_no=<%=getbod %>&hotel_no=<%=hotelNO%>">${i}</a>]
	</c:forEach>
		<c:if test="${endPage<pageCount}">
			[<a href="hotel_content.do?pageNum=${endPage+1}">다음</a>]		
		</c:if>
	</c:if>		
	</div>
</body>
<%@ include file="../Basic/bottom_nav.jsp" %> 