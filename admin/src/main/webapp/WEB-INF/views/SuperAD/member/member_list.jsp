<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- memberAll.jsp -->
<%@ include file="../top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
th {
    text-align: center;
}
</style>
<div align="center">

	<c:if test="${mode == 'all'}">
	<h2>회 원 목 록 보 기</h2>
	</c:if>
	<c:if test="${mode != 'all'}">
	<h2>회 원 찾 기</h2>
	<form name="f" method="post" action="ADmember_list.do">
		<input type="hidden" name="mode" value="find"/>
		<select name="search">
			<option value="id">아이디</option>
			<option value="name">이름</option>
		</select>
		<input type="text" name="searchString">
		<input type="submit" value="찾기">
	</form>
	</c:if>	

	<table width="100%" class="outline">
		<tr>
			<td colspan="8" align="right">
			<a href="ADmember_input.do">회원가입</a>
			<a href="ADmember_list.do?mode=1">회원찾기</a>
			</td>
		</tr>
		<tr>
			<th class="m3">번호</th>
			<th class="m3">아이디</th>
			<th class="m3">이름</th>
			<th class="m3">이메일</th>
			<th class="m3">전화번호</th>
			<th class="m3">가입일</th>
			<th class="m3">회원등급</th>
			<th class="m3">수정 | 삭제</th>
		</tr>
		<c:choose>
			<c:when test="${empty memberList}">
				<tr>
					<td colspan="7" align = "center">등록된(찾으시는) 회원이 없습니다.</td>
				</tr>	
			</c:when>
			<c:otherwise>
				<c:forEach var="dto" items="${memberList}">
					<tr align = "center">
						<td>${dto.member_no}</td>
						<td>${dto.id}</td>
						<td><a href="ADmember_show.do?no=${dto.member_no }">${dto.name}</a></td>
						<td>${dto.email}</td>
						<td>${dto.allHp}</td>
						<td>${dto.joindate}</td>
						<td>${dto.position}</td>
						<td>
							<a href = "ADmember_edit.do?id=${dto.id}">수정</a> |
							<a href = "ADmember_delete.do?id=${dto.id}">삭제</a>
						</td>
					</tr>	
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</div>
<%@ include file="../bottom.jsp"%>