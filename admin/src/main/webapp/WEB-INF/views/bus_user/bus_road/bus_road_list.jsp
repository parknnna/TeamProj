<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<%@ include file="../bus_main/top.jsp" %>
<%

%>
	<div align="center">
		<table width="800">
						<tr align="right">
				<td colspan="8">
					<a href="bus_road_insert.do">추가</a>
				</td>
			</tr>
		</table>
		<table width="100%" border="1">
			<tr>
				<th>노선번호</th>
				<th>버스번호</th>
				<th>노선 등록 회원</th>
				<th>출발지</th>
				<th>도착지</th>
				<th>가격</th>
				<th>출발시간</th>
				<th>도착시간</th>
				<th>수정/삭제</th>
			</tr> 
			<c:if test="${empty listBus_road}">
				<tr>
					<td colspan="9">등록된 노선이 없습니다.</td>
				</tr>	
			</c:if>
			<c:forEach var="dto" items="${listBus_road}">			
			<tr align="center">
				<td>${dto.road_no}</td>
				<td>${dto.bus_no}</td>
				<td>${dto.name}</td>
				<td>${dto.arrival}</td>
				<td>${dto.departure}</td>
				<td>${dto.price}</td>
				<td>${dto.arr_time}시</td>
				<c:if test="${dto.tot_time+dto.arr_time>24}">
					<td>${dto.arr_time+dto.tot_time-24}시</td>
				</c:if>
				<c:if test="${dto.tot_time+dto.arr_time<=24}">
					<td>${dto.tot_time+dto.arr_time}시</td>
				</c:if>
				<td>
					<c:if test="${sedto.position==0}"><!-- 슈퍼 관리자 수정삭제 범위(전체) -->
						<a href="bus_road_update.do?no=${dto.road_no}">수정</a> | 
						<a href="bus_road_delete.do?no=${dto.road_no}">삭제</a>
					</c:if>
					<c:if test="${sedto.position==1}"><!-- 버스관리자 수정삭제 범위 (버스관리자만)-->
						<c:if test="${dto.name==sedto.name}">
							<a href="bus_road_update.do?no=${dto.road_no}">수정</a> | 
							<a href="bus_road_delete.do?no=${dto.road_no}">삭제</a>
						</c:if>
					</c:if>
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
			[<a href="bus_road_list.do?pageNum=${startPage-1}">이전</a>]		
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage }" step="1">
		[<a href="bus_road_list.do?pageNum=${i}">${i}</a>]
	</c:forEach>
		<c:if test="${endPage<pageCount}">
			[<a href="bus_road_list.do?pageNum=${endPage+1}">다음</a>]		
		</c:if>
	</c:if>	
	</div>
<%@ include file="../bus_main/bottom.jsp" %> 