<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
alert("결제가 완료되었습니다. 내역 확인 페이지로 넘어갑니다.");
window.onload = function(){
	document.getElementById('f').submit();
}
</script>
<body>
<form id="f" action="hotel_paymentoklist">
<input type="hidden" name="total" value="${total}"/>
</form>
</body>
</html>