<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
var point = ${sedto.point}
alert("결제 취소가 완료되었습니다. 예약 내역 페이지로 넘어갑니다.\n"+"남은 포인트 : "+point);
window.onload = function(){
	document.getElementById('f').submit();
}
</script>
<body>
<form id="f" action="hotel_paymentoklist">
<input type="hidden" name="member_no" value="${sedto.member_no}"/>
</form>
</body>
</html>