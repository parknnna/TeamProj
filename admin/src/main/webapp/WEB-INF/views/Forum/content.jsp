<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="team.Dproject.main.model.*"%>
<% 
	MemberDTO member=(MemberDTO)session.getAttribute("sedto");
	int member_no=-1;
	if(member!=null){
		member_no=member.getMember_no();
	}
%>
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
	.contentContainer{
		width:60%;
		margin:20px auto;
		align:center;
	}
</style>
<%@ include file="../Basic/head.jsp" %>

<body>
<%@ include file="../Basic/nav_Forum.jsp" %>
<!-- END nav -->

<!-- body 전체 div -->
<div class="BoxContainer" align="center">
<!-- Content -->
	<div class="contentContainer">
		<div class="infoBox" style="width:100%">
			<div style="margin-top:100px;width:100%;text-align:left;margin-bottom:10px" >
				<span style="margin-right:10px"><img src="${pageContext.request.contextPath}/resources/images/bg_5.jpg" style="width:40px;height:40px;border-radius:40px;"></span>
				<span>
					<font>${getBoard.member_no}</font>
				</span>
			</div>
		</div>
		
		<div class="titleBox">
			<div class="title" style="text-align:left;margin-bottom:10px">
				<span><font style="font-weight:700;font-size:16px">${getBoard.title }</font></span>
			</div>
		</div>
		
		<div class="contentBox" style="margin-top:10px;width:100%">
			<textarea rows="5" cols="90" readOnly style="padding:10px;width:100%;">${getBoard.content}</textarea>
		</div>
	</div>
			
	<div class="buttonContainer">
			<span><i class="fas fa-chevron-left" style="font-size:1.5em;"></i></span>
			<span><i class="fas fa-bars" style="font-size:1.5em;"></i></span>
			<span><i class="fas fa-chevron-right" style="font-size:1.5em;"></i></span>
	</div>	
	
	<div class="commentContainer" style="width:60%;"> 
		<label for="content" float="left">comment</label>
        <form name="commentInsertForm" action="comment_write.do" method="post">
            <div class="input-group">
               <input type="hidden" name="bno" value="${getBoard.main_board_no}"/>
               <%if(member!=null){%>
               <input id="writer"type="hidden" name="writer" value="<%=member.getId()%>"/><%} %>
               <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
               <span class="input-group-btn">
                    <input type="button" class="btn btn-default" name="commentInsertBtn" onclick="javascript:check(<%=member_no %>)" value="등록">
               </span>
              </div>
        </form>
    </div>
    
    <div class="container" style="margin-bottom:30px;width:60%">
        <div class="commentList">
        	<c:forEach var="cdto" items="${commentList}">
        		<table style="width:100%;">
        			<tr style="border-bottom:1px solid #e0e0e0">
        				<td style="width:20%">${cdto.writer}</td>
        				<td style="width:70%">${cdto.content}</td>
        				<td style="width:10%"><a href="comment_delete.do?cno=${cdto.cno }&bno=${cdto.bno}">삭제</a></td>
        			</tr>
        		</table>
        	</c:forEach>
        </div>
    </div>
</div>

<%-- <%@ include file="commentS.jsp" %> --%>
<%@ include file="../Basic/bottom_nav.jsp"%>
