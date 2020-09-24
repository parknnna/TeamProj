<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../Basic/head.jsp" %>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
	function check() {
		var start = f.start_resv_date.value;
		var end = f.end_resv_date.value;
		var date = new Date();
		var year = date.getFullYear(); //년도
		var month = date.getMonth() + 1; //월
		var day = date.getDate(); //일
		if ((day + "").length < 2) { // 일이 한자리 수인 경우 앞에 0을 붙여주기 위해
			day = "0" + day;
		}
		var today = year + "-" + month + "-" + day; // 오늘 날짜 (2017-02-07)
		if (start == "") {
			alert("입실 시작 날짜를 입력 해 주세요!!")
			return false;
		}
		if (end == "") {
			alert("퇴실 시작 날짜를  입력 해 주세요!!")
			return false;
		}
		if (start >= end) {
			alert("퇴실 날짜를 입실날짜 이후로 지정해주세요!!")
			return false;
		}
		var s = new Date(start);
		var t = new Date(today);
		if (s < t) {
			alert("이전 날짜는 예약할 수 없습니다.")
			return false;
		}
		return true;
	}
</script>
<%@ include file="../../Basic/top_Hotel.jsp" %>
	<div align="center" class="boxContainer" align="center" style="margin-top:100px">
		<form name="f" action="hotel_resvlist" onSubmit='return check();'>
			<table border="1">
				<tr>
					<th><label>지역</label></th>
					<td> <select name="address">
							<option value="서울" selected>서울</option>
							<option value="경기">경기</option>
							<option value="대전">대전</option>
							<option value="대구">대구</option>
							<option value="부산">부산</option>
							<option value="울산">울산</option>
							<option value="강원">강원</option>
							<option value="인천">인천</option>
					</select></td>
					<th><label>체크 인</label></th>
					<td> 
					<input type="date" name="start_resv_date" >
					</td>
					<th> 
					<label>체크 아웃</label>
					</th>
					<td> 
					<input type="date" name="end_resv_date" >
					</td>
					<th><label>객실</label></th>
					<td> 
						<select name="roomsu">
							<option value="1" selected>1개</option>
							<option value="2">2개</option>
							<option value="3">3개</option>
							<option value="4">4개</option>
							<option value="5">5개</option>
							<option value="6">6개</option>
							<option value="7">7개</option>
							<option value="8">8개</option>
							<option value="9">9개</option>
							<option value="10">10개</option>
					</select></td>
					<th><label>인원</label></th>
					<td><select name="sleeps">
							<option value="1">1명</option>
							<option value="2" selected>2명</option>
							<option value="3">3명</option>
							<option value="4">4명</option>
							<option value="5">5명</option>
							<option value="6">6명</option>
							<option value="7">7명</option>
							<option value="8">8명</option>
							<option value="9">9명</option>
							<option value="10">10명</option>
					</select></td>
					<th><label>&nbsp;</label></th>
					<td>
						<button type="submit">검색</button></td>
				</tr>
			</table>
		</form>
	</div>
<%@ include file="../../Basic/bottom_top.jsp" %>