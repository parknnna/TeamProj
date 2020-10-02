<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="java.net.InetAddress"%>
<%@ include file="Basic/head.jsp" %>   
<%@ include file="Basic/nav_Chat.jsp" %>   
<%@page import="team.Dproject.main.model.*"%>



	<div align="center" width="60%" >
		<%
			InetAddress local;
			local = InetAddress.getLocalHost();
			String ip = local.getHostAddress();
			MemberDTO dto = (MemberDTO)session.getAttribute("sedto");
		%>
		<div align="center" style="margin-top:100px;margin-bottom:100px;" >
		
		<div id="messages" style="overflow:auto; width:500px; height:400px;border:1px solid #000;"></div>
		<br />  
		
		
		<input type="text" id="sender" value="<%=dto.getId()%>" style="display: none;"> 
		<input type="hidden" id="fileH" name="fileH" class="fileH" onchange="send();">

		<div align="center" style="width: 100%;">
			<a onclick="javascript:up();"><i class="far fa-images fa-2x"></i></a>
			<input type="text" id="messageinput" class="input" size="60"onKeypress="javascript:if(event.keyCode==13) {send()}">
			<a onclick="send();" ><i class="fas fa-play fa-2x"></i></a>
		</div>
		</div>

	</div>


	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
	
	<script type="text/javascript">

		var ws;
		var messages = document.getElementById("messages");
		window.onload = function openSocket() {
			if (ws !== undefined && ws.readyState !== WebSocket.CLOSED) {
				writeResponse("WebSocket is already opened.");
				return;
			}
			

			ws = new WebSocket("ws://<%=ip%>:8080/admin/echo.do");

			
			ws.onopen = function(event) {
				if (event.data === undefined) {
					ws.send("<%=dto.getName()%>님이 입장하였습니다.");
					return;
				}
				writeResponse(event.data);
			};

			ws.onmessage = function(event) {
				console.log('writeResponse');
				console.log(event.data)
				writeResponse(event.data);
			};

			ws.onclose = function(event) {
				writeResponse("<%=dto.getName()%>님이 퇴장하였습니다.");
			}
		} 

		function up() {

            window.name = "chat";

            var popupX = (document.body.offsetWidth / 2) - (200 / 2);
			var popupY= (window.screen.height / 2) - (300 / 2);
 
            window.open('chatfile.do', 'childForm', 'status=no, height=50, width=350, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
		}

		function send() {
			if(document.getElementById("fileH").value != "") {
				var text = document.getElementById("messageinput").value + ","
				+ document.getElementById("sender").value+ ","
				+ document.getElementById("fileH").value + "," 
				+ "/admin/resources/img/"+","
				+ "<%=dto.getFilename()%>";
				var text = document.getElementById("messageinput").value + ","
				+ document.getElementById("sender").value+ ","
				+ document.getElementById("fileH").value + ","
				+ "/admin/resources/img/"+","
				+ "<%=dto.getFilename()%>";
				
				ws.send(text);
				text = "";
				
				document.getElementById("fileH").value = ""
			}
			else if (document.getElementById("messageinput").value != "") {
				var text = document.getElementById("messageinput").value + ","
						+ document.getElementById("sender").value+","
						+ "/admin/resources/img/"+","+"<%=dto.getFilename()%>";
				var text = document.getElementById("messageinput").value + ","
						+ document.getElementById("sender").value+","
						+ "/admin/resources/img/"+","
						+"<%=dto.getFilename()%>";
				ws.send(text);
				text = "";
				document.getElementById("messageinput").value = "";
				document.getElementById("messageinput").focus();
			}
		}
		window.onbeforeunload = function() {
			ws.send("<%=dto.getName()%>님이 퇴장하였습니다., ");
			ws.close();
			writeResponse("대화 종료");
		}
		function writeResponse(text) {
			messages.innerHTML += "" + text;
			var objDiv = document.getElementById("messages");
			objDiv.scrollTop = objDiv.scrollHeight;
		}


		
	</script>


