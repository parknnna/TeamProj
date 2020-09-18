<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../top.jsp"%>
<script type="text/javascript">
		function check(){
			if (f.name.value==""){
				alert("이름를 입력해 주세요!!")
				f.name.focus()
				return
			}
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
			if (f.ssn1.value==""){
				alert("주민등록 번호 앞자리를 입력해 주세요!!")
				f.ssn1.focus()
				return
			}
			if (f.ssn2.value==""){
				alert("주민등록 번호 뒷자리를 입력해 주세요!!")
				f.ssn2.focus()
				return
			}
			if (f.email.value==""){
				alert("이메일를 입력해 주세요!!")
				f.email.focus()
				return
			}
			if (f.hp1.value==""){
				alert("전화번호 앞자리 입력해 주세요!!")
				f.hp1.focus()
				return
			}
			if (f.hp2.value==""){
				alert("전화번호 중간자리 입력해 주세요!!")
				f.hp2.focus()
				return
			}
			if (f.hp3.value==""){
				alert("전화번호 뒷자리를 입력해 주세요!!")
				f.hp3.focus()
				return
			}
			if (f.sex.value==""){
				alert("성별를 입력해 주세요!!")
				
				return
			}
			document.f.submit()
		}
		function reset(){
			document.f.reset()
			
		}
	</script>
<body>
	<div align="center">
		<form name="f" action="ADmember_input_ok.do" method="post">
			<table class="outline" border="1">
				<tr>
					<td colspan="2" align="center">회원가입</td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="${name}"></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="passwd"></td>
				</tr>
				<tr>
					<td>주민번호</td>
					<td>
						<input type="text" name="ssn1" value="${ssn1}"> -
						<input type="password" name="ssn2" value="${ssn2}">
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>
						<input type="text" name="hp1" size="4" maxlength="4"> - 
						<input type="text" name="hp2" size="4" maxlength="4"> -
						<input type="text" name="hp3" size="4" maxlength="4">
					</td>
				</tr>
				<tr>
					<td>성별</td>
					<td><label><input type="radio" name="sex" value="1">남자</label>
						<label><input type="radio" name="sex" value="2">여자</label>
					</td>
				</tr>
				<tr>
					<td>
						<select name="position">
							<option value="0">슈퍼관리자</option>
							<option value="1">버스관리자</option>
							<option value="2">호텔관리자</option>
							<option value="3" selected>일반회원</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="button" value="확인"
						onclick="javascript:check()"> <input type="button"
						value="다시쓰기" onclick="javascript:reset()"> <input
						type="button" value="취소" onclick="window.location='ADmain.do'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<%@ include file="../bottom.jsp"%>