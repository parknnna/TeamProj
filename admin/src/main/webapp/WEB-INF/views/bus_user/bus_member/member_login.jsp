<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	function searchMember(mode){
		window.open("member_search_resv.do?mode="+mode, "", "width=650, height=400")
	}
	function loginCheck(){
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
</script>
<%@ include file="../../Basic/top_Bus.jsp" %>
<div align="center" style="margin:50px auto 30px auto;">
	<div class="row" align="center" style="display:block;margin:0 auto;">
<div class="card" style="width:400px;margin:0 auto;box-shadow: 3px 3px 13px;">
<h4 class="card-title mb-4 mt-1" style="margin-top:1.25em !important">Welcome!</h4>
<article class="card-body">
		<form name="f" action="member_login_ok_resv.do" method="post">
			<!-- form-group//ID -->
    		<div class="form-group">
    			<a class="float-right" href="javascript:searchMember('id')">Forgot?</a>
    			<label style="float:left">ID</label>
    			<c:choose>
				<c:when test="${empty value}">
					<input type="text" name="id" tabindex="1" class="form-control" placeholder="ID">
				</c:when>
				<c:otherwise>
					<input type="text" name="id" tabindex="1" class="form-control" value = "${value}">	
				</c:otherwise>
				</c:choose>
   			</div> <!-- form-group//ID -->
   			
    
		    <div class="form-group">
		    	<a class="float-right" href="javascript:searchMember('passwd')">Forgot?</a>
		    	<label style="float:left">PASSWORD</label>
		    	<input class="form-control" placeholder="******" type="password" name="passwd" tabindex="2">
		    </div> <!-- form-group// --> 
		    
		    <div class="form-group"> 
			    <div class="checkbox">
			    <nobr>
					<c:choose>
						<c:when test="${empty value}">
							<input type="checkbox" name="saveId" style="top: 1.8px;position: relative;">
						</c:when>
						<c:otherwise>
							<input type = "checkbox" name = "saveId" style="top: 1.8px;position: relative;" checked>
						</c:otherwise>
					</c:choose>
						<font face="굴림" size="2">Save ID</font>
				</nobr>
			      <!-- <label> <input type="checkbox"> Save ID </label> -->
			    </div> <!-- checkbox .// -->
		    </div> <!-- form-group// -->  
		    
		    <div class="form-group">
		        <button type="submit" class="btn btn-primary btn-block" onclick="javascript:loginCheck()"> Login  </button>
		    </div> <!-- form-group// -->    
		    
		    <div class="form-group">
		    	<a href="member_input_resv.do" class="btn btn-outline-primary btn-block">Sign up</a>
		    </div>                                                       
</form>
</article>
</div> <!-- card.// -->
</div>
</div>
<%-- 

		<div class="form-group">
			<label style="float:left">ID</label>
			<c:choose>
			<c:when test="${empty value}">
				<input type="text" name="id" tabindex="1">
			</c:when>
			<c:otherwise>
				<input type="text" name="id" tabindex="1" value = "${value}">
			</c:otherwise>
			</c:choose>
		</div> <!-- form-group// -->
		<div class="form-group">
			<!-- <a class="float-right" href="#">Forgot?</a> 비밀번호 잃어버렸을때 -->
			<label style="float:left">PASSWORD</label>
			<input type="password" name="passwd" tabindex="2">
		</div> <!-- form-group// --> 
		<div class="form-group"> 
			<div class="checkbox">
				<nobr>
					<c:choose>
						<c:when test="${empty value}">
							<input type="checkbox" name="saveId">
						</c:when>
						<c:otherwise>
							<input type = "checkbox" name = "saveId" checked>
						</c:otherwise>
					</c:choose>
						<font face="굴림" size="2">아이디 기억하기</font>
				</nobr>
			</div> <!-- checkbox .// -->
		</div> <!-- form-group// -->  
		<div class="form-group">
			<button type="submit" class="btn btn-primary btn-block"> Login  </button>
		</div> <!-- form-group// -->     
		<div>
			<a href="member_input.do">Sign up</a>	
			<a href="javascript:searchMember('id')">Forgot ID</a>
			<a href="javascript:searchMember('passwd')">Forgot PASSWORD</a>	
		</div>                                                      
</div>
 --%>

<%-- 
	<table>
		<tr>
			<td align="right" width="30%">
				<i class="fas fa-user"></i>&nbsp;&nbsp;
			</td>
			<td width="40%">
			<c:choose>
			<c:when test="${empty value}">
				<input type="text" name="id" tabindex="1">
			</c:when>
			<c:otherwise>
				<input type="text" name="id" tabindex="1" value = "${value}">
			</c:otherwise>
			</c:choose>
			</td>
			
			<td rowspan="2" width="30%" valign="middle">
				<a href="javascript:loginCheck()">
					<i class="fas fa-sign-in-alt fa-lg"></i>&nbsp;&nbsp;<br>
				</a>
				<nobr>
					<c:choose>
						<c:when test="${empty value}">
							<input type="checkbox" name="saveId">
						</c:when>
						<c:otherwise>
							<input type = "checkbox" name = "saveId" checked>
						</c:otherwise>
					</c:choose>
						<font face="굴림" size="2">아이디 기억하기</font>
				</nobr>
			</td>
			
		</tr>
		<tr>
			<td align="right">
				<i class="fas fa-key"></i>&nbsp;&nbsp;
			</td>
			<td>
				<input type="password" name="passwd" tabindex="2">
			</td>
		</tr>
		<tr>
			<td colspan="3" align="center">
				<a href="member_input.do">
					<img src="${pageContext.request.contextPath}/resources/images/i.jpg" width="60" height="22" alt="회원가입" border="0">
				</a>	
				<a href="javascript:searchMember('id')">				
 					<img src="${pageContext.request.contextPath}/resources/images/im.jpg" width="60" height="22" alt="아이디 찾기">
				</a>
				<a href="javascript:searchMember('passwd')">
					<img src="${pageContext.request.contextPath}/resources/images/i.jpg" width="60" height="22" alt="비밀번호 찾기">
				</a>				
			</td>
		</tr>
	</table>
 --%>
<%@ include file="../../Basic/bottom_top.jsp" %>
