<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Basic/top.jsp" %>
    <%@page import="java.util.*"%>
<%@page import="team.Dproject.main.model.*"%>
    <div class="hero-wrap js-fullheight" style="background-image: url('${pageContext.request.contextPath}/resources/images/bgi_2.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
            <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><strong>Let's Explore!</strong></h1>
            <div class="block-17 my-4">
            <!-- ////////////search box////////// -->
              <form action="search.do" method="post" class="d-block d-flex">
                <div class="fields d-block d-flex">
                <div class="select-wrap one-third">
                  <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                  <select name="map-category" class="form-control">
                  	  <option value="">What are you finding?</option>
                      <option value="지하철">Subway</option>
                      <option value="식당">Restaurant</option>
                      <option value="호텔">Hotel</option>
                      <option value="카페">Cafe</option>
                      <option value="관광명소">Attraction</option>
                    </select>
                  </div>
                  <!-- <div class="nice-select">
                  <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                  <ul class="list">
                      <li data-value="0" class="option">what are you finding?</li>
                      <li data-value="SW8" class="option">Subway</li>
                      <li data-value="FD6" class="option">Restaurant</li>
                      <li data-value="CT1" class="option">Fun</li>
                      <li data-value="CE7" class="option">Cafe</li>
                      <li data-value="AT4" class="option">Attraction</li>
                    </ul>
                  </div> -->
                  <div class="select-wrap one-third">
                  <div>
                  	<input type="text" name="map-location" class="form-control" placeholder="Where to">
                  </div>
                    <!-- <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                    <select name="map-location" class="form-control">
                      <option value="">Where</option>
                      <option value="0">Seoul</option>
                      <option value="1">Gyeonggi</option>
                      <option value="2">Daejeon</option>
                      <option value="3">Daegu</option>
                      <option value="4">Busan</option>
                      <option value="5">Ulsan</option>
                      <option value="6">Gangwon</option>
                      <option value="7">Incheon</option>
                    </select> -->
                  </div>
                </div>
                <input type="submit" class="search-submit btn btn-primary" value="Search">  
              </form> 
            </div>
            <!-- //////////추후에 사용 가능성//////// -->
            <!-- <p>Or browse the highlights</p>
            <p class="browse d-md-flex">
            	<span class="d-flex justify-content-md-center align-items-md-center"><a href="#"><i class="flaticon-fork"></i>Restaurant</a></span>
            	<span class="d-flex justify-content-md-center align-items-md-center"><a href="#"><i class="flaticon-hotel"></i>Hotel</a></span> 
            	<span class="d-flex justify-content-md-center align-items-md-center"><a href="#"><i class="flaticon-meeting-point"></i>Places</a></span> 
            	<span class="d-flex justify-content-md-center align-items-md-center"><a href="#"><i class="flaticon-shopping-bag"></i>Shopping</a></span>
            </p> -->
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section services-section bg-light">
      <div class="container">
        <div class="row d-flex">
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block text-center">
              <div class="d-flex justify-content-center"><div class="icon"><span class="flaticon-guarantee"></span></div></div>
              <div class="media-body p-2 mt-2">
                <h3 class="heading mb-3">Best Price Guarantee</h3>
                <p>A small river named Duden flows by their place and supplies.</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block text-center">
              <div class="d-flex justify-content-center"><div class="icon"><span class="flaticon-like"></span></div></div>
              <div class="media-body p-2 mt-2">
                <h3 class="heading mb-3">Travellers Love Us</h3>
                <p>A small river named Duden flows by their place and supplies.</p>
              </div>
            </div>    
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block text-center">
              <div class="d-flex justify-content-center"><div class="icon"><span class="flaticon-detective"></span></div></div>
              <div class="media-body p-2 mt-2">
                <h3 class="heading mb-3">Best Travel Agent</h3>
                <p>A small river named Duden flows by their place and supplies.</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block text-center">
              <div class="d-flex justify-content-center"><div class="icon"><span class="flaticon-support"></span></div></div>
              <div class="media-body p-2 mt-2">
                <h3 class="heading mb-3">Our Dedicated Support</h3>
                <p>A small river named Duden flows by their place and supplies.</p>
              </div>
            </div>      
          </div>
        </div>
      </div>
    </section>
    
    <section class="ftco-section ftco-destination">
    	<div class="container">
    		<div class="row justify-content-start mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate">
          	<span class="subheading">Bus</span>
            <h2 class="mb-4"><strong>Bus</strong> Station</h2>
          </div>
        </div>
    		<div class="row">
    			<div class="col-md-12">
    				<div class="destination-slider owl-carousel ftco-animate">
    					<%
    					List<BusStationDTO_resv> list =(List) request.getAttribute("list");
    					for(BusStationDTO_resv dto:list){
    					%>
    					<div class="item">
		    				<div class="destination">
		    					<a href="bus_station_info_detail.do?station_no=<%=dto.getStation_no() %>" class="img d-flex justify-content-center align-items-center" style="background-image: url(${pageContext.request.contextPath}/resources/img/<%=dto.getFilename()%>);">
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3">
		    						<h3><a href="bus_station_info_detail.do?station_no=<%=dto.getStation_no() %>"><%=dto.getStation_name() %></a></h3>
		    						<span class="listing"><%=dto.getAddress() %></span>
		    					</div>
		    				</div>
	    				</div>
	    				<%} %>
    				</div>
    			</div>
    		</div>
    	</div>
    </section>

    <section class="ftco-section bg-light">
    	<div class="container">
				<div class="row justify-content-start mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate">
          	<span class="subheading">Hotel</span>
            <h2 class="mb-4"><strong>Top</strong> Hotel</h2>
          </div>
        </div>    		
    	</div>
    	<div class="container-fluid">
    		<div class="row">
    		<%
    			List<hotelDTO> list2 = (List) request.getAttribute("list2");
    			int hotelsu=1;
    			if(list2.size()<5){
    				hotelsu=list2.size();
    			}
    			for(int i=0;i<list2.size();i++ ){
    			String a=list2.get(i).getFilename();
    		%>
    			<div class="col-sm col-md-6 col-lg ftco-animate">
    				<div class="destination">
    				<%if(a!=null ){ %>
    					<a href="hotel_show.do?hnum=<%=list2.get(i).getHotel_no() %>" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(${pageContext.request.contextPath}/resources/img/<%=list2.get(i).getFilename().split("/")[0]%>);">
    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						</div>
    					</a>
    				<%}else{ %>
    					<a href="hotel_show.do?hnum=<%=list2.get(i).getHotel_no() %>" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(${pageContext.request.contextPath}/resources/images/qwe.png);">
    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						</div>
    					</a>
    				<%} %>
    					<div class="text p-3">
    						<div class="d-flex">
    							<div class="one">
		    						<h3><a href="#"><%=list2.get(i).getName()%></a></h3>
		    						<p class="rate">
		    							<%for(int l=0;l<list2.get(i).getStar();l++){ %>
		    							<i class="icon-star"></i>
		    							<%}for(int l=list2.get(i).getStar();l<7;l++){ %>
		    							<i class="icon-star-o"></i>
		    							<%} %>
		    						</p>
	    						</div>
	    						
    						</div>
    						
    						<%
    						String c=list2.get(i).getHotel_info();
    						if(list2.get(i).getHotel_info().length()>50){
    							c=list2.get(i).getHotel_info().substring(0,50)+"...";
    						}
    						%>
    						<p><%=c %></p>
    						
    						<hr>
    						<p class="bottom-area d-flex">
    							<span><i class="icon-map-o"></i> <%=list2.get(i).getAddress() %></span> 
    							<span class="ml-auto"><a href="#">Discover</a></span>
    						</p>
    					</div>
    				</div>
    			</div>
    			<%} %>
    			
    		</div>
    	</div>
    </section>

    <section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url(images/bg_1.jpg);">
    	<div class="container">
    		<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
            <h2 class="mb-4">Some fun facts</h2>
            <span class="subheading">More than 100,000 websites hosted</span>
          </div>
        </div>
    		<div class="row justify-content-center">
    			<div class="col-md-10">
		    		<div class="row">
		          <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		                <strong class="number" data-number="100000">0</strong>
		                <span>Happy Customers</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		                <strong class="number" data-number="40000">0</strong>
		                <span>Destination Places</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		                <strong class="number" data-number="87000">0</strong>
		                <span>Hotels</span>
		              </div>
		            </div>
		          </div>
		          <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center">
		              <div class="text">
		                <strong class="number" data-number="56400">0</strong>
		                <span>Restaurant</span>
		              </div>
		            </div>
		          </div>
		        </div>
	        </div>
        </div>
    	</div>
    </section>


    <section class="ftco-section">
    	<div class="container">
				<div class="row justify-content-start mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate">
          	<span class="subheading">Content</span>
            <h2 class="mb-4"><strong>User</strong> Content</h2>
          </div>
        </div>    		
    	</div>
    	<div class="container-fluid">
    		<div class="row">
    		<%
    			List<BoardDTO> list3 = (List)request.getAttribute("list3");
    			if(list3!=null){
    			for(BoardDTO dto : list3){
    			%> 
    			<div class="col-sm col-md-6 col-lg ftco-animate">
    				<div class="destination">
    				<%if(dto.getFilename()!=null){ %>
    					<a href="board_content.do?main_board_no=<%=dto.getMain_board_no()%>" class="img img-2 d-flex justify-content-center align-items-center"  style="background-image: url(${pageContext.request.contextPath}/resources/img/<%=dto.getFilename().split("/")[0]%>);">
    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						</div>
    					</a><%}else{ %>
    					<a href="board_content.do?main_board_no=<%=dto.getMain_board_no()%>" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(${pageContext.request.contextPath}/resources/images/qwe.png);">
    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						</div>
    					</a>
    				<%} %>
    					<div class="text p-3">
    						<div class="d-flex">
    							<div class="one">
		    						<h3><a href="board_content.do?main_board_no=<%=dto.getMain_board_no()%>"><%=dto.getTitle() %></a></h3>
	    						</div>
	    						
    						</div>
    						<%
    						String b=dto.getContent();
    						if(b.length()>20){
    							b=dto.getContent().substring(0,20);
    							b+="...";
    						}
    						%>
    						<p><%=b %></p>
    						<hr>
    						<p class="bottom-area d-flex">
    						<%
    						String a="";
    						switch( dto.getLocation_no()){
    						case 0:
    							a="서울";
    							break;
    						case 1:
    							a="경기";
    							break;
    						case 2:
    							a="대전";
    							break;
    						case 3:
    							a="대구";
    							break;
    						case 4:
    							a="부산";
    							break;
    						case 5:
    							a="울산";
    							break;
    						case 6:
    							a="강원";
    							break;
    						case 7:
    							a="인천";
    							break;
    						}
    						%>
    							<span><i class="icon-map-o"></i> <%=a %></span> 
    						</p>
    					</div>
    				</div>
    			</div>
    		<%}} %>
    		</div>
    	</div>
    </section>

   


    <section class="ftco-section">
    	<div class="container">
				<div class="row justify-content-start mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate">
          	<span class="subheading">Content</span>
            <h2 class="mb-4"><strong>Hotel</strong> Content</h2>
          </div>
        </div>    		
    	</div>
    	<div class="container-fluid">
    		<div class="row">
    		<%
    			List<String> hotel = (List)request.getAttribute("hotel");
    			List<hotel_boardDTO> list4 = (List)request.getAttribute("list4");
    			if(list4!=null){
    				int cnt=0;
    			for(hotel_boardDTO dto : list4){
    			%> 
    			<div class="col-sm col-md-6 col-lg ftco-animate">
    				<div class="destination">
    					<%if(dto.getFilename()!=null){ %>
    					<a href="hotel_content.do?hotel_board_no=<%=dto.getHotel_board_no() %>&hotel_no=<%=dto.getHotel_no() %>" class="img img-2 d-flex justify-content-center align-items-center"  style="background-image: url(${pageContext.request.contextPath}/resources/img/<%=dto.getFilename().split("/")[0]%>);">
    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						</div>
    					</a>
    					<%}else{ %>
    					<a href="hotel_content.do?hotel_board_no=<%=dto.getHotel_board_no() %>&hotel_no=<%=dto.getHotel_no() %>" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(${pageContext.request.contextPath}/resources/images/qwe.png);">
    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						</div>
    					</a>
    					<%} %>
    					<div class="text p-3">
    						<div class="d-flex">
    							<div class="one">
		    						<h3><a href="board_content.do?main_board_no=<%=dto.getHotel_board_no() %>"><%=dto.getTitle() %></a></h3>
	    						</div>		
		    					<div class="two">
	    							<i class="far fa-thumbs-up"></i><span class="price"><%=dto.getUp() %></span>
	    							<i class="far fa-thumbs-down"></i><span class="price"><%=dto.getDown() %></span>
    							</div>
    						</div>
    					<%
    						String b=dto.getContent();
    						if(b.length()>20){
    							b=dto.getContent().substring(0,20);
    							b+="...";
    						}
    						%>
    						<p><%=b %></p>
    						<hr>
    						<p class="bottom-area d-flex">
    							<span><i class="icon-map-o"></i>&nbsp;&nbsp;&nbsp;<%=hotel.get(cnt)%></span> 
    						</p>
    					</div>
    				</div>
    			</div>
    		<%cnt++;}} %>
    		</div>
    	</div>
    </section>





	 <section class="ftco-section testimony-section bg-light">
      <div class="container">
        <div class="row justify-content-start">
          <div class="col-md-5 heading-section ftco-animate">
          	<span class="subheading">Best Directory Website</span>
            <h2 class="mb-4 pb-3"><strong>Why</strong> Choose Us?</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
            <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life.</p>
            <p><a href="#" class="btn btn-primary btn-outline-primary mt-4 px-4 py-3">Read more</a></p>
          </div>
					<div class="col-md-1"></div>
          <div class="col-md-6 heading-section ftco-animate">
          	<span class="subheading">Testimony</span>
            <h2 class="mb-4 pb-3"><strong>Our</strong> Guests Says</h2>
          	<div class="row ftco-animate">
		          <div class="col-md-12">
		            <div class="carousel-testimony owl-carousel">
		              <div class="item">
		                <div class="testimony-wrap d-flex">
		                  <div class="user-img mb-5" style="background-image: url(${pageContext.request.contextPath}/resources/images/person_1.jpg)">
		                    <span class="quote d-flex align-items-center justify-content-center">
		                      <i class="icon-quote-left"></i>
		                    </span>
		                  </div>
		                  <div class="text ml-md-4">
		                    <p class="mb-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
		                    <p class="name">Dennis Green</p>
		                    <span class="position">Guest from italy</span>
		                  </div>
		                </div>
		              </div>
		              <div class="item">
		                <div class="testimony-wrap d-flex">
		                  <div class="user-img mb-5" style="background-image: url(${pageContext.request.contextPath}/resources/images/person_2.jpg)">
		                    <span class="quote d-flex align-items-center justify-content-center">
		                      <i class="icon-quote-left"></i>
		                    </span>
		                  </div>
		                  <div class="text ml-md-4">
		                    <p class="mb-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
		                    <p class="name">Dennis Green</p>
		                    <span class="position">Guest from London</span>
		                  </div>
		                </div>
		              </div>
		              <div class="item">
		                <div class="testimony-wrap d-flex">
		                  <div class="user-img mb-5" style="background-image: url(${pageContext.request.contextPath}/resources/images/person_3.jpg)">
		                    <span class="quote d-flex align-items-center justify-content-center">
		                      <i class="icon-quote-left"></i>
		                    </span>
		                  </div>
		                  <div class="text ml-md-4">
		                    <p class="mb-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
		                    <p class="name">Dennis Green</p>
		                    <span class="position">Guest from Philippines</span>
		                  </div>
		                  
		                </div>
		              </div>
		            </div>
		          </div>
		        </div>
          </div>
        </div>
      </div>
    </section>
<%@include file="Basic/footer.jsp" %>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen">
  <svg class="circular" width="48px" height="48px">
  <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/>
  <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#c94dff"/>
  </svg>
  </div>


  <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/aos.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.timepicker.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${pageContext.request.contextPath}/resources/js/google-map.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
    
  </body>
</html>