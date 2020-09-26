<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../Basic/head.jsp" %>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
	function check() {
		var start = f.start_resv_date.value;
		var end = f.end_resv_date.value;
		var date = new Date();
		var year = date.getFullYear(); //년도
		var month = date.getMonth() + 1; //월
		var day = date.getDate(); //일
		if ((day + "").length < 2) { // 일이 한자리 수인 경우 앞에 0을 붙여주기 위해
			day = "0" + day;
		}
		var today = year + "-" + month + "-" + day; // 오늘 날짜 (2017-02-07)
		if (start == "") {
			alert("입실 시작 날짜를 입력 해 주세요!!")
			return false;
		}
		if (end == "") {
			alert("퇴실 시작 날짜를 입력 해 주세요!!")
			return false;
		}
		if (start >= end) {
			alert("퇴실 날짜를 입실날짜 이후로 지정해주세요!!")
			return false;
		}
		var s = new Date(start);
		var t = new Date(today);
		if (s < t) {
			alert("이전 날짜는 예약할 수 없습니다.")
			return false;
		}
		return true;
	}
</script>
<%@ include file="../../Basic/top_Hotel.jsp" %>
	<div align="center" class="boxContainer" align="center">
		
		    <section class="ftco-section ftco-degree-bg">
		      <div class="container">
		        <div class="row">
		        	<div class="col-lg-3 sidebar">
		        		<div class="sidebar-wrap bg-light ftco-animate">
		        			<h3 class="heading mb-4">Find Hotel</h3>
								<form name="f" action="hotel_resvlist" onSubmit='return check();'>		        				<div class="fields">
				              <!-- 지역 선택 -->
				              <div class="form-group">
				                <div class="select-wrap one-third">
			                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
			                    <select name="address" class="form-control">
			                    	<option value="">Select Location</option>
									<option value="서울">서울</option>
									<option value="경기">경기</option>
									<option value="대전">대전</option>
									<option value="대구">대구</option>
									<option value="부산">부산</option>
									<option value="울산">울산</option>
									<option value="강원">강원</option>
									<option value="인천">인천</option>
								</select>
			                  </div>
				              </div>
				              <div class="form-group">
				              	<label for="checkin" style="margin-top: 0;margin-bottom: 0;float: left;font-size: 12;">Date from</label>
				                <input type="date" class="form-control" name="start_resv_date" id="checkin">
				              </div>
				              <div class="form-group">
				                <label for="checkout" style="margin-top: 0;margin-bottom: 0;float: left;font-size: 12;">Date to</label>
				                <input type="date" name="end_resv_date" class="form-control" id="checkout">
				              </div>
				              <div class="form-group">
				              <div class="select-wrap one-third">
			                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
				              	<select name="roomsu" class="form-control">
				              		<option value="" selected>Room</option>
									<option value="1">1개</option>
									<option value="2">2개</option>
									<option value="3">3개</option>
									<option value="4">4개</option>
									<option value="5">5개</option>
									<option value="6">6개</option>
									<option value="7">7개</option>
									<option value="8">8개</option>
									<option value="9">9개</option>
									<option value="10">10개</option>
								</select>
							</div>
							</div>
							<div class="form-group">
							<div class="select-wrap one-third">
			                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
									<select name="sleeps" class="form-control">
										<option value="" selected>Person</option>
										<option value="1">1명</option>
										<option value="2">2명</option>
										<option value="3">3명</option>
										<option value="4">4명</option>
										<option value="5">5명</option>
										<option value="6">6명</option>
										<option value="7">7명</option>
										<option value="8">8명</option>
										<option value="9">9명</option>
										<option value="10">10명</option>
									</select>
					        </div>
					        </div>
				              <div class="form-group">
				                <input type="submit" value="Search" class="btn btn-primary py-3 px-5">
				              </div>
				            </div>
			            </form>
		        		</div>
		        		
		        		<div class="sidebar-wrap bg-light ftco-animate">
		        			<h3 class="heading mb-4">Star Rating</h3>
		        			<form method="post" class="star-rating">
									  <div class="form-check">
											<input type="checkbox" class="form-check-input" id="exampleCheck1">
											<label class="form-check-label" for="exampleCheck1">
												<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i></span></p>
											</label>
									  </div>
									  <div class="form-check">
								      <input type="checkbox" class="form-check-input" id="exampleCheck1">
								      <label class="form-check-label" for="exampleCheck1">
								    	   <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i></span></p>
								      </label>
									  </div>
									  <div class="form-check">
								      <input type="checkbox" class="form-check-input" id="exampleCheck1">
								      <label class="form-check-label" for="exampleCheck1">
								      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
								     </label>
									  </div>
									  <div class="form-check">
									    <input type="checkbox" class="form-check-input" id="exampleCheck1">
								      <label class="form-check-label" for="exampleCheck1">
								      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
								      </label>
									  </div>
									  <div class="form-check">
								      <input type="checkbox" class="form-check-input" id="exampleCheck1">
								      <label class="form-check-label" for="exampleCheck1">
								      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
									    </label>
									  </div>
									</form>
		        		</div>
		          </div>
		          <div class="col-lg-9">
		          	<div class="row">
		          		<div class="col-md-4 ftco-animate">
				    				<div class="destination">
				    					<a href="hotel-single.html" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(images/hotel-1.jpg);">
				    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
				    					</a>
				    					<div class="text p-3">
				    						<div class="d-flex">
				    							<div class="one">
						    						<h3><a href="hotel-single.html">Hotel, Italy</a></h3>
						    						<p class="rate">
						    							<i class="icon-star"></i>
						    							<i class="icon-star"></i>
						    							<i class="icon-star"></i>
						    							<i class="icon-star"></i>
						    							<i class="icon-star-o"></i>
						    							<span>8 Rating</span>
						    						</p>
					    						</div>
					    						<div class="two">
					    							<span class="price per-price">$40<br><small>/night</small></span>
				    							</div>
				    						</div>
				    						<p>Far far away, behind the word mountains, far from the countries</p>
				    						<hr>
				    						<p class="bottom-area d-flex">
				    							<span><i class="icon-map-o"></i> Miami, Fl</span> 
				    							<span class="ml-auto"><a href="#">Book Now</a></span>
				    						</p>
				    					</div>
				    				</div>
				    			</div>
				    			<div class="col-md-4 ftco-animate">
				    				<div class="destination">
				    					<a href="hotel-single.html" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(images/hotel-2.jpg);">
				    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
				    					</a>
				    					<div class="text p-3">
				    						<div class="d-flex">
				    							<div class="one">
						    						<h3><a href="hotel-single.html">Hotel, Italy</a></h3>
						    						<p class="rate">
						    							<i class="icon-star"></i>
						    							<i class="icon-star"></i>
						    							<i class="icon-star"></i>
						    							<i class="icon-star"></i>
						    							<i class="icon-star-o"></i>
						    							<span>8 Rating</span>
						    						</p>
					    						</div>
					    						<div class="two">
					    							<span class="price per-price">$40<br><small>/night</small></span>
				    							</div>
				    						</div>
				    						<p>Far far away, behind the word mountains, far from the countries</p>
				    						<hr>
				    						<p class="bottom-area d-flex">
				    							<span><i class="icon-map-o"></i> Miami, Fl</span> 
				    							<span class="ml-auto"><a href="#">Book Now</a></span>
				    						</p>
				    					</div>
				    				</div>
				    			</div>
				    			<div class="col-md-4 ftco-animate">
				    				<div class="destination">
				    					<a href="hotel-single.html" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(images/hotel-3.jpg);">
				    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
				    					</a>
				    					<div class="text p-3">
				    						<div class="d-flex">
				    							<div class="one">
						    						<h3><a href="hotel-single.html">Hotel, Italy</a></h3>
						    						<p class="rate">
						    							<i class="icon-star"></i>
						    							<i class="icon-star"></i>
						    							<i class="icon-star"></i>
						    							<i class="icon-star"></i>
						    							<i class="icon-star-o"></i>
						    							<span>8 Rating</span>
						    						</p>
					    						</div>
					    						<div class="two">
					    							<span class="price per-price">$40<br><small>/night</small></span>
				    							</div>
				    						</div>
				    						<p>Far far away, behind the word mountains, far from the countries</p>
				    						<hr>
				    						<p class="bottom-area d-flex">
				    							<span><i class="icon-map-o"></i> Miami, Fl</span> 
				    							<span class="ml-auto"><a href="#">Book Now</a></span>
				    						</p>
				    					</div>
				    				</div>
				    			</div>
				    			<div class="col-md-4 ftco-animate">
				    				<div class="destination">
				    					<a href="hotel-single.html" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(images/hotel-4.jpg);">
				    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
				    					</a>
				    					<div class="text p-3">
				    						<div class="d-flex">
				    							<div class="one">
						    						<h3><a href="hotel-single.html">Hotel, Italy</a></h3>
						    						<p class="rate">
						    							<i class="icon-star"></i>
						    							<i class="icon-star"></i>
						    							<i class="icon-star"></i>
						    							<i class="icon-star"></i>
						    							<i class="icon-star-o"></i>
						    							<span>8 Rating</span>
						    						</p>
					    						</div>
					    						<div class="two">
					    							<span class="price per-price">$40<br><small>/night</small></span>
				    							</div>
				    						</div>
				    						<p>Far far away, behind the word mountains, far from the countries</p>
				    						<hr>
				    						<p class="bottom-area d-flex">
				    							<span><i class="icon-map-o"></i> Miami, Fl</span> 
				    							<span class="ml-auto"><a href="#">Book Now</a></span>
				    						</p>
				    					</div>
				    				</div>
				    			</div>
				    			<div class="col-md-4 ftco-animate">
				    				<div class="destination">
				    					<a href="hotel-single.html" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(images/hotel-5.jpg);">
				    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
				    					</a>
				    					<div class="text p-3">
				    						<div class="d-flex">
				    							<div class="one">
						    						<h3><a href="hotel-single.html">Hotel, Italy</a></h3>
						    						<p class="rate">
						    							<i class="icon-star"></i>
						    							<i class="icon-star"></i>
						    							<i class="icon-star"></i>
						    							<i class="icon-star"></i>
						    							<i class="icon-star-o"></i>
						    							<span>8 Rating</span>
						    						</p>
					    						</div>
					    						<div class="two">
					    							<span class="price per-price">$40<br><small>/night</small></span>
				    							</div>
				    						</div>
				    						<p>Far far away, behind the word mountains, far from the countries</p>
				    						<hr>
				    						<p class="bottom-area d-flex">
				    							<span><i class="icon-map-o"></i> Miami, Fl</span> 
				    							<span class="ml-auto"><a href="#">Book Now</a></span>
				    						</p>
				    					</div>
				    				</div>
				    			</div>
				    			<div class="col-md-4 ftco-animate">
				    				<div class="destination">
				    					<a href="hotel-single.html" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(images/hotel-6.jpg);">
				    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
				    					</a>
				    					<div class="text p-3">
				    						<div class="d-flex">
				    							<div class="one">
						    						<h3><a href="hotel-single.html">Hotel, Italy</a></h3>
						    						<p class="rate">
						    							<i class="icon-star"></i>
						    							<i class="icon-star"></i>
						    							<i class="icon-star"></i>
						    							<i class="icon-star"></i>
						    							<i class="icon-star-o"></i>
						    							<span>8 Rating</span>
						    						</p>
					    						</div>
					    						<div class="two">
					    							<span class="price per-price">$40<br><small>/night</small></span>
				    							</div>
				    						</div>
				    						<p>Far far away, behind the word mountains, far from the countries</p>
				    						<hr>
				    						<p class="bottom-area d-flex">
				    							<span><i class="icon-map-o"></i> Miami, Fl</span> 
				    							<span class="ml-auto"><a href="#">Book Now</a></span>
				    						</p>
				    					</div>
				    				</div>
				    			</div>
		          	</div>
		          	<div class="row mt-5">
				          <div class="col text-center">
				            <div class="block-27">
				              <ul>
				                <li><a href="#">&lt;</a></li>
				                <li class="active"><span>1</span></li>
				                <li><a href="#">2</a></li>
				                <li><a href="#">3</a></li>
				                <li><a href="#">4</a></li>
				                <li><a href="#">5</a></li>
				                <li><a href="#">&gt;</a></li>
				              </ul>
				            </div>
				          </div>
				        </div>
		          </div> <!-- .col-md-8 -->
		        </div>
		      </div>
		    </section> <!-- .section -->
    
			<!-- <table border="1">
				<tr>
					<th><label>지역</label></th>
					<td> <select name="address">
							<option value="서울" selected>서울</option>
							<option value="경기">경기</option>
							<option value="대전">대전</option>
							<option value="대구">대구</option>
							<option value="부산">부산</option>
							<option value="울산">울산</option>
							<option value="강원">강원</option>
							<option value="인천">인천</option>
					</select></td>
					<th><label>체크 인</label></th>
					<td> 
					<input type="date" name="start_resv_date" >
					</td>
					<th> 
					<label>체크 아웃</label>
					</th>
					<td> 
					<input type="date" name="end_resv_date" >
					</td>
					<th><label>객실</label></th>
					<td> 
						<select name="roomsu">
							<option value="1" selected>1개</option>
							<option value="2">2개</option>
							<option value="3">3개</option>
							<option value="4">4개</option>
							<option value="5">5개</option>
							<option value="6">6개</option>
							<option value="7">7개</option>
							<option value="8">8개</option>
							<option value="9">9개</option>
							<option value="10">10개</option>
					</select></td>
					<th><label>인원</label></th>
					<td><select name="sleeps">
							<option value="1">1명</option>
							<option value="2" selected>2명</option>
							<option value="3">3명</option>
							<option value="4">4명</option>
							<option value="5">5명</option>
							<option value="6">6명</option>
							<option value="7">7명</option>
							<option value="8">8명</option>
							<option value="9">9명</option>
							<option value="10">10명</option>
					</select></td>
					<th><label>&nbsp;</label></th>
					<td>
						<button type="submit">검색</button></td>
				</tr>
			</table> -->
	</div>
	
<%@ include file="../../Basic/bottom_top.jsp" %>