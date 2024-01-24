package adventour_sp.controller;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import adventour_sp.VO.Ad_VO;
import adventour_sp.repository.Ad_DAO;
import adventour_sp.service.Ad_service;



@Controller
public class Ad_Controller {
    
    @Autowired
    private Ad_DAO ad_DAO;
    
    @Autowired
    private Ad_service ad_service;

    @RequestMapping("/hello") // 스프링 기본 연결 확인
    public String hello() {
        return "WEB-INF/sp_hello/hello.jsp";
    }
    
    @RequestMapping("/header")// 헤더연결
    public String header() {
        return "WEB-INF/sp_hello/header.html";
    }
    @RequestMapping("/login_header")// 헤더연결 jsp
    public String login_header() {
        return "WEB-INF/sp_hello/header_login.jsp";
    }
    @RequestMapping("/footer")//푸터연결
    public String footer() {
        return "WEB-INF/sp_hello/footer.html";
    }

    @RequestMapping("/login")//로그인 화면 띄우기
    public String login() {
        return "WEB-INF/sp_hello/login_merge_form.jsp";
    }
    
    @RequestMapping("/logining")//로그인 가능 여부확인
    public String logining(@ModelAttribute Ad_VO vo, HttpSession session) throws Exception {
    	
    	boolean loginResult = ad_service.logining(vo); 	
    	
    	
    	if(loginResult) { 		
    		session.setAttribute("id", vo.getM_id());
    		return "index";
    	}else {
    		return "login";
    	}
    	
    }

    @RequestMapping("/logout")//로그아웃
    public String logout(HttpSession session) {
    	session.invalidate();
        return "index";
    }

    @RequestMapping("/join_member")
    public String join_member() {
        return "WEB-INF/sp_hello/member_pjs.html";
    }
    @RequestMapping("/join_g_member")
    public String join_g_member() {
        return "WEB-INF/sp_hello/g_member.html";
    }

    @RequestMapping("/index")
    public String h_index(Model model) throws Exception {

        List<Ad_VO> h_top10 = ad_service.h_top10_li();
        List<Ad_VO> h_m_pack = ad_service.h_package();
  
        
        
        // h_top10의 값을 출력
//        System.out.println("컨트롤러 확인");
//        for (Ad_VO adVO : h_top10) {
//            System.out.println("H_Pho: " + adVO.getH_pho());
//            System.out.println("Country_ko: " + adVO.getCountry_ko());
//            System.out.println("City_ko: " + adVO.getCity_ko());
//            System.out.println("H_name_ko: " + adVO.getH_name_ko());
//            System.out.println("H_name_eng: " + adVO.getH_name_eng());
//            System.out.println("----------------------------------");
//        }
//        System.out.println("컨트롤러 확인 끝");
        model.addAttribute("12", h_top10);

        model.addAttribute("123", h_m_pack);
        return "WEB-INF/sp_hello/index.jsp";
    }
    
    @RequestMapping("/hotel")
    public String hotel(Model model) throws Exception {

        List<Ad_VO> h_top10 = ad_service.h_top10_li();
        List<Ad_VO> h_m_pack = ad_service.h_package();

        // h_top10의 값을 출력
//        System.out.println("컨트롤러 확인");
//        for (Ad_VO adVO : h_top10) {
//            System.out.println("H_Pho: " + adVO.getH_pho());
//            System.out.println("Country_ko: " + adVO.getCountry_ko());
//            System.out.println("City_ko: " + adVO.getCity_ko());
//            System.out.println("H_name_ko: " + adVO.getH_name_ko());
//            System.out.println("H_name_eng: " + adVO.getH_name_eng());
//            System.out.println("----------------------------------");
//        }
////        System.out.println("컨트롤러 확인 끝");
        model.addAttribute("12", h_top10);

        model.addAttribute("123", h_m_pack);
        return "WEB-INF/sp_hello/hotel.jsp";
    }
    
    @RequestMapping("/hotel_list")//인덱스에서 바로 나라별 리스트
    public String city_list(@RequestParam String city, Model model) throws Exception {

    	List<Ad_VO> city_list = ad_service.city_list(city);
    	
//    	System.out.println("Con 확인"+city);
    	
    	model.addAttribute("city_list",city_list);
  
        return "WEB-INF/sp_hello/hotel_sc.jsp";
    }
    
    @RequestMapping("/hotel_info")//인덱스 top 10
    public String hotel_info(@RequestParam String h_name, Model model) throws Exception {

    	List<Ad_VO> hotel_info = ad_service.hotel_info(h_name);
    	
    	System.out.println("Con 확인 h_name "+h_name);

    	
    	model.addAttribute("hotel_info",hotel_info);
  
        return "WEB-INF/sp_hello/hotel_info.jsp";
    }
    
    @RequestMapping("/hotel_search")
    public String h_main_sch(@ModelAttribute Ad_VO vo,
                             @RequestParam("h_mainde") String country_eng,
                             @RequestParam("h_maincity") String city_eng,
                             @RequestParam("h_indateY") String h_indateY,
                             @RequestParam("h_outdateY") String h_outdateY,
                             @RequestParam("h_mainpeo") String h_roompeo,
                             @RequestParam("night_time") String night_time,
                             HttpServletResponse response,
                             Model model) throws Exception {

        // 각 매개변수에 대한 쿠키 설정
        setCookie(response, "country_eng", country_eng);
        setCookie(response, "city_eng", city_eng);
        setCookie(response, "h_indateY", h_indateY);
        setCookie(response, "h_outdateY", h_outdateY);
        setCookie(response, "h_roompeo", h_roompeo);
        setCookie(response, "night_time", night_time);

        // vo 객체에 값 설정
        vo.setCountry_eng(country_eng);
        vo.setCity_eng(city_eng);
        vo.setH_indateY(h_indateY);
        vo.setH_outdateY(h_outdateY);
        vo.setH_roompeo(h_roompeo);

        // h_main_sch 로직은 그대로 유지
        List<Ad_VO> hMainSchList = ad_service.h_main_sch(vo);

        // 모델에 리스트를 추가
        model.addAttribute("h_main_sch", hMainSchList);

        return "WEB-INF/sp_hello/hotel_sc2.jsp";
    }

    // 쿠키를 설정하는 헬퍼 메서드
    private void setCookie(HttpServletResponse response, String name, String value) {
        Cookie cookie = new Cookie(name, value);
        response.addCookie(cookie);
    }

    
}
