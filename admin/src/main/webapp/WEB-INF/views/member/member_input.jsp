<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
		function check(){
			if (f.id.value==""){
				alert("아이디를 입력해 주세요!!")
				f.id.focus()
				return
			}
			if (f.passwd.value==""){
				alert("비밀번호를 입력해 주세요!!")
				f.passwd.focus()
				return
			}
			document.f.submit()
		}
		function reset(){
			document.f.reset()
			
		}
	</script>

<%@ include file="top.jsp"%>
<div align = "center">
	 		<form name = "f" action = "member_input_ok.do" method = "post">
	 			<table class = "outline" border = "1">
	 				<tr>
	 					<td colspan = "2" align = "center">회원가입</td>
	 				</tr>
	 				<tr>
	 					<td>이름</td>
	 					<td><input type = "text" name = "name" value = "${name}"></td>
	 				</tr>
	 				<tr>
	 					<td>아이디</td>
	 					<td><input type = "text" name = "id"></td>
	 				</tr>
	 				<tr>
	 					<td>비밀번호</td>
	 					<td><input type = "password" name = "passwd"></td>
	 				</tr>
	 				<tr>
	 					<td>주민번호</td>
	 					<td>
	 						<input type = "text" name = "ssn1" value = "${ssn1}"> - 
	 						<input type = "password" name = "ssn2" value = "${ssn2}">
	 					</td>
	 				</tr>
	 				<tr>
	 					<td>이메일</td>
	 					<td><input type = "text" name = "email"></td>
	 				</tr>
	 				<tr>
	 					<td>전화번호</td>
	 					<td>
	 						<input type = "text" name = "hp1" size = "4" maxlength = "4"> -
	 						<input type = "text" name = "hp2" size = "4" maxlength = "4"> - 
	 						<input type = "text" name = "hp3" size = "4" maxlength = "4">
	 					</td>
	 				</tr>
	 				<tr>
	 					<td>성별</td>
	 					<td>
	 						<label><input type = "radio" name = "sex" value = "0">남자</label>
	 						<label><input type = "radio" name = "sex" value = "1">여자</label>
	 					</td>
	 				</tr>
	 				<tr>
	 					<td colspan="2" align="center">
	 						<input type="button" value="확인" onclick="javascript:check()">
	 						<input type = "button" value = "다시쓰기" onclick = "javascript:reset()">
	 						<input type = "button" value = "취소" onclick = "window.location='main.do'">
	 					</td>
	 				</tr>
	 			</table>
	 		</form>
	 	</div>

<%@ include file="bottom.jsp"%>