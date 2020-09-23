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
		.form-control{
			margin-bottom:20px;
		}
		
		input{
			padding:10px;
		}
		
		.idn-wrap{
			display:table;
			width:100%;
		}
		
		.tel-wrap{
			display:table;
			width:100%;
		}
		
		div .first-ssn .second-ssn{
			display: table-cell;
		    table-layout: fixed;
		    width: 200px;
		    vertical-align: middle;
		    float: left;
    		margin: 0 0 10px 0;
    		margin-right: 10px;
		}
		
		div .first-tel .second-tel .third-tel{
			display: table-cell;
		    table-layout: fixed;
		    width: 200px;
		    vertical-align: middle;
		    float: left;
    		margin: 0 0 10px 0;
    		margin-right: 10px;
		}
		
		.category{
			float: left;
		    font-size: 15px;
		    width: 100%;
		    margin-bottom:0;
		}
		
		.check-btn{
			margin-top:10px;
			margin-bottom:10px;
		}
		
		
	</style>
<%@ include file="../Basic/nav_Login.jsp" %>
<div align="center" style="margin:90px auto 30px auto;">
	<div class="row" align="center" style="display:block;margin:0 auto;">
<div class="card" style="width:700px;margin:0 auto;border:none;">
<h3 class="dark-grey" style="margin-top:10px">Registration</h3>
<article class="card-body">
	<form name = "f" action = "member_input_ok.do" method = "post" style="width:80%;"  enctype="multipart/form-data">
 
				<div class="form-wrap">
					<h6 class="category">
						<label class="reg_form" style="float:left">Name</label>
					</h6>
					<div class="name">
						<input type = "text" class="form-control" name = "name" value = "${name}">
					</div>
				</div>
				 
				<div class="form-wrap">
					<h6 class="category">
						<label class="reg_form"  style="float:left">Id</label>
					</h6>
					<div class="id">
						<input type = "text" class="form-control" name = "id">
					</div>
				</div>
				
				<div class="form-wrap">
					<h6 class="category">
						<label class="reg_form"  style="float:left">Password</label>
					</h6>
					<div class="pwd">
						<input type = "password" class="form-control" name = "passwd">
					</div>
				</div>
								
				<div class="form-wrap">
					<h6 class="category">
						<label class="reg_form"  style="float:left" >Identification Nr</label>
					</h6>
					<div class="idn-wrap">
						<div class="first-ssn" style="float:left">
							<input type = "text" class="form-control" name = "ssn1" value= "${ssn1}" maxlength ="6" style="width:250px">
						</div>
						<div class="second-ssn" style="float:right">
	 						<input type = "password" class="form-control" name = "ssn2" value = "${ssn2}"  maxlength ="7" style="width:260px">
						</div>
					</div>
				</div>
				
				<div class="form-wrap">
					<h6 class="category">
						<label class="reg_form" style="float:left">Email</label>
					</h6>
					<div class="email">
						<input type = "text" class="form-control" name = "email">
					</div>		
				</div>		
				
				<div class="form-wrap">
					<h6 class="category">
						<label class="reg_form"  style="float:left">Phone</label>
					</h6>
					<div class="tel-wrap">
						<div class="first-tel" style="float:left">
							<input type = "text" class="form-control" name = "hp1" size = "4" maxlength = "4" style="width:160px;margin-right:13px;">
						</div>
						<div class="second-tel" style="float:left">
							<input type = "text" class="form-control"  name = "hp2" size = "4" maxlength = "4" style="width:170px;">
						</div>
						<div class="third-tel" style="float:right">
							<input type = "text" class="form-control" name = "hp3" size = "4" maxlength = "4" style="width:170px;">
						</div>
					</div>
							
				</div>	
				
				<div class="form-wrap">
					<h6 class="category">
						<label class="reg_form"  style="float:left">Sex</label>
					</h6>
					<div class="sex-wrap">
						<select name="sex" class="form-control" style="padding:10px;">
							<option value selected>성별</option>
							<option value="0">남자</option>
							<option value="1">여자</option>
						</select>
					</div>
				</div>	
				
				<div class="form-wrap">
					<h6 class="category">
						<label class="reg_form" style="float:left">Profile</label>
					</h6>
					<div class="img-wrap">
						프로필 사진을 선택해주세요. <input type = "file" name = "filename">
					</div>
				</div>
				
				<div class="col-sm-6" style="float:left">
					<input type="checkbox" class="checkbox" />Sign up for our newsletter
				</div>

				<div class="col-sm-6" style="float:left;padding-left:0">
					<input type="checkbox" class="checkbox" />Send notifications to this email
				</div>	
			</form>
		</article>
	</div>			
			
			</div>
			
			<div class="check-btn">
				<button type="submit" class="btn btn-primary" onclick="javascript:check()" style="margin-right:20px;">Register</button>
				<button type="reset" class="btn btn-primary" onclick="javascript:reset()" style="margin-right:20px;">Reset</button>
				<button type="back" class="btn btn-primary" onclick="window.location='index'" style="margin-right:20px;">Cancel</button>
			</div>
	</section>
</div>
</form>
</div>
<%@ include file="../Basic/bottom_nav.jsp" %>