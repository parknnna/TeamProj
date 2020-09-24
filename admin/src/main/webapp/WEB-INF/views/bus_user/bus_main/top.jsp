<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
                #topMenu {
                       height: 30px;
                        width: 850px;
                }

                #topMenu ul li {
                        list-style: none;
                        color: white;
                        background-color: #D8D8D8;
                        float: center;
                        line-height: 30px;
                        text-align: center;
                }

                #topMenu .menuLink {
                        text-decoration:none;
                        color: white;
                        display: block;
                        width: 150px;
                        font-size: 12px;
                        font-weight: bold;
                        font-family: "Trebuchet MS";
                }
                #topMenu .menuLink:hover {
                        color: red;
                        background-color: #4d4d4d;
                }

    </style>

	<c:set var = "member_no" value = "${sedto.member_no}"/>
	
    <table style="width:100%; height=20%; background-color:#D8D8D8;">
    <tr> <td>
     	<nav id="topMenu" style="width:100%"> 
        		<ul>
          			<li >
          				<c:if test="${empty sedto}">
							<a href="member_login_resv.do">로그인</a>&nbsp&nbsp&nbsp&nbsp&nbsp<a href="member_input_resv.do" class="nav_link">회원가입</a>&nbsp&nbsp&nbsp&nbsp&nbsp
						</c:if> 
						<c:if test="${not empty sedto}">
							<a href="member_logout_resv.do">로그아웃</a>&nbsp&nbsp&nbsp&nbsp&nbsp<a href="member_mypage_resv.do" class="nav_link">마이페이지</a>&nbsp&nbsp&nbsp&nbsp&nbsp
						</c:if>
						<a href="bus_user_resv_lookup.do">배자정보 조회 </a>&nbsp&nbsp&nbsp&nbsp&nbsp	
						<a href="bus_resv_user_resvlist.do" >예약내역</a>&nbsp&nbsp&nbsp&nbsp&nbsp
						<a href="bus_station_info.do" >터미널 정보</a>&nbsp&nbsp&nbsp&nbsp&nbsp
						<c:if test="${sedto.position==0 || sedto.position==1}">
							<a href="bus_list.do" >버스리스트</a>&nbsp&nbsp&nbsp&nbsp&nbsp
							<a href="bus_station_list.do" >버스정류소 리스트</a>&nbsp&nbsp&nbsp&nbsp&nbsp
							<a href="bus_road_list.do">버스노선 리스트</a>&nbsp&nbsp&nbsp&nbsp&nbsp
							
						</c:if>
          			</li>
          		</ul>
         
     </nav>
      	</td>	
      </tr>
</table>
