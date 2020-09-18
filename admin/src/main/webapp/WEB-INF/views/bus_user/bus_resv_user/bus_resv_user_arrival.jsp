<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#btn button{
		border:1;
		font-size:18px;
		background-color:rgba(0,0,0,0);
		color:#c94dff;
		padding:5px;
		font-family: "Trebuchet MS";
		border-top-left-radius: 3px;
  		border-top-right-radius: 5px;
   		border-bottom-right-radius: 8px;
   		border-bottom-left-radius: 10px;
		
		}

	#btn button:hover{
		color:white;
		background-color:#c94dff;
		}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>출발지 도착지 선택</title>
</head>

<script>
function check(){
	if(f.arrival.value==""){
		
		return
	}
	document.f.submit()
}
function page(){

	
	window.opener.location.href = window.opener.document.URL;


	
}




  

</script>
<body>

	<div>
		<div align="center"style="width:100%; float:center;">
			<div align="center" style="width:100%; folat:center; background:#CEECF5";><h2>출발지선택</h2></div>
				<div align="center"  style="width:100%; folat:center;">
					<form action="resv_user_arrival_find.do">
					<table border="1">
						<tr>
							<td>
								검색<input type="text" name="searchString" size="40">
								<input type="submit" value="찾기">
							</td>
						</tr>
					</table>
					</form>
				</div><!-- 검색 -->
				<br><br>
			<form  id="f" action="bus_resv_user_arrival.do" method="post">
				<div align="center" style="width:50%;  background:#EFF5FB;">
					<table border="1">
						<tr>
							<td width="4000">출발지:
							<c:if test="${empty arr_dto.station_name}">
								<input type="hidden" name="arrival" value="">
							</c:if>	
								<c:if test="${not empty arr_dto.station_name}">
									<input type="hidden" name="arrival" value="${arr_dto.station_name}">${arr_dto.station_name}
									
								</c:if>
							</td>
							
						</tr>
					</table>
				</div><!-- 출발지 -->
		

				
				<div align="center" id="btn">
						<h3>출발지</h3>
					
						<c:if test="${not empty find_station}">
							<c:forEach var="list" items="${find_station}">
								
									<button  onclick="javascript:location.href='bus_resv_user_arrival_select.do?arrival=${list.station_no}'" value="${list.station_name}"></button>
								
							</c:forEach>
						</c:if>
						<c:forEach var="dto" items="${bus_station_list}">
						
						
							
							<input type="button" onclick="javascript:location.href='bus_resv_user_arrival_select.do?arrival=${dto.station_no}'"  value="${dto.station_name}" style="width:100%;">
						
						</c:forEach>
						<br><br>
					<input type="submit"  value="선택" style="height:30px; width:100px;" onclick="page()" >
				</div><!-- 터미널 출발지 버튼 -->
				
				
			</form>
		</div>
	</div>
</body>
</html>
