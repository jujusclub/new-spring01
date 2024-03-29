<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="adventour_sp.VO.*"%>
<%@ page import="java.util.*"%>
<%@ page import="adventour_sp.repository.Ad_DAO"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>호텔 메인 인덱스 </title>

    <link rel="stylesheet" type="text/css" href="css/hotel.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="js/hotel.js"></script>
    <script defer src="https://maps.googleapis.com/maps/api/js?key=YOUR_GOOGLE_MAPS_API_KEY&callback=initMap"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
</head>
    <script>
        $(document).ready(function() {
            // id="loginin" 값이 null이면 로그인 필요 메시지 출력
            
            if ($("#loginin").val() == null || $("#loginin").val() === '') {
                $("#header").load("header");
            } else {
                $("#login_header").load("login_header");
            }
            $("#footer").load("footer");
        });
    </script>
<body>


    <header>
        <input type="hidden" id="loginin" value="${sessionScope.id}">
        <%
            // 세션에서 id를 가져와서 로그인 여부 확인
            String id = (String) session.getAttribute("id");

            if (id == null || id.isEmpty()) {
        %>
            <!-- 로그인되지 않은 경우 -->
            <div id="header"></div>
        <%
            } else {
        %>
            <!-- 로그인된 경우 -->
            <div id="login_header"></div>
        <%
            }
        %>
    </header>



	
<form name="h_main_sch_form" action="hotel_search" method="post" >
	<div class="busmain">
		<img class="busmainpic" src="image/img/hotel01.jpg">
		<div class="b_piccont">
			<h2 class="busmaintit">원하는 여정의 호텔을 검색해 보세요.</h2>

			<div class="b_picti">
				<p class="sch1">원하는 지역이 어디신가요?</p>
				<p class="sch2">체크인</p>
				<p class="sch3">체크아웃</p>
				<p class="sch4">인원수</p>
			</div>

			<div class="b_picsch">

				<select id="h_mainde" class="h_mainde" name="h_mainde" placeholder="나라 선택">
					<option value="">나라 선택</option>
					<option value="uk">영국</option>
					<option value="italy">이탈리아</option>
					<option value="france">프랑스</option>
					<option value="spain">스페인</option>
				</select> 
				<select id="h_maincity" class="h_maincity" name="h_maincity" placeholder="도시 선택">
					<option value="">도시 선택</option>
					<option value="london">런던</option>
					<option value="liverpool">리버풀</option>
					<option value="edinburgh">에든버러</option>
					<option value="rome">로마</option>
					<option value="venice">베네치아</option>
					<option value="milano">밀라노</option>
					<option value="paris">파리</option>
					<option value="marseille">마르세유</option>
					<option value="monaco">모나코</option>
					<option value="madrid">마드리드</option>
					<option value="barcelona">바르셀로나</option>
					<option value="sevilla">세비야</option>
				</select> 
				<input type="date" id="h_indateY" class="h_indateY" name="h_indateY" 
				 min="2024-01-01" max="2025-12-31" placeholder="체크인">

 
				<input type="date" id="h_outdateY" class="h_outdateY" name="h_outdateY" 
				min="2024-01-01" max="2025-12-31" placeholder="체크아웃">

				
				 <select id="h_mainpeo" class="h_maintpeo" name="h_mainpeo" placeholder="총 인원수">
				    <option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
				</select>

				
			<input type="hidden" id="night_time" class="night_time" name="night_time">
			   <input type="submit" class="b_maintbtn"  name="bsch_btn" value="검색하기"style="cursor: pointer;">
			    
			</div>
			<!--b_picsch-->
		</div>
		<!--b_piccont-->
	</div>
	<!--busmain-->

</form>

	<div class="h_eventban">

		<div class="h_event1">
			<div class="event1_img">
				<img src="image/img/event1.jpeg" width="1100px" height="300px">
			</div>
			<div class="event1_con">
				<h2>스페인</h2>
				<h2>바르셀로나</h2>
				<h3>지금 바르셀로나 여행을 떠나보세요!</h3>
			</div>
		</div>

	</div>

	<div class="content">

		<div class="h_retop10">

			<p class="h_retitle">추천 인기호텔 TOP10</p>

			<section class="awards">
				<!-- 이미지 스와이퍼 -->
				<div class="inner">
					<div class="swiper">
						<div class="swiper-wrapper">
						
						<%
ArrayList<Ad_VO> list = (ArrayList<Ad_VO>) request.getAttribute("12"); 

if (list != null) {
for (int i = 0; i < list.size(); i++) {
	Ad_VO aaa = list.get(i);

%>
			<div class="swiper-slide">
								<a name="<%= aaa.getH_name_eng() %>" href="/adventour_sp/hotel_info?h_name=<%= aaa.getH_name_eng() %>">
									<img class="top<%= i + 1 %>"
									src="image/hotel/h_image/<%= aaa.getH_pho() %>" alt="" />
									<p class="top_contry"><%= aaa.getCountry_ko() %> - <%= aaa.getCity_ko() %></p>
									<p class="top_name"><%= aaa.getH_name_ko() %></p>
								</a>
							</div>
               <%
                    }
                } else {
                    out.println("컨트롤러에서 데이터가 넘어오지 않음");
                    out.println("Null Data");
                }
                %>
						</div>
					</div>
				</div>

				<div class="swiper-buttons">
					<button class="swiper-prev"><</button>
					<!--이전버튼-->
					<button class="swiper-next">></button>
					<!-- 다음 버튼-->
				</div>

			</section>
			<!--이미지스위퍼 끝-->

		</div>
		<!--h_retop10 끝 -->
		
			<div class="h_recity">

			<h2 class="h_retitle3">나라별 검색하기</h2>

			<div class="h_recityimgs">

				<a href="/adventour_sp/hotel_list?city=uk">
					<div class="ukimg">
						<img class="h_recityimg1" src="image/img/uk.png">
						<div class="ukname">
							<h2>영국</h2>
						</div>
					</div>
				</a>
                <a href="/adventour_sp/hotel_list?city=italy">
					<div class="ityimg">
						<img class="h_recityimg2" src="image/img/ity.png">
						<h2 class="ityname">이탈리아</h2>
					</div>
				</a> 
				<a href="/adventour_sp/hotel_list?city=france">
					<div class="fraimg"">
						<img class="h_recityimg3" src="image/img/fra.png">
						<h2 class="franame">프랑스</h2>
					</div>
				</a> 
				<a href="/adventour_sp/hotel_list?city=spain">
					<div class="spaimg">
						<img class="h_recityimg4" src="image/img/spain.png">
						<h2 class="spaname">스페인</h2>
					</div>
				</a>


			</div>

		</div>
		<!--h_recity-->

	</div>
	<!--content-->

<div class="h_packages">
		<p class="h_retitle2">투어와 함께하는 숙소를 추천해드려요.</>

		<div class="h_package">

			<% 
			
			ArrayList<Ad_VO> list123 = (ArrayList<Ad_VO>) request.getAttribute("123"); 

			for (int i = 0; i < 4; i++) {
				Ad_VO obj = list123.get(i);
				

    %>
			<div class="package<%= i+1 %>">
				<div class="package1_img">
					<img src="image/img/<%= obj.getP_pho() %>">
				</div>
				<div class="package1_con">
					<ul class="package1_ul">
						<li class="pack_title"><%= obj.getP_name_ko() %></li>
						<li class="pack_con1"><%= obj.getP_title1() %></li>
						<li class="pack_con2"><%= obj.getP_title2() %></li>
						<li class="pack_pri"><%= obj.getP_price() %>원 ~</li>
					</ul>
				</div>
			</div>
			<!--package1-->

			<%
    }

%>
		</div>
	</div>












	<!-- footer.html import-->
	 <div id="footer"></div> 

</body>
</html>