<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <footer class="ftco-footer ftco-bg-dark ftco-section">
		<div class="row">
		 <div class="weatherAPI" align="left" style="margin-left:120px;width:70%">
		 <div style="width:30%; float:left">
        	<table>
        		<tr align="center">
        			<td colspan="2" class="cdate" style="font-style:14px"></td>
        		</tr>
        		<tr>
        			<td class="cicon" rowspan="6"></td>
        		</tr>
        		<tr>
        			<td class="ctemp">현재 온도:</td>
        		</tr>
        		<tr>
        			<td class="cfeels_like">체감 기온:</td>
        		</tr>
        		<tr>
        			<td>최고 온도:<font class="chightemp"></font></td>
        		</tr>
        		<tr>
        			<td>최저 온도:<font class="clowtemp"></font></td>
        		</tr>
        	</table>  
        </div>   		
       	<div class="subBox" style="text-align:center ;width:70%;float:left;">
              <h4>Subscribe to our Newsletter</h4>
              <p style="color:#3e403f">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in</p>
                  <form action="#">
                    <div>
                      <input type="text" placeholder="Enter email address" style="width:170px;">
                      <input type="submit" value="Subscribe" class="submit px-3">
                    </div>
            	</form>
        </div>
       	</div>
       </div>
        
        <div class="row" style="margin-top:10px">
          <div class="col-md-12 text-center">
            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  </p>
          </div>
        </div>
      
    </footer>
    <script>
$.getJSON('http://api.openweathermap.org/data/2.5/weather?q=seoul&units=metric&appid=70393e52400da4753a885b68792731f4',
         function(data) {
            var $maxTemp = data.main.temp_max;
            var $minTemp = data.main.temp_min;
            var $cTemp = data.main.temp;
            var $now = new Date($.now());
            var $cDate = $now.getFullYear() + '년 '
                  + ($now.getMonth() + 1) + '월 ' + $now.getDate()
                  + '일';
            var $wIcon = data.weather[0].icon;
            var $wSpeed = data.wind.speed;
            var $wDeg = data.wind.deg;
            var $cFeels_like = data.main.feels_like;
            var $cWeather = data.weather[0].main;
            $('.cweather').append($cWeather);
            $('.clowtemp').append($minTemp + "ºC");
            $('.ctemp').append($cTemp + "ºC");
            $('.chightemp').append($maxTemp + "ºC");
            $('.cfeels_like').append($cFeels_like + "ºC");
            $('.cdate').prepend($cDate);
            $('.cicon').append('<img src="http://openweathermap.org/img/w/'+$wIcon+'.png", width="100", height="100"/>');
            $('.wspeed').append($wSpeed);
            $('.wdeg').append($wDeg);
         });
      </script>