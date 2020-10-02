  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<script type="text/javascript">
	function check(){
			
			if (f.seat.value==""){
				alert("좌석수를 입력해주세요!!")
				f.seat.focus()
				return
			}
			if (f.grade.value==""){
				alert("등급을 입력해주세요!!")
				f.grade.focus()
				return
			}
			document.f.submit()
		}
		function reset(){
			document.f.reset()
			
		}
	</script>
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
	table.type10  th {
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


	<div align="center">
		<form name="f" action="bus_insert.do" method="post">
			<table width="50%" border="1" class="type10">

				<tr style="background-color:#F2F2F2;">
					<td>버스등급 :
					<select name="grade">
						<option value="">선택</option>
						<option value="일반">일반</option>
						<option value="우등">우등</option>
					</select> 
					</td>
				</tr>
				<tr style="background-color:#F2F2F2;">
					<td>버스좌석수 : <input type="text" name="seat"></td>
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
<%@ include file="../../Basic/bottom_nav.jsp" %>