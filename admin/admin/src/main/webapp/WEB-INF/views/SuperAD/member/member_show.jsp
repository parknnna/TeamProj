<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../Basic/head.jsp" %>   
<%@ include file="../../Basic/nav_AD.jsp" %>  
<%@page import="team.Dproject.main.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">

<%@include file="../top2.jsp"%>
<style>


td{
	padding: 5px;
    border-bottom: 1px solid #e0e0e0;
}

</style>
<div align="center" align="center">
	<h5 style="font-family: 'Nanum Gothic', sans-serif;margin-top:20px">회원 상세 정보</h5>
	<table style="width:50%;text-align:center;">
		<%MemberDTO_sm dto =(MemberDTO_sm) request.getAttribute("dto"); %>
		<tr><td>회원 번호</td><td> <%=dto.getMember_no()%></td></tr>
		<tr><td>이름</td><td> <%=dto.getName() %></td></tr>
		<tr><td>아이디</td><td> <%=dto.getId() %></td></tr>
		<tr><td>비밀번호</td><td> <%=dto.getPasswd() %></td></tr>
		<tr><td>주민등록번호</td><td> <%=dto.getSsn1() %> - <%=dto.getSsn2() %></td></tr>
		<tr><td>E-mail</td><td> <%=dto.getEmail() %></td></tr>
		<tr><td>핸드폰 번호</td><td> <%=dto.getHp1() %> - <%=dto.getHp2() %> - <%=dto.getHp3() %></td></tr>
		<tr><td>회원 등급</td><td> <%=dto.getPosition() %></td></tr>
		<tr><td>성별</td><td> <%=dto.getSex() %></td></tr>
		<tr><td>누적 포인트</td><td> <%=dto.getPoint() %></td></tr>
		<tr><td>가입날짜</td><td> <%=dto.getJoindate() %></td></tr>
		<tr>
		<td colspan="2">
			<a href="ADmember_edit.do?id=<%=dto.getId() %>">수정</a>
			<a href="ADmember_delete.do?id=<%=dto.getId() %>">삭제</a>
			<a href="ADmember_list.do">돌아가기</a>
		</td>
		</tr>
	</table>
</div>
