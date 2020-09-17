<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="team.Dproject.main.model.*"%>
<%
	MemberDTO member=(MemberDTO)session.getAttribute("sedto");
	int a=-1;
	if(member!=null){			
		a=member.getMember_no();
	}
%>
<html>
<%@ page import="java.util.*" %>

<style>
.writeBoardBtn {
	border-radius: 2px;
	border: none;
}

.writeBoardForm {
	margin-top: 20px;
}

.writeBoardIn {
	padding: 16px 24px 24px;
}

.writeBtn {
	display: block; border-radius : 13px;
	border: 2px solid #c94dff;
	background-color: #fff;
	color: #000;
	width: 60%;
	cursor: pointer;
	border-radius: 13px; border : 2px solid #c94dff; background-color :
	#fff; color : #000; width : 60%; cursor : pointer;
	transition: all 0.8s;
}

.writeBtn:hover {
	box-shadow: 0 50px 0 0 #c94dff inset, 0 -50px 0 0 #c94dff inset;
	border-color: #fff;
	font-weight: 600;
	border: 2px solid #fff;
	color: #fff;
}

.revContainer{
	width:60%;
	margin:20px auto;
}

.content{
	border-top:1px solid #e0e0e0;
}

.revContainer .multiline{
	display: inline-table;
	height:20%;
	border-top:1px solid #e0e0e0;
	width:90%;
	margin:0 auto;
	
}
	
.revContainer .multiline .is-2{
	width:25%;
	float:left;
	margin-right:20px;
	margin-top:10px;
	height:100%;
}

.revContainer .multiline .is-9{
	width:70%;
	text-align:left;
	padding:8px 0;
	margin-top:10px;
}

.memberInfo{
	margin:0 auto;
}
.memberImg{
	padding:10px 10px;
}
.memberImg img{
	width:70px;
	height:70px;
	border-radius:70px;
}
.memberId{
	margin:0 auto;
	width:50;
	text-align:center;
}

.memberImgWrapper{
	margin:0 auto;
	padding:0;
	width:100px;
	text-align:center;
}

</style>

<%@ include file="../Basic/head.jsp" %>
<script type="text/javascript">
	function check(a){
		if (a<0) {
		    alert("로그인을 하셔야 게시글 작성이 가능합니다.");
		    window.location = "member_login.do";
		    return;
		}else {
			window.location = "board_write.do";
			return;	
		}
		
	};
</script>
<body>
<%@ include file="../Basic/top_Forum.jsp" %>
	
	<!-- body 전체 div -->
	<div class="BoxContainer" align="center">
	<!-- 리뷰작성 버튼 -->
	<div class="writeBoardBtn">
		<div class="writeBoardForm">
			<div class="writeBoardIn">
				<!-- <a href="board_write.do"> -->
					<div align="center">
						<button class="writeBtn" onclick="javascript:check(<%=a%>)">Write Board</button>
					</div>
				<!-- </a> -->
			</div>
		</div>
	</div>

	<!-- BoardList Start -->
	<%int cnt=0; %>
	<c:forEach var="dto" items="${listBoard}">
	
	<div class="revContainer">
	<div class="multiline">
		<div class="is-2">
			<div class="memberInfo">
				<div class="memberImgWrapper">
					<div class="memberImg">
						<a><img src="${pageContext.request.contextPath}/resources/images/bg_5.jpg"></a>
					</div>
				</div>
				<div class="memberId">
					<div>${dto.member_no}</div>
				</div>
				<div class="count">
					<div>${dto.readcount }</div>
				</div>
			</div>
		</div>
		
		<div class="is-9">
			<span>${dto.reg_date}</span>
			<div class="revTitle">
				<span><a href="board_content.do?main_board_no=${dto.main_board_no}"><font style='font-weight:800'>${dto.title}</font></a></span>
			</div>
			
			<div class="revContent" style="display: table;">
				<span class="rev_data">
					
					<% 
						List<BoardDTO>list=(List<BoardDTO>)request.getAttribute("listBoard");
						String text=list.get(cnt).getContent();
						
						
						if(text.length()<130){%>
							<font><%=text %></font>
					<%		
						}else{
							String text_cut=list.get(cnt).getContent().substring(0, 130);
							String text_cut2=list.get(cnt).getContent().substring(130,list.get(cnt).getContent().length()-1 );%>
							<font><%=text_cut %></font>
							<font style="display:none" id="<%=list.get(cnt).getMain_board_no()%>"><%=text_cut2 %></font>
						<%
							int read = 10000+list.get(cnt).getMain_board_no();
							int close = 20000+list.get(cnt).getMain_board_no();
						%>
				<span id="dots">...</span>
				<span id="<%=read%>"><a href="javascript:open_text(<%=list.get(cnt).getMain_board_no()%>,<%=read%>,<%=close%>);" id="<%=read%>">Read More</a></span>
				<span id="<%=close%>" style="display:none"><a href="javascript:close_text(<%=list.get(cnt).getMain_board_no()%>,<%=read%>,<%=close%>);" id="<%=close%>">Read Less</a></span>
					<% }cnt++; %>
				</span>
			</div>
			<div>${dto.filename }</div>
		</div>
	</div>
	</div>
	</c:forEach>
	</div>
	
<script>
	function open_text(i,a,b){
		document.getElementById(i).style.display='';
		document.getElementById(b).style.display='';
		document.getElementById(a).style.display='none';
	};	
	
	function close_text(i,a,b){
		document.getElementById(i).style.display='none';
		document.getElementById(b).style.display='none';
		document.getElementById(a).style.display='';
	};
	
	</script>
	
<%@ include file="../Basic/bottom_top.jsp"%>
