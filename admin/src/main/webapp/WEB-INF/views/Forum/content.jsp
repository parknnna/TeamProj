<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../Basic/head.jsp" %>
<body>
<%@ include file="../Basic/nav_Forum.jsp" %>
<!-- END nav -->

<div>

	<div style="margin-top:100px;width:60%;" align="left">
		<span><img src="${pageContext.request.contextPath}/resources/images/usericon.png" width="30" height="25"></span>
		<span>
			글쓴이 아이디를 어떻게 가져오지?
		</span>
	</div>
	
	<div>
	
	</div>
	
	<div style="margin-top:10px;width:60%">
		<textarea rows="5" cols="90" readOnly>${getBoard.content}</textarea>
	</div>
	
	<div>
		<span><i class="fas fa-chevron-left" style="font-size:1.5em;"></i></span>
		<span><i class="fas fa-bars" style="font-size:1.5em;"></i></span>
		<span><i class="fas fa-chevron-right" style="font-size:1.5em;"></i></span>
	</div>
	
</div>


<%@ include file="../Basic/bottom.jsp"%>
