<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../Basic/top_Bus.jsp" %>
<%@include file="../bus_main/top.jsp" %>
<style>
 table.type10 {
    border-collapse: collapse;
    font-family: "Trebuchet MS";
    font-weight:bold;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    margin: 20px 10px;
    font-size:15px;
    width:80%;
	}
	table.type10  th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    color: #fff;
    background: #c94dff;
    margin: 20px 10px;
	}
	table.type10 th {
    width: 150px;
    padding: 10px;
	}
	table.type10 td {
    width: 350px;
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


<div align="center" >
		<table border="1" class="type10" >
			<tr align="center">
				<th width="500">${get_busstation.station_name}</th>
			</tr>
			<tr height="200" align="center">
				<td><img src="${pageContext.request.contextPath}/resources/img/${get_busstation.filename}" width="1300" height="200"></td>
			</tr>
			
			<tr align="center">
				<td class="even">
				<a href="javascript:void(window.open('bus_station_info_map.do?station_name=${get_busstation.station_name}&address=${get_busstation.address}','${get_busstation.station_name}지도','width=500px, height=360px'))">
				${get_busstation.address}
				</a>
				
				</td>
			</tr>
		</table>
		
		<table border="1" class="type10">
			<h5>주변호텔</h5>	
			<c:if test="${empty hotel_list }">
				<tr>
				<td>주변에 호텔이 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${not empty hotel_list}">
			<tr align="center">
				<th>호텔이름</th>
				<th>호텔주소</th>
				<th>호텔전화번호</th>
				<th>성급</th>
				<th>사진</th>
				
			</tr>
			<c:forEach var="hdto" items="${hotel_list}">
				<c:set var="location" value="${pageContext.request.contextPath}/resources/img/${hdto.filename}"/>
				<tr align="center" class="even">
					<td>${hdto.name}</td>
					<td>${hdto.address}</td>
					<td>${hdto.hp1}-${hdto.hp2}-${hdto.hp3}</td>
					<c:if test="${hdto.filesize==0}">
					<td>사진없음</td>
					</c:if>
					<c:if test="${hdto.filesize!=0}">
					<c:if test="${hdto.star==1}">
						<td>★</td>
					</c:if>
					<c:if test="${hdto.star==2}">
						<td>★★</td>
					</c:if>
					<c:if test="${hdto.star==3}">
						<td>★★★</td>
					</c:if>
					<c:if test="${hdto.star==4}">
						<td>★★★★</td>
					</c:if>
					<c:if test="${hdto.star==5}">
						<td>★★★★★</td>
					</c:if>
					<c:if test="${hdto.star==6}">
						<td>★★★★★★</td>
					</c:if>
					<c:if test="${hdto.star==7}">
						<td>★★★★★★★</td>
					</c:if>
					<td><img src="${location}" width="100" height="50"></td>
					</c:if>
				</tr>
			</c:forEach>
			</c:if>
		</table>
		
		
</div>
<%@ include file="../../Basic/bottom_nav.jsp" %>