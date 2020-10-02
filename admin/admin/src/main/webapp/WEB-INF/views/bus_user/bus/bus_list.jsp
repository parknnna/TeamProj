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
	<div align="center">
		<table width="60%" width="800">
			<tr align="right">
				<td colspan="4">
					<a href="bus_insert.do" style="font-weight:bold; font-size:20px;">버스 추가</a>
				</td>
			</tr>
		</table>
		<table border="1"  width="800" class="type10">
			<tr height="10%" align="center" style="background-color:#F2F2F2;">
				<td>버스번호</td>
				<td>버스등급</td>
				<td>버스좌석수</td>
				<td>수정/삭제</td>
			</tr> 
			<c:if test="${empty bus_list}">
				<tr height="10%">
					<td colspan="4">등록된 버스가 없습니다.</td>
				</tr>	
			</c:if>
			<c:forEach var="dto" items="${bus_list}">			
			<tr align="center">
				<td>${dto.bus_no}</td>
				<td>${dto.grade}</td>
				<td>${dto.seat}</td>
				<td>
					<a href="bus_update.do?no=${dto.bus_no}">수정</a> | 
					<a href="bus_delete.do?no=${dto.bus_no}">삭제</a>
				</td>
			</tr>	
			</c:forEach>
		</table>
	<!-- 페이지 이전? 다음? -->
	<c:if test="${count>0}">
	<c:set var="startPage" value="${startPage}"/>
	<c:set var="endPage" value="${endPage}"/>
	<c:set var="pageBlock" value="${pageBlock}"/>
	<c:set var="pageCount" value="${pageCount}"/>
	<c:if test="${startPage>pageBlock}">
			[<a href="bus_list.do?pageNum=${startPage-1}">이전</a>]		
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage }" step="1">
		[<a href="bus_list.do?pageNum=${i}">${i}</a>]
	</c:forEach>
		<c:if test="${endPage<pageCount}">
			[<a href="bus_list.do?pageNum=${endPage+1}">다음</a>]		
		</c:if>
	</c:if>		
	</div>
<%@ include file="../../Basic/bottom_nav.jsp" %>