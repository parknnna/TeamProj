<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
<script>
$(document).ready(function(){
	$( "div > table" ).each(function( i ) {
	  
	  });
	
	
})
 $(function(){
       $(".tab ul li").click(function(){ 
           $(".tab ul li").removeClass('on');
           $(".tab .conBox").removeClass('on');
           $(this).addClass('on');
           $("#"+$(this).data('id')).addClass('on');
       });
   });
</script>
<style>
.tab{
    width:200px;
    height:auto;
    overflow:hidden;
}
 
.tab ul{
    padding:0;
    margin:0;
    list-style:none;
    width:100%:
    height:auto;
    overflow:hidden;
}
 
.tab ul li{
    display:inline-block;
    width:33.3333%;
    float:left;
    line-height:40px;
    text-align:center;
    cursor:pointer;
}
 
.tab ul li:hover,
.tab ul li.on{
    background:#ccc;
}
 
.tab .conBox{
    width:100%;
    height:auto;
    overflow:hidden;
    min-height:200px;
    background:#ccc;
    display:none;
    text-align:center;
}
 
.tab .conBox.on{
    display:block;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4 align="center">결제 내역서</h4>
<div align="center">
	<c:forEach var="dto" items="${h_resvdto}" varStatus="status">
	<table border="1" id="show${status.index}" class="conBox">
		<tr>
		<th>예약 날짜</th>
		<td>${dto.RESVDATE}</td>
		</tr>
		<tr>
		<th>체크 인<br>15:00</th>
		<td>${dto.START_RESV_DATE}</td>
		</tr>
		<tr>
		<th>체크 아웃<br>12:00</th>
		<td>${dto.END_RESV_DATE}</td>
		</tr>		
		<c:if test="${not empty droom_no}">
		<tr>
		<th>디럭스</th>
			<td>
			<c:forEach var="d" items="${droom_no}">
			${d} 호<br>
			</c:forEach>
			</td>
		</tr>
		</c:if>
		<c:if test="${not empty sroom_no}">
		<tr>
		<th>스탠다드</th>
			<td>
			<c:forEach var="s" items="${sroom_no}">
			${s} 호<br>
			</c:forEach>
			</td>
		</tr>
		</c:if>
		<c:if test="${not empty froom_no}">
		<tr>
		<th>패밀리</th>
			<td>
			<c:forEach var="f" items="${froom_no}">
			${f} 호<br>
			</c:forEach>
			</td>
		</tr>
		</c:if>
		<tr>
		<th>결제 금액</th>
		<td>${total}</td>
		</tr>
		<tr>
		<th>사용 포인트</th>
		<td>${dto.USE_POINT}</td>
		</tr>
		<tr>
		<th>지급 포인트</th>
		<td>${dto.SAVE_POINT}</td>
		</tr>
		<tr>
		<th>잔여 포인트</th>
		<td>${sedto.point}</td>
		</tr>
	</table>
	</c:forEach>
	<%-- <div class="tab">
		<ul>
		<c:forEach var="dto" items="${hrdto}" varStatus="status">
        <li data-id="con${status.index }" class="on">tab #1</li>
		</c:forEach>
		</ul>
	</div> --%>
</div>
</body>
</html>