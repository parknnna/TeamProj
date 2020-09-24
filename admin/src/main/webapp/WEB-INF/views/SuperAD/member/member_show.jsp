<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../Basic/head.jsp" %>   
<%@ include file="../../Basic/nav_AD.jsp" %>  
<%@page import="team.Dproject.main.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../top2.jsp"%>
	<table align="center" border="1">
		<%MemberDTO_sm dto =(MemberDTO_sm) request.getAttribute("dto"); %>
		<tr><td>회원 번호 : </td><td> <%=dto.getMember_no()%></td></tr>
		<tr><td>이름 : </td><td> <%=dto.getName() %></td></tr>
		<tr><td>아이디 : </td><td> <%=dto.getId() %></td></tr>
		<tr><td>비밀번호 : </td><td> <%=dto.getPasswd() %></td></tr>
		<tr><td>주민등록 번호 : </td><td> <%=dto.getSsn1() %> - <%=dto.getSsn2() %></td></tr>
		<tr><td>E-mail : </td><td> <%=dto.getEmail() %></td></tr>
		<tr><td>핸드폰 번호 : </td><td> <%=dto.getHp1() %> - <%=dto.getHp2() %> - <%=dto.getHp3() %></td></tr>
		<tr><td>회원 등급 : </td><td> <%=dto.getPosition() %></td></tr>
		<tr><td>성별 : </td><td> <%=dto.getSex() %></td></tr>
		<tr><td>누적 포인트 : </td><td> <%=dto.getPoint() %></td></tr>
		<tr><td>가입날짜 : </td><td> <%=dto.getJoindate() %></td></tr>
		<tr><td><a href="ADmember_edit.do?id=<%=dto.getId() %>">수정</a>
			<a href="ADmember_delete.do?id=<%=dto.getId() %>">삭제</a>
			<a href="ADmember_list.do">돌아가기</a>
	</table>
</body>
</html>
<%@ include file="../../Basic/bottom_nav.jsp" %>