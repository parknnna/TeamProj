<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="top.jsp" %>
<script type="text/javascript">
	function check(){
		if(f.passwd.value == ""){
			alert("비밀번호를 입력해 주세요!!")
			f.passwd.focus()
			return
			
		}
		if(f.passwd.value != "${sedto.passwd}"){
			alert("비밀번호가 틀립니다")
			f.passwd.focus()
			return
			
		}
		document.f.submit();
		
	}
</script>
<div align = "center">
	<form name = "f" action = "member_edit_ok.do?mode=mypage" method = "post">
		<input type="hidden" name="member_no" value="${sedto.member_no}">
		<input type = "hidden" name = "name" value = "${sedto.name}">
		<input type = "hidden" name = "sex" value = "${sedto.sex}">
		<input type = "hidden" name = "position" value = "${sedto.position}" >
		<table class = "outline" border = "1">
			<caption>마 이 페 이 지</caption>
			<tr>
				<th align = "center">이름</th>
				<td colspan = "3">${sedto.name}</td>
			</tr>
			<tr>
				<th align = "center">아이디</th>
				<td><input type = "text" name = "id" value = "${sedto.id}" size = "10" readOnly></td>
				<th align = "center">비밀번호</th>
				<td><input type = "password" name = "passwd" size = "10"></td>
			</tr>
			<tr>
				<th align = "center">주민번호</th>
				<td colspan = "3">
					<input type = "text" name = "ssn1" value = "${sedto.ssn1}" size = "10" readOnly> - 
					<input type = "password" name = "ssn2" value = "${sedto.ssn2}" size = "10" readOnly>
				</td>
			</tr>
			<tr>
				<th align = "center">이메일</th>
				<td colspan = "3">
					<input type = "text" name = "email" value = "${sedto.email}">
				</td>
			</tr>
			<tr>
				<th align = "center">전화번호</th>
				<td colspan = "3">
					<input type = "text" name = "hp1" size = "4" maxlength = "4" value = "${sedto.hp1}"> -
					<input type = "text" name = "hp2" size = "4" maxlength = "4" value = "${sedto.hp2}"> - 
					<input type = "text" name = "hp3" size = "4" maxlength = "4" value = "${sedto.hp3}">
				</td>
			</tr>
			<tr>
				<th align = "center">포인트</th>
				<td colspan = "3"><input type = "text" name = "point" value = "${sedto.point}" size = "5" readOnly>점</td>
			</tr>
			<tr>
				<th align = "center">가입일</th>
				<td colspan = "3"><input type = "text" name = "joindate" value = "${sedto.joindate}" size = "10" readOnly></td>
			</tr>
			<tr>
				<td colspan = "4" align = "center">
					<input type = "button" value = "수정" onclick = "javascript:check()">
					<input type = "button" value = "예약 페이지" onclick = "window.location='member_reserve.do'">
					<input type="button" value="회원탈퇴" onclick="window.location='member_withdraw.do'">
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="bottom.jsp" %>
