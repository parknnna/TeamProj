<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../Basic/top_Bus.jsp" %>
<%@include file="top.jsp" %>
<%@ page import="team.Dproject.main.model.*,java.util.*" %>
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
    font-size:30px;
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
<script type="text/javascript">
	function button_submit(){
		$(#button_submit).submit();
	}
</script>

<section class="ftco-section testimony-section bg-light">
    <div id="btn" align="center" style="width:100%">
       	<h3 style="font-family:Trebuchet MS; font-weight:bold;" >노선 검색</h3>
       	<form action="bus_mainOk.do" id="button_submit">
       		<c:forEach var="sdto" items="${slist}">
				<button  onclick="button_submit()" name="search" value="${sdto.station_no}">${sdto.station_name}</button>
			</c:forEach>
			
		</form>	
		<br><br>
				<c:if test="${size==0}">
					<table>
						<tr><th><h2>등록된 노선이 없습니다</h2></th></tr>
					</table>
				</c:if>				
       			<c:if test="${not empty brlist}"><!-- 버튼 클릭시에만 보이기 -->
       				<table class="type10">
       					<thead>
       					<tr  align="center">
       						<th>노선번호</th>
							<th>버스번호</th>
							<th>출발지</th>
							<th>도착지</th>
							<th>가격</th>	
							<th>출발시간</th>
							<th>도착시간</th>
       					</tr>
       					</thead>
       						
       					
       					<tbody>
       					<%List<BusRoadDTO_resv> brlist = (List<BusRoadDTO_resv>)request.getAttribute("brlist");
       					  int size=(Integer)request.getAttribute("size");
       					  
       					  for(int i=0; i<size; i++){
   							if(i%2==0){
       					%>
       					<tr align="center" class="even">
       					<%} %>
       					<% if(i%2==1){ %>
       					<tr align="center" class="none_even">
       					<%} %>
       						<td><%=brlist.get(i).getRoad_no()%></td>
       						<td><%=brlist.get(i).getBus_no()%></td>
       						<td><%=brlist.get(i).getArrival()%></td>
       						<td><%=brlist.get(i).getDeparture()%></td>
       						<td><%=brlist.get(i).getPrice()%></td>
       						<td><%=brlist.get(i).getArr_time()%>시</td>
       					<%
       						if(brlist.get(i).getTot_time()+brlist.get(i).getArr_time()>24){
       							
       					 %>
       					 	<td><%=brlist.get(i).getArr_time()+brlist.get(i).getTot_time()-24%>시</td>
       					 <%} %>
       					 <% if(brlist.get(i).getTot_time()+brlist.get(i).getArr_time()<=24){%>
       					 	<td><%=brlist.get(i).getArr_time()+brlist.get(i).getTot_time()%>시</td>
       					 <%}%>
       					</tr>
       					<%} %>
       					
       					</tbody>	
       				
       				</table>	
       			</c:if>
    <c:if test="${count>0}">
	<c:set var="startPage" value="${startPage}"/>
	<c:set var="endPage" value="${endPage}"/>
	<c:set var="pageBlock" value="${pageBlock}"/>
	<c:set var="pageCount" value="${pageCount}"/>
	<c:if test="${startPage>pageBlock}">
			[<a href="bus_mainOk.do?pageNum=${startPage-1}&search=${search}">이전</a>]		
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage }" step="1">
		[<a href="bus_mainOk.do?pageNum=${i}&search=${search}">${i}</a>]&nbsp&nbsp
	</c:forEach>
		<c:if test="${endPage<pageCount}">
			[<a href="bus_mainOk.do?pageNum=${endPage+1}&search=${search}">다음</a>]		
		</c:if>
	</c:if>	
	</div>
       			
   
      
      
 </section>

<%@ include file="../../Basic/bottom_nav.jsp" %>

	
