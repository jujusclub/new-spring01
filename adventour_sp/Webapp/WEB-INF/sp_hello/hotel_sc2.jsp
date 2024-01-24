<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="adventour_sp.VO.*"%>
<%@ page import="java.util.*"%>
<%@ page import="adventour_sp.repository.Ad_DAO"%>
<%@ page import="adventour_sp.controller.*"%>
<%@ page import="javax.servlet.http.Cookie" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <title>호텔 리스트</title>
  <link rel="stylesheet" type="text/css" href="css/hotel_sc.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="js/hotel_sc.js"></script>

  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta http-equiv="X-UA-Compatible" content="ie=edge" /> 
<script defer src="js/map_index.js"></script> 
  <script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAI6rnQo4xB7Q2qJQfzN86WvL8JGPz_esg&callback=initMap"></script>
        
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   
  </head>

<body>

<script>
$(document).ready(function() {
	//헤더 푸터 로드
	$("#header").load("header");
	$("#footer").load("footer");
	
});
</script>

  <header>
<%
if (session.getAttribute("id") == null) {
%>
    <!-- header.html import -->
    <div id="header"></div>
<%
} else {
%>
    <jsp:include page="header_login.jsp"></jsp:include>
<%
}
%>
</header>

  <div class="pagename">
    <h1 class="pagename1">HOTEL</h1>
  </div><!--htitle-->
 

<form name="schnav_form" action="scsearch.hotel?uname=hotelSCSearch"  method="post">
  <div class="schnav"> <!--검색 네비 = sch -->
  

    <div class="sch1">
      <h5 class="sch_title">☆ 나라</h5>
      <select id="sch_country"  class="sch_country" name="sch_country" placeholder="나라" required="required" >
					<option value="uk">영국</option>
					<option value="italy">이탈리아</option>
					<option value="france">프랑스</option>
					<option value="spain">스페인</option>
      </select>
    </div>
    
    <div class="sch1">
      <h5 class="sch_title">☆ 도시</h5>
      
   
     <select id="sch_city" class="sch_city" name="sch_city" placeholder="도시" required="required" >
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

      
    </div>

    <div class="sch1">
      <h5 class="sch_title" >☆ 체크인</h5>
      <input type="text" id="sch_indate" class="datepicker" name="sch_indate" placeholder="YYYY-MM-DD" required="required">
 
    </div>

    <div class="sch1">
      <h5 class="sch_title" >☆ 체크아웃</h5>
      <input type="text" id="sch_outdate" class="datepicker" name="sch_outdate" placeholder="YYYY-MM-DD" required="required"> 

    </div>

   
    <div class="sch12">
      <h5 class="sch_title" >☆ 인원</h5>
      인원 수 : <input type="text" class="sch_adult" id="sch_adult" name="sch_adult" placeholder="인원 수" value="1" required="required">
 <!-- 유아 : <input type="text" class="sch_kid" name="sch_kid" placeholder="유/소아"></br>   -->
    </div>

    <div class="sch1">
      <h5 class="sch_title" >☆ 가격</h5>
      <input type="text" class="sch_minpri" name="sch_minpri" placeholder="최소가격 " value="">
      ~  <input type="text" class="sch_maxpri" name="sch_maxpri" placeholder="최대가격"  value="">
    </div>

    <div class="sch123">
      <h5 class="sch_title" >☆ 옵션</h5>
      <input type="radio" class="h_twin"  name="h_type" value="트윈">트윈</br>
      <input type="radio" class="h_double"  name="h_type" value="슈퍼싱글" checked>더블</br>
      <input type="radio" class="h_queen"  name="h_type" value="퀸">퀸</br>
    </div>

 <input type="hidden" id="night_time" name="night_time" class="night_time">
    <div class="sch13">
<!--    <a href=scsearch.hotel?uname=hotelSCSearch> --> 
      <input class="sch_btn" type="submit" name="sch_btn" value="검색하기">
<!--      </a> --> 
    </div>

    </div><!--schnav-->
</form>
  
  <div class="content">

    <div class="h_map"> <!--왼쪽 지도-->
      <div id="map" style="height: 290px;background-color: rgba(224, 224, 224, 0.5);"> </div>

    <div class="rinav"> <!--장바구니 등 -->

    <!--    <button class="eur" type="button">고객센터</button>
 <button class="cart" type="button">장바구니 담기</button>
      <button class="pay" type="button">결제하기</button>-->
      
    </div>


    </div>
<%!
    // HttpServletRequest와 쿠키 이름을 받아 해당 쿠키의 값을 반환하는 메서드
    String getCookieValue(HttpServletRequest request, String cookieName) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(cookieName)) {
                    return cookie.getValue();
                }
            }
        }
        return null; // 쿠키가 존재하지 않을 경우 null 반환
    }
%>
<!-- 쿠키값 확인 부분 추가 -->
<div class="h_cookies">
  <p class="h_mainde">나라: <%= getCookieValue(request, "country_eng") %></p>
  <p class="h_maincity">도시: <%= getCookieValue(request, "city_eng") %></p>
  <p class="h_indate">체크인 날짜: <%= getCookieValue(request, "h_indateY") %></p>
  <p class="h_outdate">체크아웃 날짜: <%= getCookieValue(request, "h_outdateY") %></p>
  <p class="h_mainpeo">인원수: <%= getCookieValue(request, "h_roompeo") %></p>
  <p class="night_time">박수: <%= getCookieValue(request, "night_time") %></p>
</div>
<!-- 쿠키값 확인 부분 종료 -->



     <%

     List<Ad_VO> list = (List<Ad_VO>) request.getAttribute("h_main_sch");
if (list != null) {
 for (int i = 0; i < list.size(); i++) {
    Ad_VO ukAll = list.get(i);

        
        String grade = ukAll.getH_grade();
        int starGrade = Integer.parseInt(grade);
       
%>
       <div class="scdform<%= i+1 %>"> <!--티켓정보-->

         <div class="h_mainpic">
           <img class="h_img1" src="image/hotel/h_image/<%= ukAll.getH_pho() %>" >
         </div>

         <div class="h_tiinfo">

          <div class="h_name">
          <h2 class="h_tiname"><%=ukAll.getH_name_eng() %></h2>
          <h3 class="h_tinameko">(<%=ukAll.getH_name_ko() %>)</h3>
          </div>

<div class="h_grade">

    <%
    int starCount = Integer.parseInt(ukAll.getH_grade()); // 별 갯수 가져오기
    for (int ii = 0; ii < starCount; ii++) {
    %>
    <img id="grade_star" src="image/hotel/h_image/star.png" alt="별 이미지">
    <%
    }
    %>
</div>

          <div class="h_restar">
          <h3 class="h_tirestar">4.0 / 5</h3> <!--  리뷰 작성 후 숫자로 보여줄것  -->
          </div>

          <div class="h_addr">
           <h4 class="h_tiaddr"><%= ukAll.getH_addr() %></h4> 
           
          <input type="button" class="h_mapbtn" type="button" name="h_mapbtn" value="지도보기" 
          onclick="showMap(<%= ukAll.getH_lat()%>, <%= ukAll.getH_lon()%>)" style="cursor: pointer;">
          
          <input type="hidden" class="hh_lat" name="hh_lat" value="<%= ukAll.getH_lat()%>" />
           <input type="hidden" class="hh_lng" name="hh_lng" value="<%= ukAll.getH_lon()%>" />
          </a>
          </div>

        </div><!--h_tiinfo-->

        <div class="h_priinfo">

         <div class="h_prices">
          <h2 class="h_tiprice"><%= ukAll.getMin_h_roompri() %> ~ </h2>
          <a href="/adventour_sp/hotel_info?h_name=<%= ukAll.getH_name_eng() %>">
<input type="button" class="move_h" name="move_h" value="호텔 보기" 
       onclick="location.href='/adventour_sp/hotel_info?h_name=<%= ukAll.getH_name_eng() %>';"
       style="cursor: pointer;">        
          </a>
         </div>


 <%
if (session.getAttribute("id") != null) {
%>
<a href="h_like.jsp?m_id=<%= session.getAttribute("id") %>&h_name_eng=<%= ukAll.getH_name_eng() %>">
  <input type="button" class="beheart" value="♥ 찜하기" style="cursor: pointer;">
</a> 
<%
} 
%>


      </div><!--h_priinfo-->
 
    </div><!--scdform-->

  <%
            }
        } else {
        %>
        <div class="no-results">
            <h3>검색 결과가 없습니다.</h3>
            <h3>검색 조건을 다시 설정해 주세요.</h3>
        </div>
        <%
        }
        
        %>
    </div>

  </div><!--content-->

  <footer>
<!-- footer.html import -->
	<div id="footer"></div>
  </footer>

</body>


</html>