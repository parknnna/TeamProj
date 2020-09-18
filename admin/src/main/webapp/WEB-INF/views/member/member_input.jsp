<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../Basic/head.jsp" %>
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
	<style>
		.form-group{
			text-align:left;
		}
		
		input #idn{
			width:40%;
		}
		
	</style>
<%@ include file="../Basic/nav_Login.jsp" %>
<div align="center" style="margin:90px auto 30px auto;">
	<div class="row" align="center" style="display:block;margin:0 auto;">
<div class="card" style="width:700px;margin:0 auto;box-shadow: 3px 3px 5px;">
<h3 class="dark-grey" style="margin-top:10px">Registration</h3>
<article class="card-body">
	<form name = "f" action = "member_input_ok.do" method = "post" style="width:80%;">
 
				<div class="form-group">
					<label class="reg_form">Name</label>
					<input type = "text" class="form-control" name = "name" value = "${name}">
				</div>
				 
				<div class="form-group">
					<label class="reg_form">Id</label>
					<input type = "text" class="form-control" name = "id">
				</div>
				
				<div class="form-group">
					<label class="reg_form">Password</label>
					<input type = "password" class="form-control" name = "passwd">
				</div>
								
				<div class="form-group">
					<label class="reg_form">Identification Nr</label>
					<input type = "text" class="form-control" name = "ssn1" value= "${ssn1}" style="width:200px">
	 				<input type = "password" class="form-control" name = "ssn2" value = "${ssn2}" style="width:240px">
				</div>
				
				<div class="form-group">
					<label class="reg_form">Email</label>
					<input type = "text" class="form-control" name = "email">
				</div>		
				
				<div class="form-group">
					<label class="reg_form">Phone</label>
					<input type = "text" class="form-control" name = "hp1" size = "4" maxlength = "4"> -
	 						<input type = "text" class="form-control"  name = "hp2" size = "4" maxlength = "4"> - 
	 						<input type = "text" class="form-control" name = "hp3" size = "4" maxlength = "4">
				</div>	
				
				<div class="form-group">
					<label class="reg_form">Sex</label>
					<label><input type = "radio" class="form-control" name = "sex" value = "0">남자</label>
	 				<label><input type = "radio" class="form-control" name = "sex" value = "1">여자</label>
				</div>	
				
				<div class="col-sm-6">
					<input type="checkbox" class="checkbox" />Sign up for our newsletter
				</div>

				<div class="col-sm-6">
					<input type="checkbox" class="checkbox" />Send notifications to this email
				</div>	
			</form>
		</article>
	</div>			
			
			</div>
		
			<!-- <div class="col-md-6" style="display:inline;">
				<h3 class="dark-grey">Terms and Conditions</h3>
				<p>
					By clicking on "Register" you agree to The Company's' Terms and Conditions
				</p>
				<p>
					While rare, prices are subject to change based on exchange rate fluctuations - 
					should such a fluctuation happen, we may request an additional payment. You have the option to request a full refund or to pay the new price. (Paragraph 13.5.8)
				</p>
				<p>
					Should there be an error in the description or pricing of a product, we will provide you with a full refund (Paragraph 13.5.6)
				</p>
				<p>
					Acceptance of an order by us is dependent on our suppliers ability to provide the product. (Paragraph 13.5.6)
				</p>
			</div> -->
				<button type="submit" class="btn btn-primary">Register</button>
				<input type="button" value="확인" onclick="javascript:check()">
	 			<input type = "button" value = "다시쓰기" onclick = "javascript:reset()">
	 			<input type = "button" value = "취소" onclick = "window.location='main.do'">
			</div>
	</section>
</div>
</form>
</div>
	 			<%-- <table class = "outline" border = "1">
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
	 			</table> --%>
<%@ include file="../Basic/bottom_nav.jsp" %>