
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<script type="text/javascript">
	function check(){
		if (f.arrival.value==f.departure.value){
				alert("출발지와 도착지가 같을순 없습니다")
				f.departure.focus()
				return
			}
			if (f.arr_time.value=="선택"){
				alert("출발시간을 입력해주세요")
				f.arr_time.focus()
				return
			}
			if (f.tot_time.value=="선택"){
				alert("소요 시간을 입력해주세요")
				f.tot_time.focus()
				return
			}
			
			document.f.submit()
		}
		function reset(){
			document.f.reset()
			
		}
		function dip_OnOff(v,id){// 복수 추가시 배차시간 보이게 하는 스크립트
		if(v=="plural"){
			document.getElementById(id).style.display=""; //보이기
		}else{
			document.getElementById(id).style.display="none"//안보이기
		}
		}
		</script>

<%@ include file="../bus_main/top.jsp" %>
	<div align="center">
		<form name="f" action="bus_road_insert.do" method="post">
			<h4>
				*가격책정 방식*
			</h4>
			<h5>->일반:기본요금=5000원  x 소요시간</h5>
			<h5>->우등:기본요금=8000원 x 소요시간</h5>
			<table width="50%" border="1">
				<tr align="center">
				<td>
					<input  type="radio" name="plus" value="singular" onclick="dip_OnOff(this.value,'dip');" checked>단일추가
					<input  type="radio" name="plus" value="plural" onclick="dip_OnOff(this.value,'dip');">복수추가
				</td>
				</tr>
				<tr>
					<td>버스번호:
						
						<select name="bus_no">
								<c:if test="${empty bus_no_list}">
								<option>사용가능한 버스가 없습니다</option>
								</c:if>
								<c:forEach var="dto" items="${bus_no_list}">
									<option value="${dto.bus_no}">${dto.bus_no}</option>
								</c:forEach>
					    	
						</select>
							<c:if test="${empty bus_no_list}"> <!-- 사용가능 버스 없을시 버스추가 페이지 이동 -->
								<a href="bus_insert.do">버스추가</a>
							</c:if>
					
					</td>


				</tr>
				<tr>
					<td>출발지 : 
						<select name="arrival">
						<c:forEach var="dto" items="${bus_station_list}">
							<option value="${dto.station_name}">${dto.station_name}</option>
						</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>도착지 : 
						<select name="departure">
						<c:forEach var="dto" items="${bus_station_list}">
							<option value="${dto.station_name}">${dto.station_name}</option>
						</c:forEach>
						</select>
					</td>
				</tr>
			
				<tr>
					<td>출발시간 : 
						<select name="arr_time">
								<option value="선택" selected>선택</option>
							<c:forEach begin="1" end="22" varStatus="status">
								<option value="${status.count}">${status.count}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>소요시간 : 
						<select name="tot_time">
							<option value="선택" selected>선택</option>
							<c:forEach begin="1" end="5" varStatus="status">
								<option value="${status.count}">${status.count}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr id="dip" style="display:none">
					<td>배차시간: 
						<select name="dip_time">
							<option value="선택" selected>선택</option>
							<c:forEach begin="1" end="10" varStatus="status">
								<option value="${status.count}">${status.count}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr align="right">
					<td>
						<input type="button" value="추가" onclick="javascript:check()">
	 					<input type = "button" value = "다시쓰기" onclick = "javascript:reset()">
					</td>
				</tr>
				
			</table>
		</form>
	</div>

<%@ include file="../bus_main/bottom.jsp" %> 