<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../../Basic/top_Bus.jsp" %>
 <%@ include file="../bus_main/top.jsp" %>
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
	}
	table.type10  th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    color: #fff;
    background: #c94dff;
    margin: 20px 10px;
	}
	table.type10 tbody th {
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
  <div align="center">
 	<c:if test="${mode eq 'oneway'}">
 	<table class="type10">
 	
 	<tr align="center">
 		<td colspan="9" style="font-size:30px;">${one_date}</td>

 	</tr>
 	<tr align="center">
 		
 		<th>노선번호</th>
 		<th>출발지</th>
 		<th>도착지</th>
 		<th>등급</th>
 		<th>가격</th>
 		<th>출발시간</th>
 		<th>도착시간</th>
 		<th>좌석수</th>
 		<th>예약</th>
 		
 	</tr>
 	
 	<c:if test="${empty dispatch_list}">
 	<tr align="center">
 		<td colspan="9">해당되는 배차정보가 없습니다</td>
 	</tr>
 	</c:if>
 	<c:forEach var="list" items="${dispatch_list}">
 		<tr align="center">
 			<td>${list.road_no}</td>
 			<td>${list.arrival}</td>
 			<td>${list.departure}</td>
 			<td>${list.grade}</td>
 			<td>${list.price}</td>
 			<td>${list.arr_time}시</td>
 			<c:if test="${list.tot_time+list.arr_time>24}">
 				<td>${list.tot_time+list.arr_time-24}시</td>
 			</c:if>
 			<c:if test="${list.tot_time+list.arr_time<=24}">
 				<td>${list.tot_time+list.arr_time}시</td>
 			</c:if>
 			<td>${list.seat}</td>
 			<td><a href="<c:url value="bus_resv_user_seat.do">
 			<c:param name="one_date" value="${one_date}"></c:param>
 			<c:param name="road_no" value="${list.road_no}"></c:param>
 			<c:param name="mode" value="${mode}"></c:param>
 			<c:param name="arrival" value="${list.arrival}"></c:param>
 			<c:param name="departure" value="${list.departure}">
 			</c:param></c:url>">예약</a></td>
 		</tr>
 	</c:forEach>
 	

 	</table>
 	<c:if test="${count>0}">
	<c:set var="startPage" value="${startPage}"/>
	<c:set var="endPage" value="${endPage}"/>
	<c:set var="pageBlock" value="${pageBlock}"/>
	<c:set var="pageCount" value="${pageCount}"/>
	<c:if test="${startPage>pageBlock}">
			[<a href="bus_resv_user_dispatch.do?pageNum=${startPage-1}&mode=${mode}&arrival=${arrival}&departure=${departure}&one_date=${one_date}&two_date=&grade=${grade}">이전</a>]		
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage }" step="1">
		[<a href="bus_resv_user_dispatch.do?pageNum=${i}&mode=${mode}&arrival=${arrival}&departure=${departure}&one_date=${one_date}&two_date=&grade=${grade}">${i}</a>]
	</c:forEach>
		<c:if test="${endPage<pageCount}">
			[<a href="bus_resv_user_dispatch.do?pageNum=${endPage+1}&mode=${mode}&arrival=${arrival}&departure=${departure}&one_date=${one_date}&two_date=&grade=${grade}">다음</a>]		
		</c:if>
	</c:if>
 	</c:if>
 	<!-- 페이지 이전? 다음? -->
 	
 	
 </div>
 	

<c:if test="${mode eq 'twoway'}">

	 <div align="center" style="display: inline-block;">
 		<table border="1">
 			<tr align="center">
 				<td colspan="9">${arr_date}</td>
 			</tr>
 			<tr align="center">
 				<th>노선번호</th>
 				<th>출발지</th>
 				<th>도착지</th>
 				<th>등급</th>
 				<th>가격</th>
 				<th>출발시간</th>
 				<th>도착시간</th>
 				<th>좌석수</th>
 				<th>예약</th>
 			</tr>
 			<c:if test="${empty arr_dispatch_list}">
 			<tr>
 				<td colspan="9">해당되는 배차정보가 없습니다</td>
 			</tr>
 			</c:if>
 			<c:forEach var="arr_list" items="${arr_dispatch_list}">
 				<tr align="center">
		 			<td>${arr_list.road_no}</td>
		 			<td>${arr_list.arrival}</td>
		 			<td>${arr_list.departure}</td>
		 			<td>${arr_list.grade}</td>
		 			<td>${arr_list.price}</td>
		 			<td>${arr_list.arr_time}시</td>
		 			<c:if test="${arr_list.tot_time+arr_list.arr_time>24}">
		 				<td>${arr_list.tot_time+arr_list.arr_time-24}시</td>
		 			</c:if>
		 			<c:if test="${arr_list.tot_time+arr_list.arr_time<=24}">
		 				<td>${arr_list.tot_time + arr_list.arr_time}시</td>
		 			</c:if>
		 			<td>${arr_list.seat}</td>
		 			<td><a href="<c:url value="bus_resv_user_arr_seat.do">
 						<c:param name="arr_date" value="${arr_date}"></c:param>
 						<c:param name="dep_date" value="${dep_date}"></c:param>
 						<c:param name="one_date" value=""></c:param>
 						<c:param name="mode" value="${mode}"></c:param>
 						<c:param name="road_no" value="${arr_list.road_no}"></c:param>
 						<c:param name="arrival_name" value="${arr_list.arrival}"></c:param>
 						<c:param name="departure_name" value="${arr_list.departure}"></c:param>
 						<c:param name="arrival" value="${arrival}"></c:param>
 						<c:param name="departure" value="${departure}"></c:param>
 						<c:param name="grade" value="${grade}"></c:param>
 						</c:url>">예약</a></td>
 				</tr>
 			</c:forEach>
 			
 		</table>
	 <c:if test="${count>0}">
	<c:set var="startPage" value="${startPage}"/>
	<c:set var="endPage" value="${endPage}"/>
	<c:set var="pageBlock" value="${pageBlock}"/>
	<c:set var="pageCount" value="${pageCount}"/>
	<c:if test="${startPage>pageBlock}">
			[<a href="bus_resv_user_dispatch.do?pageNum=${startPage-1}&mode=${mode}&arrival=${arrival}&departure=${departure}&one_date=&arr_date=${arr_date}&dep_date=${dep_date}&grade=${grade}">이전</a>]		
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage }" step="1">
		[<a href="bus_resv_user_dispatch.do?pageNum=${i}&mode=${mode}&arrival=${arrival}&departure=${departure}&one_date=&arr_date=${arr_date}&dep_date=${dep_date}&grade=${grade}">${i}</a>]
	</c:forEach>
		<c:if test="${endPage<pageCount}">
			[<a href="bus_resv_user_dispatch.do?pageNum=${endPage+1}&mode=${mode}&arrival=${arrival}&departure=${departure}&one_date=&arr_date=${arr_date}&dep_date=${dep_date}&grade=${grade}">다음</a>]		
		</c:if>
	</c:if>
	 </div>
 


 	<div align="center" style="display: inline-block">
 		<table border="1">
 			<tr align="center">
 				<td colspan="9">${dep_date}</td>
 			</tr>
 			<tr align="center">
 				<th>노선번호</th>
 				<th>출발지</th>
 				<th>도착지</th>
 				<th>등급</th>
 				<th>가격</th>
 				<th>출발시간</th>
 				<th>도착시간</th>
 				<th>좌석수</th>
 				<th>예약</th>
 			</tr>
 			<c:if test="${empty dep_dispatch_list}">
 			<tr align="center">
 				<td colspan="9">해당되는 배차정보가 없습니다</td>
 			</tr>
 			</c:if>
 			<c:forEach var="dep_list" items="${dep_dispatch_list}">
 				<tr align="center">
		 			<td>${dep_list.road_no}</td>
		 			<td>${dep_list.arrival}</td>
		 			<td>${dep_list.departure}</td>
		 			<td>${dep_list.grade}</td>
		 			<td>${dep_list.price}원</td>
		 			<td>${dep_list.arr_time}시</td>
		 			<c:if test="${dep_list.tot_time+dep_list.arr_time>24}">
		 				<td>${dep_list.tot_time+dep_list.arr_time-24}시</td>
		 			</c:if>
		 			<c:if test="${dep_list.tot_time+dep_list.arr_time<=24}">
		 				<td>${dep_list.tot_time+dep_list.arr_time}시</td>
		 			</c:if>
		 			<td>${dep_list.seat}</td>
		 			<td><a href="<c:url value="bus_resv_user_dep_seat.do">
 						<c:param name="arr_date" value="${arr_date}"></c:param>
 						<c:param name="dep_date" value="${dep_date}"></c:param>
 						<c:param name="one_date" value=""></c:param>
 						<c:param name="mode" value="${mode}"></c:param>
 						<c:param name="road_no" value="${dep_list.road_no}"></c:param>
 						<c:param name="arrival_name" value="${dep_list.arrival}"></c:param>
 						<c:param name="departure_name" value="${dep_list.departure}"></c:param>
 						<c:param name="arrival" value="${arrival}"></c:param>
 						<c:param name="departure" value="${departure}"></c:param>
 						<c:param name="grade" value="${grade}"></c:param>
 						</c:url>">예약</a></td>
 				</tr>
 			</c:forEach>
 		</table>
 	<c:if test="${count2>0}">
	<c:set var="startPage2" value="${startPage2}"/>
	<c:set var="endPage2" value="${endPage2}"/>
	<c:set var="pageBlock2" value="${pageBlock2}"/>
	<c:set var="pageCount2" value="${pageCount2}"/>
	<c:if test="${startPage>pageBlock}">
			[<a href="bus_resv_user_dispatch.do?pageNum2=${startPage2-1}&mode=${mode}&arrival=${arrival}&departure=${departure}&one_date=&arr_date=${arr_date}&dep_date=${dep_date}&grade=${grade}">이전</a>]		
	</c:if>
	<c:forEach var="j" begin="${startPage2}" end="${endPage2}" step="1">
		[<a href="bus_resv_user_dispatch.do?pageNum2=${j}&mode=${mode}&arrival=${arrival}&departure=${departure}&one_date=&arr_date=${arr_date}&dep_date=${dep_date}&grade=${grade}">${j}</a>]
	</c:forEach>
		<c:if test="${endPage2<pageCount2}">
			[<a href="bus_resv_user_dispatch.do?pageNum2=${endPage2+1}&mode=${mode}&arrival=${arrival}&departure=${departure}&one_date=&arr_date=${arr_date}&dep_date=${dep_date}&grade=${grade}">다음</a>]		
		</c:if>
	</c:if>
 	</div>
 	
 </c:if>
<%@ include file="../../Basic/bottom_nav.jsp" %>
