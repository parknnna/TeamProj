<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>호텔정보수정</title>
</head>
<body>
<form action="hotelupdateok" method="post" enctype="multipart/form-data">
	<table width="600" align="center" class="outline" border="1">
		<tr>
			<td>호텔 이름</td>
			<td><input type="text" name="name" value="${dto.name}"></td>
		</tr>
		<tr>
		<td>주소</td>
		<td><input type="text" name="address" value="${dto.address}"></td>
		</tr>
		<tr>
		<td width="150">호텔 연락처</td>
					<td>
						<input type="text" name="hp1" class="box"
													size="3" maxlength="3" value="${dto.hp1}"> -
						<input type="text" name="hp2" class="box"
													size="4" maxlength="4" value="${dto.hp2}"> -
						<input type="text" name="hp3" class="box"
													size="4" maxlength="4" value="${dto.hp3}">
					</td>
		</tr>
		<tr>
		<td>호텔 MANAGER 번호</td>
		<td><input type="text" name="member_num" value="${dto.member_num}"></td>
		</tr>
		<tr>
		<td>호텔 정보</td>
		<td><textarea rows="6" cols="30" name="hotel_info">${dto.hotel_info}</textarea></td>
		</tr>
		<tr>
		<td>호텔 성급</td>
		<td><input type="text" name="star" value="${dto.star}"></td>
		</tr>
		<tr>
		<td>호텔사진</td>
		<td><input type="file" name="filename" value="${dto.filename}"></td>
		</tr>
		<tr>
		<td colspan="2" align="right"><input type="submit" value="수정"></td>
		</tr>
	</table>
</form>
</body>
</html>