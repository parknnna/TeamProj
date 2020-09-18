<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<style>
	input[type=radio]{
		
		
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
		width:49%;
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
		width:48%;
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
<script type="text/javascript">	

	function check(){
			//편도 유효성
   var start = f.one_date.value;
   var end = f.two_date.value;
   var date = new Date();
   var year = date.getFullYear(); //년도
   var month = date.getMonth() + 1; //월
   var day = date.getDate(); //일
   if ((day + "").length < 2) { // 일이 한자리 수인 경우 앞에 0을 붙여주기 위해
      day = "0" + day;
   }
   var today = year + "-" + month + "-" + day; // 오늘 날짜 (2017-02-07)

  
   var today = year + "-" + month + "-" + day; // 오늘 날짜 (2017-02-07
		   //편도 유효성
		if(document.getElementById('oneway').checked) {
			  if(document.getElementById("arr")){
				  alert("출발지를 입력해주세요")
				  f.arrival.focus()
				  return
			  }
			  if(document.getElementById("dep")){
				  alert("도착지를 입력해주세요")
				  f.departure.focus()
				  return
			  }
			
			 if(f.one_date.value==""){
				 alert("날짜를 선택해주세요")
				 f.one_date.focus()
				 return
			 }
			  if (f.grade.value==""){
					alert("등급을 선택해주세요")
					f.grade.focus()
					return
			}
			  var s = new Date(start);
			   var t = new Date(today);
			   if (s < t) {
			      alert("지난 날짜입니다")
			      return false;
			   }
		}	//왕복 유효성검사
			if(document.getElementById('twoway').checked) {
			  if(document.getElementById("arr")){
				  alert("출발지를 입력해주세요")
				  f.arrival.focus()
				  return
			  }
			  if(document.getElementById("dep")){
				  alert("도착지를 입력해주세요")
				  f.departure.focus()
				  return
			  }
			
			 if(f.one_date.value==""){
				 alert("출발 날짜를 선택해주세요")
				 f.one_date.focus()
				 return
			 }
			 if(f.two_date.value==""){
				 alert("도착 날짜를 선택해주세요")
				 f.one_date.focus()
				 return
			 }
			  if (f.grade.value==""){
					alert("등급을 선택해주세요")
					f.grade.focus()
					return
			}
			  if (start >= end) {
			      alert("도착일을 재설정해주세요")
			      return false;
			   }
			   var s = new Date(start);
			   var t = new Date(today);
			   if (s < t) {
			      alert("지난 날짜입니다")
			      return false;
			   }
			   

			
		}
		 document.f.submit()
			
			
		}
	
	 
	function setDisplay(){ //편도 왕복 선택시 보이고 안보이고
		var color="red";
		if($('input:radio[id=oneway]').is(':checked')){
	        $('#two').hide();
	        $('#one').show();
	    }else if($('input:radio[id=twoway]').is(':checked')){
	    	 $('#one').show();
		     $('#two').show();
	    }
	}
	function openWindowPop1(url, name){
	    var options = 'top=10, left=10, width=600, height=500, status=no, menubar=no, toolbar=no, resizable=no,titlebar=no';
	    window.open(url, name, options);

	}
	
	function load(){
		if (self.name != 'reload') {
	         self.name = 'reload';
	         self.location.reload(true);
	     }
	     else self.name = ''; 
	}
	


	
	</script>	
<%@ include file="../../Basic/top_Bus.jsp" %>
<%@include file="../bus_main/top.jsp" %>
<section class="ftco-section testimony-section bg-light">
<div align="center" style="width:80%; margin:100px auto 0 auto;">
	<form name="f" action="bus_resv_user_dispatch.do">
		<div style="width:80%; height:40%;">
			<div class="way_info">
				<ul class="tab_way">
					<li class="tab_one">
						<label style="width:100%;margin-top:0.5rem;"><input id="oneway" type="radio" name="mode" value="oneway"  onclick="setDisplay()"><i class="fas fa-long-arrow-alt-right fa-lg"></i><font class="way">편도</font></label>
					</li>
					
					<li class="tab_two">
						<label style="width:100%;margin-top:0.5rem;"><input id="twoway" type="radio" name="mode" value="twoway" onclick="setDisplay()" checked><i class="fas fa-exchange-alt fa-lg"></i><font class="way">왕복</font></label>
					</li>
				</ul>
			</div>
			<div class="resv_info">
					<ul class="place">
						<li>
							<a href="javascript:openWindowPop1('bus_resv_user_arrival.do', '출발지');">
								<span class="name">출발지</span>
								<p class="text empty">
								<c:if test="${empty arrnoDTO}"><span class="empty_txt" id="arr">선택</span></c:if>
								<c:if test="${not empty arrnoDTO}"><span class="val_txt"><input  type="hidden" name="arrival" value="${arrnoDTO.station_no}" onload="load()">${arrDTO.station_name}</span></c:if> 
								
								</p>
							</a>
						</li>
						<li>
							<a href="javascript:openWindowPop1('bus_resv_user_departure.do','도착지');">
								<span class="name">도착지</span>
								<p class="text empty">
									<c:if test="${empty depnoDTO}"><span class="empty_txt" id="dep">선택</span></c:if>
									<c:if test="${not empty depnoDTO}"><span class="val_txt"><input type="hidden" name="departure" value="${depnoDTO.station_no}">${depDTO.station_name}</span></c:if>
								</p>
							</a>
						</li>
					</ul>
					
					<ul class="place">
						<li id="one" style="width:50%;">
							<div>
								<span class="name">출발일</span>
								<p class="text" style="size:50%"><input type="date" name="one_date"></p>
							</div>
						</li>
						
						<li id="two">
							<div>
								<span class="name">도착일</span>
								<p class="text"><input type="date" name="two_date"></p>
							</div>
						</li>
					</ul>
				</div>
				<div>
				<table style="border:1px solid #e0e0e0;width:100%;">
					<tr align="left"  style="border:1px solid #e0e0e0; background-color:#d6d6d6;">
						<td>등급</td>
						<td><input type="radio" name="grade" value="전체" >전체</td>
						<td><input type="radio" name="grade" value="우등">우등</td>
						<td><input type="radio" name="grade" value="일반">일반</td>
					</tr>
					
					<tr align="right"  style="border:1px solid #e0e0e0; background-color:#d6d6d6;">
						<td colspan="4">
							<input type="button" value="조회" onclick="javascript:check()">
						</td>
					</tr>
				</table>
				</div>
		</div>
	</form>
</div>
</section>
<%@ include file="../../Basic/bottom_nav.jsp" %>
