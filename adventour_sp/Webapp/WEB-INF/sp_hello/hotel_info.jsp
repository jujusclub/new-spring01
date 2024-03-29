<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="adventour_sp.VO.*"%>
<%@ page import="java.util.*"%>
<%@ page import="adventour_sp.repository.Ad_DAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <title>호텔 상세</title>
  <link rel="stylesheet" type="text/css" href="css/hotel_info.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="js/hotel_info.js"></script>

    <meta class="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge" /> 

<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAI6rnQo4xB7Q2qJQfzN86WvL8JGPz_esg&callback=initMap"></script>
        
          <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   
   
  </head>
  
  <script>
function getCookie(name) {
    var value = "; " + document.cookie;
    var parts = value.split("; " + name + "=");
    if (parts.length === 2) return parts.pop().split(";").shift();
}

// 쿠키에서 값을 가져옵니다.
var h_mainde = getCookie("h_mainde");
var h_maincity = getCookie("h_maincity");
var h_indateY = getCookie("h_indateY");
var h_outdateY = getCookie("h_outdateY");
var h_mainpeo = getCookie("h_mainpeo");
var night_time = getCookie("night_time");

//alert("h_outdateY: " + h_outdateY); // 확인 ok
//alert("night_time: " +night_time); // 확인 ok

		// 검색창 버튼
		$(document).ready(function() {
	      // 입력된 검색어 가져오기 
	      var name_eng = $(".h_info_search_nameeng").val();
	      var indate = $("#sch_indate").val();
	      var outdate = $("#sch_outdate").val();
	      var peo= $(".sch_peo").val();
	      var night= $(".night_time").val(); 

	      
	       $.ajax({
	        type: "GET",
	        url: "hotel_info_SCH.jsp", // 검색 결과를 처리할 JSP 페이지 URL
	        data: { h_name_eng:name_eng,
	        	    h_indate: indate,
	        	    h_outdate: outdate,
	        	    h_roompeo:peo,
	        	    night_time:night
	        	    }, // 검색어를 서버로 전송
	        success: function(data) {
	       
	          $("#info_SCH").html(data);
	        }

	      });
		}); 
	 	// 이전 페이지로 리디렉션하는 JavaScript 코드
	 	function redirectToPreviousPage() {
	 	    window.history.go(-1);
	 	}



$(document).ready(function() {
	$("#roompay_btn").on('click', function(e) { 
 	    e.preventDefault(); // 기본 submit 동작을 막음

 	    var id_sess = '<%=(String)session.getAttribute("id")%>';
 	    
 	  // alert("id_sess." + id_sess); 아이디값 가져오는지 확인ok

 	    if (id_sess === null || id_sess === "null") {
 	    	 alert("로그인이 필요한 항목입니다.", "회원 가입 또는 로그인을 해주세요", "error");
 	    } else {
 	        // 로그인 정보가 있는 경우에만 submit을 수행
 	        $("form[name='info_to_reserv']").submit();
 	    }
 	});
});	


$(document).ready(function() {
$('.hotel_info_pho1_text').hide(); // 실행시에는 글씨가 보이지 않음
$('.hotel_info_pho2_text').hide(); // 실행시에는 글씨가 보이지 않음
$('.hotel_info_pho3_text').hide(); // 실행시에는 글씨가 보이지 않음
$('.hotel_info_pho4_text').hide(); // 실행시에는 글씨가 보이지 않음
$('.hotel_info_pho5_text').hide(); // 실행시에는 글씨가 보이지 않음
$('.hotel_info_pho6_text').hide(); // 실행시에는 글씨가 보이지 않음


$('.h_info_title_pho1').on('mouseenter click', function() { //이미지 위에 마우스가 올라가면 
  $('.h_info_title_pho1').css('filter','brightness(0.7)'); //이미지의 색이 어두워지고
  $('.hotel_info_pho1_text').show(); //글씨가 보이고
  $('this').css('cusor','pointer'); 
});

$('.h_info_title_pho1').on('mouseleave', function() { //이미지위에 마우스가 없으면
  $('.hotel_info_pho1_text').hide(); // 글씨는 안보이고
  $('.h_info_title_pho1').css('filter','brightness(1)'); // 밝기는 돌아온다
});



$('.h_info_title_pho2').on('mouseenter click', function() { //이미지 위에 마우스가 올라가면 
  $('.h_info_title_pho2').css('filter','brightness(0.7)'); //이미지의 색이 어두워지고
  $('.hotel_info_pho2_text').show(); //글씨가 보이고
});

$('.h_info_title_pho2').on('mouseleave', function() { //이미지위에 마우스가 없으면
  $('.hotel_info_pho2_text').hide(); // 글씨는 안보이고
  $('.h_info_title_pho2').css('filter','brightness(1)'); // 밝기는 돌아온다
});




$('.h_info_title_pho3').on('mouseenter click', function() { //이미지 위에 마우스가 올라가면 
  $('.h_info_title_pho3').css('filter','brightness(0.7)'); //이미지의 색이 어두워지고
  $('.hotel_info_pho3_text').show(); //글씨가 보이고
});

$('.h_info_title_pho3').on('mouseleave', function() { //이미지위에 마우스가 없으면
  $('.hotel_info_pho3_text').hide(); // 글씨는 안보이고
  $('.h_info_title_pho3').css('filter','brightness(1)'); // 밝기는 돌아온다
});



$('.h_info_title_pho4').on('mouseenter click', function() { //이미지 위에 마우스가 올라가면 
  $('.h_info_title_pho4').css('filter','brightness(0.7)'); //이미지의 색이 어두워지고
  $('.hotel_info_pho4_text').show(); //글씨가 보이고
});

$('.h_info_title_pho4').on('mouseleave', function() { //이미지위에 마우스가 없으면
  $('.hotel_info_pho4_text').hide(); // 글씨는 안보이고
  $('.h_info_title_pho4').css('filter','brightness(1)'); // 밝기는 돌아온다
});

$('.h_info_title_pho5').on('mouseenter click', function() { //이미지 위에 마우스가 올라가면 
	  $('.h_info_title_pho5').css('filter','brightness(0.7)'); //이미지의 색이 어두워지고
	  $('.hotel_info_pho5_text').show(); //글씨가 보이고
	});

	$('.h_info_title_pho5').on('mouseleave', function() { //이미지위에 마우스가 없으면
	  $('.hotel_info_pho5_text').hide(); // 글씨는 안보이고
	  $('.h_info_title_pho5').css('filter','brightness(1)'); // 밝기는 돌아온다
	});

	$('.h_info_title_pho6').on('mouseenter click', function() { //이미지 위에 마우스가 올라가면 
		  $('.h_info_title_pho6').css('filter','brightness(0.7)'); //이미지의 색이 어두워지고
		  $('.hotel_info_pho6_text').show(); //글씨가 보이고
		});

		$('.h_info_title_pho6').on('mouseleave', function() { //이미지위에 마우스가 없으면
		  $('.hotel_info_pho6_text').hide(); // 글씨는 안보이고
		  $('.h_info_title_pho6').css('filter','brightness(1)'); // 밝기는 돌아온다
		});

	
	
});


</script>

<body>

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


  <div class="content">


    <div id="hotel_infos">
<% ArrayList<Ad_VO> list = (ArrayList<Ad_VO>) request.getAttribute("hotel_info"); 

if (list != null) {
for (int i = 0; i < list.size(); i++) {
	Ad_VO aaa = list.get(i);
%>

      <div id="hotel_info_phos">

        <div id="hotel_info_pho1"style="cursor: pointer;">
        <img class="h_info_title_pho1" class="h_info_title_pho1" 
        src="image/hotel/h_image/<%= aaa.getH_pho() %>" >
        <h2 class="hotel_info_pho1_text"> 크게 보기 </h2>
        </div>
        <div id="hotel_info_pho2"style="cursor: pointer;">
          <img class="h_info_title_pho2" class="h_info_title_pho2" src="image/hotel/h_image/<%= aaa.getH_pho1() %>" >
           <h2 class="hotel_info_pho2_text"> 크게 보기 </h2>
        </div>
        <div id="hotel_info_pho3"style="cursor: pointer;">
          <img class="h_info_title_pho3" class="h_info_title_pho3" src="image/hotel/h_image/<%= aaa.getH_pho2() %>" >
           <h2 class="hotel_info_pho3_text"> 크게 보기 </h2>
        </div>
        <div id="hotel_info_pho4"style="cursor: pointer;">
          <img class="h_info_title_pho4" class="h_info_title_pho4" src="image/hotel/h_image/<%= aaa.getH_pho3() %>"  >
           <h2 class="hotel_info_pho4_text"> 크게 보기 </h2>
        </div>
        <div id="hotel_info_pho5"style="cursor: pointer;">
          <img class="h_info_title_pho5" class="h_info_title_pho5" src="image/hotel/h_image/<%= aaa.getH_pho4() %>"  >
           <h2 class="hotel_info_pho5_text"> 크게 보기 </h2>
        </div>
        <div id="hotel_info_pho6"style="cursor: pointer;">
          <img class="h_info_title_pho6" class="h_info_title_pho6" src="image/hotel/h_image/<%= aaa.getH_pho5() %>"  >
           <h2 class="hotel_info_pho6_text"> 크게 보기 </h2>
        </div>

    </div><!--hotel_info_phos-->


    <div id="hotel_info_engname1">
      <h1 class="hotel_info_engname" ><%= aaa.getH_name_eng()%></h1>
    </div>

    <div id="hotel_info_koname">
      <h1 class="hotel_info_koname">(<%= aaa.getH_name_ko()%>)</h1>
    </div>
    
    <div id="hotel_info_grade">
 
       <%
    int starCount = Integer.parseInt(aaa.getH_grade()); // 별 갯수 가져오기
    for (int ii = 0; ii < starCount; ii++) {
    %>
    <img id="grade_star" src="image/hotel/h_image/star.png" alt="별 이미지">
    <%
    }
    %>
 
    </div>

    <div id="hotel_info_addr">
      <h3 class="hotel_info_addr"> 주소 : <%= aaa.getH_addr()%> </h3>
    </div>

    <div id="hotel_info_tel">
      <h3 class="hotel_info_tel"> TEL : <%= aaa.getH_tel()%> </h3>
    </div>

    <div id="hotel_info_options">

      <div id="hotel_info_breakfast">
             <h3 class="hotel_info_breakfast">   
            조식</h3><br>
            <h3>
            <% if (aaa.getH_breakfast().equals("y")) { %>
                가능
            <% } else { %>
                불가능
            <% } %>
        </h3>
    </div>
    <div id="hotel_info_pool">
        <h3 class="hotel_info_pool">
            수영장 </h3><br>
            <h3>
            <% if (aaa.getH_pool().equals("y")) { %>
                있음
            <% } else { %>
                없음
            <% } %>
        </h3>
    </div>
    <div id="hotel_info_rooftop">
        <h3 class="hotel_info_rooftop">
            루프탑 </h3><br>
            <h3>
            <% if (aaa.getH_rooftop().equals("y")) { %>
                있음
            <% } else { %>
                없음
            <% } %>
        </h3>
    </div>
        <div id="hotel_info_pet">
        <h3 class="hotel_info_pet">
            반려동물 동반 </h3><br>
            <h3>
            <% if (aaa.getH_pet().equals("y")) { %>
                가능
            <% } else { %>
                불가
            <% } %>
        </h3>
    </div>
      <div id="hotel_info_earlyin">
        <h3 class="hotel_info_earlyin">
            얼리 체크인 </h3><br>
            <h3>
            <% if (aaa.getH_earlyin().equals("y")) { %>
                가능
            <% } else { %>
                불가
            <% } %>
        </h3>
    </div>
  <!--        <div id="hotel_info_earlyout">
        <h3 class="hotel_info_earlyout">
            얼리 체크인 </h3><br>
            <h3>
            <% if (aaa.getH_earlyout().equals("y")) { %>
                가능
            <% } else { %>
                불가
            <% } %>
        </h3>
    </div> -->
      
<div class="h_info_tourad">
<input type="hidden" class="h_info_touradC" value="<%= aaa.getCountry_eng() %>">

</div>
    
    </div><!--hotel_info_options-->
   
<div class="h_info_review">
  <h1 class="h_info_review1">투숙객 후기</h1>
    <div class="star_range">
      
      <div class="star_range_total">
          <h1>4.0</h1><br>
        <%
    double starCount2 = 4.0; // 별 갯수 가져오기
    for (double ii = 0; ii < starCount2; ii++) {
    %>
    <img id="re_star" src="image/hotel/h_image/star.png" alt="별 이미지">
    <%
    }
    %>
      <p> 185개의 리뷰 </p>
      </div><!-- star_range_total -->
      
      <div class="star_range1">
        <div class="clean_star_range">
            <div class="clean_star_range_title"><h3>청 결</h3></div>
           <div id="barGraph">
			<input type="range" id="valueRange" min="0" max="5" value="4" readonly>
			<div id="valueDisplay">4.0</div> 
			</div>     
        </div><!-- clean_star_range -->
        
        <div class="kind_star_range">
         <div class="kind_star_range_title"><h3>친절함</h3></div>
           <div id="barGraph">
			<input type="range" id="valueRange" min="0" max="5" value="4" readonly>
			<div id="valueDisplay">4.0</div> 
			</div> 
        </div><!-- kind_star_range -->  
      </div><!-- star_range1 -->
     
      <div class="star_range2">
       <div class="loca_star_range">
       
          <div class="loca_star_range_title"><h3>위 치</h3></div>
           <div id="barGraph">
			<input type="range" id="valueRange" min="0" max="5" value="4" readonly>
			<div id="valueDisplay">4.0</div> 
		  </div> 
       
       </div>
       <div class="sleep_star_range">
       
        <div class="sleep_star_range_title"><h3>수면의 질</h3></div>
           <div id="barGraph">
			<input type="range" id="valueRange" min="0" max="5" value="4" readonly>
			<div id="valueDisplay">4.0</div> 
		  </div> 
       
       </div>     
      </div><!-- star_range2 -->
   
   </div><!-- star_range -->
   
<div class="h_review1">
<div class="h_review_peo">
<h3>2명</h3>
<h5>작성일 : 2023-11-01</h5>
<h5>이용일 : 2023-10-25</h5>

<div  class="h_review_info_star_num"><h3>5.0</h3></div>
    <div  class="h_review_info_star_star"><h4>
            <%
    double starCount1 = 5.0; // 별 갯수 가져오기
    for (double ii = 0; ii < starCount1; ii++) {
    %>
    <img id="user_re_star" src="image/hotel/h_image/star.png" alt="별 이미지">
    <%
    }
    %></h4></div>


</div>

<div class="h_review_info">
	<div  class="h_review_info_star">
	<div class="h_review_info_title">"친절한 직원들과 편안한 시설"</div>
    
	</div>
	<div class="h_review_info_contents_div" >
     <pre class="h_review_info_contents">
     
     
      친구와의 여행으로 해당 호텔을 방문하였습니다. 늦은 시간에 도착했지만 직원들은 우리를 친절하게 맞아주었습니다.<br>
    잠귀가 밝아서 낯선 곳에서는 잠을 잘 자지 못하는데 이 호텔을 생각보다 조용하고 침구류도 께끗했습니다.<br>
  
     </pre>
     
     </div>
     
     
     <div class="h_review_info_img">
     <img class="h_review_info_pho" src="image/hotel/h_re1.PNG">
     </div>
</div>   
 
 </div><!-- h_review1 -->
</div><!-- h_info_review -->

 
 <div id="map" style="width: 1200px; height: 500px;" > </div>
 <input type="hidden" class="hh_lat" name="hh_lat" value="<%= aaa.getH_lat()%>" />
 <input type="hidden" class="hh_lng" name="hh_lng" value="<%= aaa.getH_lon()%>" />
    
    
    <div class="hotel_info_cont">
    
    <h1> 호텔  설명</h1>
    <h2><%= aaa.getH_name_ko() %></h2>
       <br/>
       
    <pre class="db_h_hotel_info" id="db_h_hotel_info">
       <%= aaa.getH_hotel_info() %>
      
      <!-- Atolon Park Hotel의 위치는 시티투어를 하기 편리한 관광명소에 있습니다. <br>
      Atolon Park Hotel 예약은 Bernolsheim 여행을 더욱 편안하게 만들어 드립니다.<br>
          스트라스부르역 및 엔츠하임국제공항로부터 21km, 36km 정도 떨어져 있습니다.<br>
          바쁜 일정 후에는 호텔에서 휴식을 취하거나, 주변 명소들을 둘러보실 수 있습니다.<br> 
          호텔의 주차 공간을 이용할 수 있습니다.-->
    </pre>

    </div>
 </div><!--hotel_info-->
 
 </div><!-- content -->
 
 <!--  예약 검색 창 -->
 
<form name="info_to_reserv" action="toreservation.hotel?uname=toreserv"  method="post">


 <div class="yes_reserv_room">
 <h1 class="yes_reserv_room_title" >객실 및 가격 비교하기</h1> 
 
 <div class="h_info_search">
<%
Cookie[] cookies = request.getCookies(); // 쿠키 목록 받아오기

String h_indateY = null;
String h_indateM = null;
String h_indateD = null;
String h_outdateY = null;
String h_outdateM = null;
String h_outdateD = null;
String h_mainpeo = null;
String night_time = null;

for (Cookie cookie : cookies) {
    String name = cookie.getName();
    String value = cookie.getValue();
    
    if (!name.equals("JSESSIONID")) {
        if (name.equals("h_mainde")) {
%>
             
<%
        } else if (name.equals("h_maincity")) {
%>              
<%
        } else if (name.equals("h_indateY")) {
            h_indateY = value;
        } else if (name.equals("h_indateM")) {
            h_indateM = value;
        } else if (name.equals("h_indateD")) {
            h_indateD = value;
        }else if (name.equals("h_outdateY")) {
        	h_outdateY = value;
        } else if (name.equals("h_outdateM")) {
        	h_outdateM = value;
        } else if (name.equals("h_outdateD")) {
        	h_outdateD = value;
        }else if  (name.equals("h_mainpeo")) {
        	h_mainpeo = value;
        }else if  (name.equals("night_time")) {
        	night_time = value;
    }
    }
}
%> 
 <input type="text" id="h_info_search_name" class="h_info_search_name" name="h_info_search_name" placeholder="호텔 이름" required="required" value="<%= aaa.getH_name_ko() %>" >
 <input type="hidden" id="h_info_search_nameeng"  class="h_info_search_nameeng"   name="h_info_search_nameeng" value="<%= aaa.getH_name_eng() %>" >
<% 
 if (h_indateY != null && h_indateM != null && h_indateD != null) {
%>
 <input type="text" id="sch_indate" class="datepicker" name="sch_indate" placeholder="체크인 YYYY-MM-DD" required="required" 
 value="<%= h_indateY + "-" + h_indateM + "-" + h_indateD %>">

<%
}else{%>
     <input type="text" id="sch_indate" class="datepicker" name="sch_indate" placeholder="체크인 YYYY-MM-DD" required="required">	
<% 
}
 
if (h_outdateY != null && h_outdateM != null && h_outdateD != null) {
%>
 <input type="text" id="sch_outdate" class="datepicker" name="sch_outdate" placeholder="체크아웃 YYYY-MM-DD" required="required" 
  value="<%= h_outdateY + "-" + h_outdateM + "-" + h_outdateD %>" >
 

<%
}else{ %>
	 <input type="text" id="sch_outdate" class="datepicker" name="sch_outdate" placeholder="체크아웃 YYYY-MM-DD" required="required"  >
<% 
}

if (night_time != null) {
%>
<input type="text" id="night_time" class="night_time" name="night_time"  required="required"  placeholder="1박" value="<%= night_time %>">
 

<%
}else{ %>
	<input type="text" id="night_time" class="night_time" name="night_time"  required="required"  placeholder="1박" >
<% 
}
%>
 
<select id="sch_peo" class="sch_peo" name="sch_peo">
    <option value="">인원 수</option>
    <option value="1" 
    <%
        if (h_mainpeo != null && h_mainpeo.equals("1")) { 
        	
     %>
            selected
   <%           
        }
    %>
    >1명</option>
    <option value="2"
      <%
        if (h_mainpeo != null && h_mainpeo.equals("2")) { 
        	
     %>
            selected
   <%           
        }
    %>
    >2명</option>
    <option value="3"
    		 <%
    	        if (h_mainpeo != null && h_mainpeo.equals("3")) { 
    	        	
    	     %>
    	            selected
    	   <%           
    	        }
    	    %>
    >3명</option>
    <option value="4"
    		 <%
    	        if (h_mainpeo != null && h_mainpeo.equals("4")) { 
    	        	
    	     %>
    	            selected
    	   <%           
    	        }
    	    %>
    >4명</option>
</select>
 <!--  <input type="text" id="sch_peo" class="sch_peo" name="sch_peo"  placeholder="1박" >-->

<input type="button" class="h_info_search_btn"  value="검색하기"style="cursor: pointer;">

 </div><!-- h_info_search -->

  </div>  
 <h2 class="aass"> 현재 예약 가능한 객실 </h2>


<div id="info_SCH">
<%	
for (int ii = 0; i < list.size(); i++) {
	Ad_VO bbb = list.get(i); 
    
 
 %>

           <div id="hotel_room_info">
      <h2 id="hotel_room_type" class="hotel_room_type"><%= bbb.getH_roomtype()%> room</h2>
      <input type="hidden" name="h_room_num"  value="<%= bbb.getH_roomnum() %>">
      <div id="img_div">
     <div class="prevButton"><button id="prevButton">&lt;</button></div>  
         <div id="imageSlider" class="image-slider">
          <img id="h_room_phoi" class="slide" src="image/hotel/h_image/<%=  bbb.getH_roompho() %>">
          <img id="h_room_phoi1" class="slide" src="image/hotel/h_image/<%=  bbb.getH_roompho1() %>">
          <img id="h_room_phoi2" class="slide" src="image/hotel/h_image/<%=  bbb.getH_roompho2() %>">
          <img id="h_room_phoi3" class="slide" src="image/hotel/h_image/<%=  bbb.getH_roompho3() %>">
          <img id="h_room_phoi4" class="slide" src="image/hotel/h_image/<%=  bbb.getH_roompho4() %>">
          <img id="h_room_phoi5" class="slide" src="image/hotel/h_image/<%=  bbb.getH_roompho5() %>">
          <img id="h_room_phoi6" class="slide" src="image/hotel/h_image/<%=  bbb.getH_roompho6() %>">
        </div>
   <div class="nextButton">   <button id="nextButton"> &gt; </button></div>  
  <p id="slideNumber"> 1/7 </p>
      </div><!-- img_div -->
      
        <div id="h_room_options1" >
        <div class="h_room_options11"><img class="h_room_peo_img" src="image/hotel/h_image/person.png"/><div class="h_room_peo"><h4 >최대 가능인원 : <%=  bbb.getH_roompeo()%>명</h4></div></div>  
        <div class="h_room_options12">   <img class="h_room_bed_img" src="image/hotel/h_image/qeen_bed.png"> <div class="h_room_bed"><h4>베드 타입 : <%=  bbb.getH_room_bed()%>, <%=  bbb.getH_room_bedc()%>개</h4></div></div>
        <div class="h_room_options13"><img class="h_room_breakfast_img" src="image/hotel/h_image/meal.png"><div class="h_room_breakfast"> <h4>조식 <%=  bbb.getH_room_breakfast()%></h4></div></div>
        <div class="h_room_options14"> <img class="h_room_canael_img" src="image/hotel/h_image/pay_card.png"> <div class="h_room_canael"><h4> 취소 가능 여부 : <%=  bbb.getH_room_cancel()%></h4></div></div>
        <div class="h_room_options15"><img class="h_room_window_img" src="image/hotel/h_image/window.png"> <div class="h_room_window">  <h4>창문 <%=  bbb.getH_room_window()%></h4></div></div>
        <div class="h_room_options16"> <img class="h_room_smoke_img" src="image/hotel/h_image/no_smoking.png"><div class="h_room_smoke"><h4> <%=  bbb.getH_room_smoke()%> </h4></div></div>

        <div id="h_room_options2" >
          <h4 class="h_room_paynow"> 결제 : <%=  bbb.getH_room_paynow()%></h4>
          <h4 class="h_room_intime"> 체크인 : <%=  bbb.getH_room_intime()%> </h4>
          <h4 class="h_room_outtime"> 체크아웃 : <%=  bbb.getH_room_outime()%> </h4>
          <h2 id="h_room_price" class="h_room_price"> &#8361;<%=  bbb.getH_roompri()%>  / 1박</h2>
    
          <input type="button" id="roompay_btn"  class="roompay_btn" value="결제하기"style="cursor: pointer;"/>
        </div><!--h_room_options2-->


    </div><!-- h_room_options1 -->
</div><!-- hotel_room_info -->
     
<%  
}

%>
</div>  <!-- info_SCH -->
</form>  

<div class="h_facilities">
<h1>편의 시설 </h1>

<div class="h_facilities_icon">
  
  <div class="h_wifi_icon">
    <img  class="h_wifi_img" src="image/hotel/h_image/wifi.png">
     <h3>와이파이</h3>
  </div>
  
   <div class="h_parking_icon">
    <img  class="h_parking_img" src="image/hotel/h_image/parking.png">
     <h3>주차장</h3>
  </div>

   <div class="h_aircon_icon">
    <img  class="h_aircon_img" src="image/hotel/h_image/aircon.png">
     <h3>에어컨</h3>
  </div>  

   <div class="h_gym_icon">
    <img  class="h_gym_img" src="image/hotel/h_image/gym.png">
     <h3>헬스장</h3>
  </div> 

   <div class="h_spa_icon">
    <img  class="h_spa_img" src="image/hotel/h_image/spa.png">
     <h3>스 파</h3>
  </div> 

   <div class="h_cafe_icon">
    <img  class="h_cafe_img" src="image/hotel/h_image/cafe.png">
     <h3>카 페</h3>
  </div> 

</div>

<div class="h_facilities_info">

<div class="h_facilities_info_busi">
<div class="h_facilities_info_title"> <h2>비즈니스 시설 </h2></div> 
<div class="h_facilities_info_busi_icon1">
<h4>
    <% if (aaa.getH_meetingroom().equals("y")) { %>
                비즈니스 미팅 룸
            <% } else { %>
                
            <% } %>
            </h4>
</div>
<div class="h_facilities_info_busi_icon2"></div>
<div class="h_facilities_info_busi_icon3"></div>
</div>

<div class="h_facilities_info_food">
<div class="h_facilities_info_title"> <h2>식음료 시설 </h2></div> 
<div class="h_facilities_info_food_icon1">
<h4>
    <% if (aaa.getH_cafe().equals("y")) { %>
                카페 
            <% } else { }%>    
</h4>
</div>
<div class="h_facilities_info_food_icon2">
<h4>
    <% if (aaa.getH_bar().equals("y")) { %>
                바 
            <% } else { }%>    
</h4>
</div>
<div class="h_facilities_info_food_icon3"></div>
</div>

<div class="h_facilities_info_enter">
<div class="h_facilities_info_title"> <h2>레져 및 엔터테인먼트 </h2></div> 
<div class="h_facilities_info_enter_icon1">
<h4>
    <% if (aaa.getH_gym().equals("y")) { %>
              헬스장
            <% } else { }%>    
</h4>
</div>
<div class="h_facilities_info_enter_icon2">
<h4>
    <% if (aaa.getH_spa().equals("y")) { %>
                스파
            <% } else { }%>    
</h4>
</div>
<div class="h_facilities_info_enter_icon3"></div>
</div>


<div class="h_facilities_info_service">
<div class="h_facilities_info_title"> <h2>서비스 </h2></div> 
<div class="h_facilities_info_service_icon1">
<h4>
    <% if (aaa.getH_earlyin().equals("y")) { %>
              얼리체크인
            <% } else { }%>    
</h4>
</div>
<div class="h_facilities_info_service_icon2">
<h4>
    <% if (aaa.getH_earlyout().equals("y")) { %>
                얼리체크아웃
            <% } else { }%>    
</h4>
</div>
<div class="h_facilities_info_service_icon3">
<h4>
    <% if (aaa.getH_roomservice().equals("y")) { %>
           룸 서비스     
            <% } else { }%>    
</h4>
</div>
<div class="h_facilities_info_service_icon4">
<h4>
    <% if (aaa.getH_24front().equals("y")) { %>
           24시간 프론트 데스크    
            <% } else { }%>    
</h4>
</div>

</div>
</div><!-- h_facilities_info -->
</div><!-- h_facilities -->

<div class="h_more_info">
<h1>유용한 정보 </h1>
 <table >
        <tr>
            <td id="td1" class="td1"><h2><img class="h_more_info_icon" src="image/hotel/h_image/bed.png"> 침대 추가</h2></td>
            <td id="td12" ><h3><%=aaa.getH_extrabed() %></h4></td>
        </tr>
        <tr>
            <td id="td2" class="td1"><h2><img class="h_more_info_icon" src="image/hotel/h_image/pet.png"> 반려동물 </h2></td>
            <td id="td22" ><h3>반려동물 동반 
           
            <% if (aaa.getH_pet().equals("y")) { %>
                가능
            <% } else { %>
                불가
            <% } %>
        </h3></td>
        </tr>
          <tr>
            <td  id="td3" class="td1"><h2><img class="h_more_info_icon" src="image/hotel/h_image/breakfast.png"> 조식 </h2></td>
            <td id="td32" ><h3>조식 이용 
            <% if (aaa.getH_breakfast().equals("y")) { %>
                가능
            <% } else { %>
                불가능
            <% } %></h3>
            <h4>조식 종류 : 
            <%= aaa.getH_breakfast_type() %>
</h4>
            <h4>조식 가격 : 한화 약 2만원</h4>
            </td>
        </tr>
          <tr>
            <td  id="td4" class="td1"><h2><img class="h_more_info_icon" src="image/hotel/h_image/important_info.png"> 호텔관련 주요정보  </h2></td>
            <td id="td42" ><h4><%= aaa.getH_impotant_info() %></h4>
</td>
        </tr>
        <tr>
            <td  id="td5" class="td1"><h2><img class="h_more_info_icon" src="image/hotel/h_image/payable.png"> 가능한 결제 방법 </h2></td>
            <td id="td52"><h3>호텔 요금은 다음의 방법으로 결제하실 수 있습니다:</h3>
            <h4><%= aaa.getH_payable_type() %></h4>
            </td>
        </tr>
    </table>

</div>


<div></div>



<% 
}

}else{
	out.println("null data");
}
%>

<div class="modal">
  <span class="close">&times;</span>
  <img class="modal_content" id="img01">
</div>


   <footer>
<!-- footer.html import -->
	<div id="footer"></div>
  </footer> 

  

</body>
<script >

var country_eng = $(".h_info_touradC").val();
//   alert(country_eng);
   // AJAX 요청 보내기
//   alert(country_eng);
   $.ajax({
       type: "GET",
       url: "hotel_info_Tourad.jsp", // 검색 결과를 처리할 JSP 페이지 URL
       data: { country_eng: country_eng }, // 검색어를 서버로 전송
       success: function(data) {
           // 서버에서 받은 데이터를 .h_info_tourad의 내부 HTML로 설정
           $(".h_info_tourad").html(data);
       },
       error: function() {
           alert("일치하는 검색어가 없습니다.");
       }
   });
   
	var elements1 = document.querySelectorAll(".tour_price");
	if (elements1) {
	  elements1.forEach(function(element) {
	    var text = element.textContent;
	    var formattedText = addCommasToNumber(text);
	    element.textContent = formattedText;
	  });
	}
	function addCommasToNumber(numberString) {
		  return numberString.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	

	// 검색창 버튼 
		// 검색창 버튼
	$(".h_info_search_btn").click(function(e) {

      // 입력된 검색어 가져오기 
      var name_eng = $(".h_info_search_nameeng").val();
      var indate = $("#sch_indate").val();
      var outdate = $("#sch_outdate").val();
      var peo= $(".sch_peo").val();
      var night= $(".night_time").val(); 

      
       $.ajax({
        type: "GET",
        url: "hotel_info_SCH.jsp", // 검색 결과를 처리할 JSP 페이지 URL
        data: { h_name_eng:name_eng,
        	    h_indate: indate,
        	    h_outdate: outdate,
        	    h_roompeo:peo,
        	    night_time:night
        	    }, // 검색어를 서버로 전송
        success: function(data) {
       
          $("#info_SCH").html(data);
        }

      });
	});
 	// 이전 페이지로 리디렉션하는 JavaScript 코드
 	function redirectToPreviousPage() {
 	    window.history.go(-1);
 	}



</script>
</html>
