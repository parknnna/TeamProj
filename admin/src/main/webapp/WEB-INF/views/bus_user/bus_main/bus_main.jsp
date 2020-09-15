<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ include file="../../Basic/head.jsp" %>

<style>
	input[type=radio]{
		display:none;
		margin:10px;
	}
	
	.way{
		font-size:20px;
		margin-left:7px;
	}
	
	i{
		display:inline-block;
	}
	
	ul{
		list-style:none;
	}
	
	.way_info{
		display:block;
	}
	
	.resv_info{
		display:block;
	}
	.way_info .tab_way{
		position:relative;
		border:none;
		border-bottom:none;
		padding:0px;
		height:50px;
	}
	
	.way_info .tab_way li{
		float:left;
		border:none;
		box-sizing:border-box;
		width:50%;
		background-color:#fff;
	}
	
	.way_info .tab_way li:hover{
		background-color:#d6d6d6;
		border:2px solid #d6d6d6;
	}
	
	.way_info .tab_way >li.active{
		background-color:#d6d6d6;
		border:2px solid #d6d6d6;
	}
	
	.way_info .tab_way .tab_one{
		border-radius:5px 0 0 5px;
	}
	
	.way_info .tab_way .tab_two{
		border-radius:0 5px 5px 0;
	}
	
	.way_info .tab_way label:hover{
		color:#5c34e0;
		cursor:pointer;
	}
	
	.resv_info .place{
		position:relative;
		border:none;
		border-bottom:none;
		padding:0px;
		height:84px;
	}
	
	.resv_info .date{
		position:relative;
		border:none;
		border-bottom:none;
		padding:0px;
		height:84px;
		float:right;
	}
	
	.resv_info .place li{
		float:left;
		border:none;
		box-sizing:border-box;
		width:25%;
		background-color:#e3e3e3;
		border-radius:5px;
		height:70;
		margin-right:3px;
		padding:8px 20px;
		text-align:left;
	}
	
	.resv_info .date li{
		float:left;
		border:none;
		box-sizing:border-box;
		width:25%;
		background-color:#e3e3e3;
		border-radius:5px;
		height:70;
		margin-right:3px;
		padding:8px 20px;
		text-align:left;
	}
	
	.resv_info .place .name{
		font-size:18px;
	}
	.resv_info .place .name:hover{
		color:#5c34e0;
		cursor:pointer;
	}
	
	p .text empty{
		margin-bottom:0px;
	}

</style>
<%@ include file="../../Basic/top_Bus.jsp" %>


<script type="text/javascript">	
	function check(){
			
			//출발지,도착지,편도일시,왕복일시 유효성 검사 해야함 아직 안함
			if (f.grade.value==""){
				alert("등급을 선택해주세요")
				f.grade.focus()
				return
			}
			
			document.f.submit()
		}
	 
	function setDisplay(){ //편도 왕복 선택시 보이고 안보이고
	    if($('input:radio[id=oneway]').is(':checked')){
	    	if($(".tab_two").hasClass("active")){
	    		$(".tab_two").removeClass("active")
	    	}
	        $(".tab_one").addClass("active")
	        $('#two').hide();
	        $('#one').show();
	        
	    }else if($('input:radio[id=twoway]').is(':checked')){
	    	if($(".tab_one").hasClass("active")){
	    		$(".tab_one").removeClass("active")
	    	}
	    	$(".tab_two").addClass("active")
	    	$('#one').hide();
		    $('#two').show();
		    
	    }
	}	 
	</script>
	<div align="center" class="bus_Container" style="width:80%; margin:100px auto 0 auto;">
		<form name="f" action="bus_resv_user_dispatch.do">
			<div class="bus_table" style="width:80%; height:40%;">
				<div class="way_info">
				<ul class="tab_way">
					<li class="tab_one">
						<label style="width:100%;margin-top:0.5rem;"><input id="oneway" type="radio" name="mode" value="oneway" onchange="setDisplay()"><i class="fas fa-long-arrow-alt-right fa-lg"></i><font class="way">편도</font></label>
					</li>
					
					<li class="tab_two">
						<label style="width:100%;margin-top:0.5rem;"><input id="twoway" type="radio" name="mode" value="twoway" onchange="setDisplay()"><i class="fas fa-exchange-alt fa-lg"></i><font class="way">왕복</font></label>
					</li>
				</ul>
				</div>
				
				<div class="resv_info">
					<ul class="place">
						<li>
							<a href="bus_resv_user_arrival.do">
								<span class="name">출발지</span>
								<p class="text empty">
									<span class="empty_txt">선택</span>
									<span class="val_txt"><c:if test="${not empty arr_dto.station_name}"><input type="hidden" name="arrival" value="${arrnoDTO.station_no}">${arr_dto.station_name}</c:if></span>
								</p>
							</a>
						</li>
						<li>
							<a href="bus_resv_user_departure.do">
								<span class="name">도착지</span>
								<p class="text empty">
									<span class="empty_txt">선택</span>
									<span class="val_txt"><c:if test="${not empty dep_dto.station_name}"><input type="hidden" name="departure" value="${depnoDTO.station_no}">${dep_dto.station_name}</c:if></span>
								</p>
							</a>
						</li>
					</ul>
					
					<ul class="date">
						<li id="one">
							<div class="date_picker">
								<span class="name">출발일</span>
								<p class="text"><input type="date" name="one_date"></p>
							</div>
						</li>
						
						<li id="two">
							<div class="date_picker">
								<span class="name">출발일</span>
								<p class="text"><input type="date" name="arr_date"></p>
							</div>
						</li>
						
						<li id="two">
							<div class="date_picker">
								<span class="name">도착일</span>
								<p class="text"><input type="date" name="dep_date"></p>
							</div>
						</li>
					</ul>
				</div>
				
				<table style="border:1px solid #e0e0e0;width:100%;height:100%;">
					<tr align="left"  style="border:1px solid #e0e0e0;">
						<td>등급</td>
						<td><input type="radio" name="grade" value="전체" >전체</td>
						<td><input type="radio" name="grade" value="우등">우등</td>
						<td><input type="radio" name="grade" value="일반">일반</td>
					</tr>
					
					<tr align="right"  style="border:1px solid #e0e0e0;">
						<td colspan="4">
							<input type="button" value="조회" onclick="javascript:check()">
						</td>
					</tr>
				</table>
			</div>	
		</form>
	</div>
<%@ include file="../../Basic/bottom_top.jsp" %>