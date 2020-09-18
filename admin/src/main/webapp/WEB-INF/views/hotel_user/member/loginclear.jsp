<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
        
<head>         
<title>로그인</title>

<script type="text/javascript">
	function searchMember(mode){
		window.open("search.do?mode="+mode,"", "width=650, height=400")
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
		//window.close();
	}
</script>
</head>
<%-- <%
		Cookie[] cks = request.getCookies();
		String value = null;
		if (cks != null && cks.length != 0){
			for(int i=0; i<cks.length; ++i){
				String name = cks[i].getName();
				if (name.equals("mbId")){
					value = cks[i].getValue();
					break;
				}
			}
		}
		 
%> --%>
<body>
<div align="center">
<br>
<img src="${pageContext.request.contextPath}/resources/img/bottom.gif" width=570 height="40" border="0" alt="">
<br>
<p>
<img src="${pageContext.request.contextPath}/resources/img/tm_login.gif" width=100 height="13" border="0" 
	align="center" ALT="회원 로그인">
<form name="f" action="loginclearok" method="post">
	<table width="60%" align="center" height="120" border="1">
		<tr>
			<td align="right" width="30%">
				<img src="${pageContext.request.contextPath}/resources/img/id01.gif" 
				width="28" height="11" border="0" alt="아이디">&nbsp;&nbsp;
			</td>
			<td width="40%">
			<c:if test="${value==null}">
				<input type="text" name="id" tabindex="1">
			</c:if>
			<c:if test="${value!=null}">
				<input type="text" name="id" tabindex="1" value="${value}">
			</c:if>
			</td>
			<td rowspan="2" width="30%" valign="middle">
				<a href="javascript:loginCheck()">
					<img src="${pageContext.request.contextPath}/resources/img/bt_login.gif" border="0" alt="로그인"  tabindex="3">&nbsp;&nbsp;<br>
				</a>
				<nobr>
				<c:if test="${value==null}">
					<input type="checkbox" name="saveId">
				</c:if>
				<c:if test="${value!=null}">
					<input type="checkbox" name="saveId" checked>
				</c:if>	
					<font face="굴림" size="2">아이디 기억하기</font>
				</nobr>
			</td>
		</tr>
		<tr>
			<td align="right">
				<img src="${pageContext.request.contextPath}/resources/img/pwd.gif" 
							width="37" height="11" alt="비밀번호">
			</td>
			<td>
				<input type="password" name="passwd"  tabindex="2">
			</td>
		</tr>
		<tr>
			<td colspan="3" align="center">
				<a href="memberSsn.do">
					<img src="${pageContext.request.contextPath}/resources/img/bt_join.gif" width="60" height="22" alt="회원가입" border="0">
				</a>	
				<a href="javascript:searchMember('id')">				
 					<img src="${pageContext.request.contextPath}/resources/img/bt_search_id.gif" width="60" height="22" alt="아이디 찾기">
				</a>
				<a href="javascript:searchMember('pw')">
					<img src="${pageContext.request.contextPath}/resources/img/bt_search_pw.gif" width="60" height="22" alt="비밀번호 찾기">
				</a>				
			</td>
		</tr>
	</table>
</form>
</div> 
</body>
</html>