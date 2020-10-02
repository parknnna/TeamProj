<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../Basic/head.jsp" %>
<script type="text/javascript">
	function searchMember(mode){
		window.open("member_search.do?mode="+mode, "", "width=650, height=400")
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
		window.opener.location.reload();
		document.f.submit();
	}
</script>
<%@ include file="../../Basic/top_Login.jsp" %>
<div align="center" style="margin:50px auto 30px auto;">
	<div class="row" align="center" style="display:block;margin:0 auto;">
<div class="card" style="width:400px;margin:0 auto;box-shadow: 3px 3px 13px;">
<h4 class="card-title mb-4 mt-1" style="margin-top:1.25em !important">Welcome!</h4>
<article class="card-body">
		<form name="f" action="loginclearok" method="post">
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
		    	<a href="member_input.do" class="btn btn-outline-primary btn-block">Sign up</a>
		    </div>                                                       
</form>
</article>
</div> <!-- card.// -->
</div>
</div>
<%@ include file="../../Basic/bottom_top.jsp" %>