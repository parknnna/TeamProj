<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
	.menuContainer .bustable { border-collapse: separate; }
	.busTable .menu{ 
		border: solid 2px #c94dff; 
		border-radius: 10px;
		padding:5px;
		width:100px;
		
	}

</style>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.0/css/all.min.css"/>

<div align="center" class="menuContainer" style="margin-top:90px">

		<table class="busTable" style="width:60%;border-collapse:separate;border-spacing:10 0px;">
			<tr style="text-align:center">
				<td class="menu"><a href="ADbus_list.do"><i class="fas fa-bus"></i>    Bus</a></td>
				<td class="menu"><a href="ADbus_station_list.do"><i class="fas fa-map-signs"></i>    Terminal</a></td>
				<td class="menu"><a href="ADbus_load_list.do"><i class="fas fa-route"></i>    Road</a></td>
				<td class="menu"><a href="ADbus_resv_list.do"><i class="fas fa-money-check"></i>    Reservation</a></td>
			</tr>
		</table>
	</div>