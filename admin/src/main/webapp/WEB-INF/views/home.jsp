<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="team.Dproject.main.model.*"%>

<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>관리자 페이지</h1>

<%
	String MNUM=null;
	HttpSession session2 = request.getSession();
	MemberDTO sedto=(MemberDTO)session2.getAttribute("sedto");
	if(sedto!=null){
		MNUM=String.valueOf(sedto.getPosition());
		if(Integer.parseInt(MNUM)==0){%>
			<P><a href="ADsuperAD.do">슈퍼관리자</a></P>
		<%}else if(Integer.parseInt(MNUM)==1){%>
			<P><a href="ADbusAD.do">버스관리자</a></P>
		<%}else if(Integer.parseInt(MNUM)==2){%>
			<P><a href="ADhotelAD.do">호텔관리자</a></P>
		<%}else if(Integer.parseInt(MNUM)==3){%>
			<P>일반회원</P>
		<%}%>
		<P><a href="hotel_list.do">호텔게시판</a>
		<P><a href="ADmember_logout.do">로그아웃</a></P>
	<%}else{%>
		<P><a href="ADmember_login.do">로그인</a></P>
	<%}%> 
</body>
</html>
