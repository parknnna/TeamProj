<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>룸 정보입력</title>
</head>
<body>
<form action="roominsertok?hotel_no=${hotel_no}" method="post" enctype="multipart/form-data">
	<table width="600" align="center" class="outline" border="1">
		<tr>
			<td>룸</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
		<td>룸 평수</td>
		<td><input type="text" name="roomsize"></td>
		</tr>
		<tr>
		<td>정원</td>
		<td><input type="text" name="sleeps"></td>
		</tr>
		<tr>
		<td>가격</td>
		<td><input type="text" name="price"></td>
		</tr>
		<tr>
		<td>룸 정보</td>
		<td><textarea rows="6" cols="30" name="item"></textarea></td>
		</tr>
		<tr>
		<td>룸 사진</td>
		<td>
		<!-- <input multiple="multiple" type="file" name="file"> -->
		<input multiple="multiple" type="file" name="filename" />
		</td>
		</tr>
		<tr>
		<td>룸 수</td>
		<td><input type="text" name="rooms"></td>
		</tr>
		<tr>
		
		<th><label>객실 유형</label></th>
					<td><select name="grade">
							<option value="1">디럭스</option>
							<option value="2">스탠다드</option>
							<option value="3">패밀리</option>
					</select>
		</td>
		</tr>
		<tr>
		<td colspan="2" align="right"><input type="submit" value="전송"></td>
		</tr>
	</table>
</form>
</body>
</html>