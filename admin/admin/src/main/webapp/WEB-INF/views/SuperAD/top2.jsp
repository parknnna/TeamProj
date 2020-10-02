<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
	.menuContainer .bustable { border-collapse: separate; }
	.busTable .menu{ 
		border: solid 2px #c94dff; 
		border-radius: 10px;
		padding:5px;
		width:80px;	
		align:center;
	}
	
	.m3{
		border-bottom: solid 1px #e0e0e0;
		padding:10px;
	}
</style>
<script type="text/javascript">
function goBack() {
	  window.history.back();
	}
</script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.0/css/all.min.css"/>

<div align="center" class="menuContainer" style="margin-top:90px">
		<table class="busTable" style="width:60%;border-collapse:separate;border-spacing:10 0px;text-align:center;">
			<tr>
				<td class="menu"><a href="ADBAD_list.do?pos=1"><i class="fas fa-bus"></i>  Bus Administrator List</a></td>
				<td class="menu"><a href="ADHAD_list.do?pos=2"><i class="fas fa-hotel"></i>  Hotel Administrator List</a></td>
				<td class="menu"><a href="ADmember_list.do"><i class="fas fa-users"></i>  Member List</a></td>
			</tr>
		</table>
	</div>