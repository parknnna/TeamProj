<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="team.Dproject.main.model.*"%>
<%
	Calendar cal = Calendar.getInstance();
	String strYear = (String) request.getParameter("year");
	String strMonth = (String) request.getParameter("month");
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH);
	int date = cal.get(Calendar.DATE);
	if (strMonth != null) {
		month = Integer.parseInt(strMonth);
	}
	cal.set(year, month, 1);
	int startDay = cal.getMinimum(java.util.Calendar.DATE);
	int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
	int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
	int newLine = 0;
	Calendar todayCal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
	int cnt = 0;
	int cnt2=0;
	int day=0;
	int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));	
	List<roomDTO> roomlist = (List) request.getAttribute("roomlist");
	String[] Bcolor={"#cce8e2","#bbdef2","#f0cfff","#ffdefa","#ffdee6","#fff7de","#f0ffde"};
	int Bselect=0;
	int height=70;
	if(roomlist.size()!=0)
	height/=roomlist.size();
	int resv_no=0;
%> 
<style>
	.roomname:link{
		color:black;
	}
	a{ 
	text-decoration: none;
	}
	.roomname:hover{
		color:red;
	}
	.roomname:visited{
		color:black;
	}
	i{ /*예은이가 함*/
		  transform: scale(1);
		  -webkit-transform: scale(1);
		  -moz-transform: scale(1);
		  -ms-transform: scale(1);
		  -o-transform: scale(1);
		  transition: all 0.2s ease-in-out;
	}
	i:hover {
		  transform: scale(1.4);
		  -webkit-transform: scale(1.4);
		  -moz-transform: scale(1.4);
		  -ms-transform: scale(1.4);
		  -o-transform: scale(1.4);
	}
</style>
<%@ include file="../top.jsp"%>
<DIV width="80%" height="40">
	<table width="100%" height="40">
		<tr>
			<td height="60">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="10"></td>
					</tr>
					<tr>
						<td align="center">
							<%
								if (month > 0) {
							%> <a
							href="ADresv_list.do?hnum=<%=request.getAttribute("hnum")%>&amp;?year=<%=year%>&amp;month=<%=month - 1%>">
								<i class="fas fa-angle-left"></i></a> <%
							 	} else {
							 %> <%
							 	}
							 %> &nbsp;&nbsp; <%=year%>년 <%=month + 1%>월 &nbsp;&nbsp;<%
							 	if (month < 11) {
							 %> 		 
							<a href="ADresv_list.do?hnum=<%=request.getAttribute("hnum")%>&?year=<%=year%>&amp;month=<%=month + 1%>"target="_self">
							<i class="fas fa-angle-right"></i>
							</a> 
							<%
							 	} else {
							 %> <%
							 	}
							 %>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<br>
	<table bgcolor="#FFFFFF" align="center" >
		<THEAD>
		<tr><td align="right" colspan="7"><a href="ADhotel_list.do">뒤로가기</a></td></tr>
			<TR bgcolor="#c0a1ff">
				<TD width='100px'>
					<DIV align="center">
						<font color="red">SUN</font>
					</DIV>
				</TD>
				<TD width='100px'>
					<DIV align="center">MON</DIV>
				</TD>
				<TD width='100px'>
					<DIV align="center">TUE</DIV>
				</TD>
				<TD width='100px'>
					<DIV align="center">WED</DIV>
				</TD>
				<TD width='100px'>
					<DIV align="center">THU</DIV>
				</TD>
				<TD width='100px'>
					<DIV align="center">FRI</DIV>
				</TD>
				<TD width='100px'>
					<DIV align="center">
						<font color="#055db5">SAT</font>
					</DIV>
				</TD>
			</TR>
		</THEAD>
		<TBODY>
			<TR height="1">
				<%
					boolean fir = true;
					//처음 빈공란 표시
					for (int index = 1; index < start; index++) {
						%><TD height="1">&nbsp;</TD><%
						newLine++;
					}
					for (int index = 1; index <= endDay; index++) {
						String color = "";
						if (newLine == 0) {
							color = "RED";
						} else if (newLine == 6) {
							color = "#055db5";
						} else {
							color = "#707070";
						}				
						String backColor = "#fdf7ff";

						out.println("<TD valign='top' align='left' height='1px' bgcolor='" + backColor + "' nowrap>");
						cnt++;
						cnt2++;
				%>
				<font color="<%=color%>"> <%=index%>
				</font>
				<%
					out.println("<BR>");
						out.println("</TD>");
						newLine++;
						if (newLine == 7 || endDay == index) {
							newLine = 0;

							out.println("</TR>");
							if (index <= endDay) {
								%><TR  style="border-left:1; border-right:1;" ><%
							}
						}
						if (newLine == 0 || endDay == index) {
							newLine = 0;
							//내용 쓰자
								Bselect=0;
							boolean check = false;
			
							for (roomDTO roomDTO : roomlist) {
								if(Bselect>6) Bselect=0;
								int l = index ;
								if (fir) {
									for (int a = 1; a < start; a++) {
										%><TD height="<%=height %>" ></TD><%
										newLine++;
									}
								}
								int end = index;
								if (end == endDay) {
									if (cnt != 7) {
										end = end - (7 - cnt);
										newLine = 0;
									}
								}
								for (int i = l; i < end+7; i++) {
									day=(i-cnt2)+1;
									String sUseDate = Integer.toString(year) + "";

									sUseDate += Integer.toString(month + 1).length() == 1 ? "0" + Integer.toString(month + 1) + ""
											: Integer.toString(month + 1) + "";

									sUseDate += Integer.toString(day).length() == 1 ? "0" + Integer.toString(day) + ""
											: Integer.toString(day) + "";
									int temp=0;
									List<resvDTO> resvlist = (List) request.getAttribute("resvlist");
									for (resvDTO resvDTO : resvlist) {										
										temp=Integer.parseInt(resvDTO.getEnd_resv_date());
										if (resvDTO.getStart_resv_date().equals(sUseDate)
												&& resvDTO.getRoom_no().equals( roomDTO.getRoom_no())) {  
											check = true;
											resv_no=resvDTO.getHotel_resv_no();
											break;
										}
										check = false;

									}
										if (check) {
										
										%>
											<TD height="<%=height%>" align="center" bgcolor="<%=Bcolor[Bselect]%>" style="border-radius:30px;" >
											<font size="1" color="black" style="padding: 1px; margin: 1px; font-weight: bold ">
											<a href="ADresv_show.do?hotel_resv_no=<%=resv_no %>" class="roomname">
											<%=roomDTO.getName()%> 방(<%=roomDTO.getRoom_no() %>)
											</a>
											</font>
											</TD>
										<%
											newLine++;
											
										} else {
										%>
											<%-- <TD height="30" align="center" bgcolor="#a3aeff"><a style="text-decoration: none"> <font size="1"
												color="#020c57" style="padding: 1px; magin: 1px; font-weight: bold "><%=roomDTO.getName()%>&lt;미&gt;</font></a></TD> --%>
											<td height="<%=height %>"></td>
										<%
											newLine++;
									}
									if (end == endDay)
										continue;
									if (newLine == 7) {
										newLine = 0;
										cnt = 0;
										break;
									}
								}
						%>
					</tr>
					<%	Bselect++;
						}cnt2=0;	
						fir = false;
					}
				}%>	
		</TBODY>
	</TABLE>
</DIV>

<%@ include file="../bottom.jsp"%>
