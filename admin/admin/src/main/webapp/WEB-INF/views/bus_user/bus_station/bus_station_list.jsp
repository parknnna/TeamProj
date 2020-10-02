
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../Basic/top_Bus.jsp" %>
<%@include file="../bus_main/top.jsp" %>
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
	table.type10 th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background: #c94dff;
    margin: 20px 10px;
	}
	table.type10  th {
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
    font-size:15px;
	}
	table.type10 .none_even {
    
    font-size:20px;
	}
</style>
	<div align="center">
		
		<table style="width:90%; font-size:20px; font-weight:bold;">
			<tr align="right">
				<td colspan="5">
					<a href="bus_station_insert.do">추가</a>
				</td>
			</tr>
		</table>
		<table width="100%" border="1" class="type10">
			<tr align="center">
				<th>터미널번호</th>
				<th>터미널이름</td>
				<th>터미널주소</th>
				<th>파일</th>
				<th>수정/삭제</th>
			</tr> 
			<c:if test="${empty bus_station_list}">
				<tr>
					<td colspan="5">등록된 버스가 없습니다.</td>
				</tr>	
			</c:if>
			<c:forEach var="dto" items="${bus_station_list}">
			<c:set var="location" value="${pageContext.request.contextPath}/resources/img/${dto.filename}"/>			
			<tr align="center" class="even">
				<td>${dto.station_no}</td>
				<td>${dto.station_name}</td>
				<td>${dto.address}</td>
			<c:if test="${dto.filesize != 0}">
			<td>
				<img src="${location}" width="50" height="50">
			</td>
		</c:if>
		<c:if test="${dto.filesize == 0}">
			<td></td>
		</c:if>	
				<td>
					<a href="bus_station_update.do?no=${dto.station_no}">수정</a> | 
					<a href="bus_station_delete.do?no=${dto.station_no}">삭제</a>
				</td>
			</tr>	
			</c:forEach>
		</table>	
	</div>
<%@ include file="../../Basic/bottom_nav.jsp" %>