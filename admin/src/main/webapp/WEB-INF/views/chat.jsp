<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="java.net.InetAddress"%>
<%@ include file="Basic/head.jsp" %>   
<%@ include file="Basic/nav_AD.jsp" %>   



	<div>
		<%
			InetAddress local;
			local = InetAddress.getLocalHost();
			String ip = local.getHostAddress();
		%>
		<div align="center" style="margin-top:100px" >
		<div id="messages" style="width:60%;overflow:auto; width:500px; height:400px;"></div>
		<br /> 메세지 입력 : <input type="text" id="sender"
			value="${sessionScope.id}" style="display: none;"> 
			<input type="text" id="messageinput" class="input">
			<input type="hidden" id="fileH" name="fileH" class="fileH" onchange="valueChange()">
		<button type="button" onclick="send();" >메세지 전송</button>
		<button type="button" onclick="javascript:up();">파일보내기</button>
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
				writeResponse("대화 종료");
			}
		}

		function up() {
			 // window.name = "부모창 이름"; 
            window.name = "chat";
            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            window.open("chatfile.do",
                    "childForm", "width=570, height=350, resizable = no, scrollbars = no");    
		}

		function send() {
			if(document.getElementById("fileH").value != "") {
				var text = document.getElementById("messageinput").value + ","
				+ document.getElementById("sender").value+ ","
				+ document.getElementById("fileH").value + "," + "/admin/resources/img/";
				var text = document.getElementById("messageinput").value + ","
				+ document.getElementById("sender").value+ ","
				+ document.getElementById("fileH").value + "," + "/admin/resources/img/";
				
				
				
				ws.send(text);
				text = "";
				
				document.getElementById("fileH").value = ""
				
				
				


			}
			else if (document.getElementById("messageinput").value != "") {
				var text = document.getElementById("messageinput").value + ","
						+ document.getElementById("sender").value;
				var text = document.getElementById("messageinput").value + ","
						+ document.getElementById("sender").value;
				ws.send(text);
				text = "";
				document.getElementById("messageinput").value = "";
				document.getElementById("messageinput").focus();
			}
		}
		window.onbeforeunload = function() {
			ws.close();
			writeResponse("대화 종료");
		}
		function writeResponse(text) {
			messages.innerHTML += "" + text;
			var objDiv = document.getElementById("messages");
			objDiv.scrollTop = objDiv.scrollHeight;
		}


		
	</script>


<%@ include file="Basic/bottom_nav.jsp" %> 
