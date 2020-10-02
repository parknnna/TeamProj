<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#btn button{
		border:0;
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
	#btn a{
		font-family: "Trebuchet MS";
		font-size:25px;
   	 	font-weight:bold;
	}
	#btn button:hover{
		color:white;
		background-color:#c94dff;
		}
		
	table.type10 {
    border-collapse: collapse;
    font-family: "Trebuchet MS";
    font-weight:bold;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    margin: 20px 10px;
    font-size:20px;
	}
	table.type10 thead th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background: #c94dff;
    margin: 20px 10px;
	}
	table.type10 tbody th {
    width: 150px;
    padding: 10px;
	}
	table.type10 td {
    width: 300px;
    padding: 10px;
    vertical-align: top;
	}
	table.type10 .even {
    background: #fdf3f5;
    font-size:20px;
	}
	table.type10 .none_even {
    
    font-size:20px;
	}
</style>

<%@ include file="../../Basic/top_Bus.jsp" %>
<%@include file="../bus_main/top.jsp" %>


	<div class="infoContainer" align="center">
		<div>
		<h3>터미널 정보</h3>
		</div>
		<div>
		<c:if test="${empty bus_station_list}">
			등록된 터미널 정보가 없습니다.
		</c:if>
		
		<c:forEach var="dto" items="${bus_station_list}">	
			<c:set var="Path" value="${pageContext.request.contextPath}/resources/img/${dto.filename}"/>
			
		<div  style=" float: left; width: 33%; font-family: Trebuchet MS;">
		<table border="1" style="width:80%; ">
			<tr align="center" height="50">
				<th width="200" style="background-color:#E6E6E6">
					
					<a href="bus_station_info_detail.do?station_no=${dto.station_no}">${dto.station_name}</a>
					
				</th>
			</tr>
			<c:if test="${dto.filesize != 0}">
				<tr align="center" height="70">	
					<td>
						<a href="javascript:void(window.open('bus_station_info_map.do?station_name=${dto.station_name}&address=${dto.address}','${dto.station_name}지도','width=500px, height=360px'))">
							<img src="${Path}" width="400" height="100">
						</a>
						
					</td>
				</tr>
			</c:if>
			<c:if test="${empty dto.filesize}">
				<tr align="center">	
					<td>사진을 첨가해주세요</td>
				</tr>
			</c:if>
			<tr align="center" style="background-color:#E6E6E6">
				<td>${dto.address}</td>
			</tr>
			<c:if test="${count%1==0}">
				<tr></tr>
			</c:if>
		</table>
		<br>
		</div>	
		</c:forEach>
		</div>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@ include file="../../Basic/bottom_nav.jsp" %>
