<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function setParentText() {
		opener.document.getElementById("fileH").value = document.getElementById("file").value;
		opener.document.getElementById("fileH").change();
	}
</script>
</head>

<body>
<form action="fileup.do" enctype="multipart/form-data" method="post">
	<input type="file" id="file" name="filename" >
	<input type="submit" value="전달하기" >
</form>

</body>
</html>