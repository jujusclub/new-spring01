package adventour_sp.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import adventour_sp.VO.Ad_VO;
import adventour_sp.repository.Ad_DAO;



@Service
public class Ad_service {

    @Autowired
    private Ad_DAO ad_DAO;
    
	public boolean logining(Ad_VO vo) throws Exception {
		Ad_VO loginMember = ad_DAO.logining(vo);
		
		if(loginMember != null) {
			return true;
		}else {
		return false;
		}
	}
	

    public ArrayList<Ad_VO> h_top10_li() throws Exception {
        ArrayList<Ad_VO> top10_list = ad_DAO.h_main();

        // top10_list의 값을 출력 - ok
//        for (Ad_VO adVO : top10_list) {
//            System.out.println("H_Pho: " + adVO.getH_pho());
//            System.out.println("Country_ko: " + adVO.getCountry_ko());
//            System.out.println("City_ko: " + adVO.getCity_ko());
//            System.out.println("H_name_ko: " + adVO.getH_name_ko());
//            System.out.println("H_name_eng: " + adVO.getH_name_eng());
//            System.out.println("----------------------------------");
//        }

        return top10_list;
    }
    
    
    public ArrayList<Ad_VO> h_package() throws Exception {
        ArrayList<Ad_VO> h_package = ad_DAO.h_main_package();

        // h_package의 값을 출력 - ok
//        for (Ad_VO adVO : h_package) {
//
//            System.out.println( adVO.getP_pho());
//            System.out.println( adVO.getP_name_ko());
//            System.out.println( adVO.getP_title1());
//            System.out.println( adVO.getP_title2());
//            System.out.println( adVO.getP_price());
//            System.out.println("----------------------------------");
//        }

        return h_package;
    }
    
	public List<Ad_VO> city_list(String city) throws Exception  {
		
	List<Ad_VO> city_list = ad_DAO.city_list(city);
	
	System.out.println("Ser 확인"+city);
	
	return city_list;
	}
	
	public List<Ad_VO> hotel_info(String h_name) throws Exception  {
		
	List<Ad_VO> hotel_info = ad_DAO.hotel_info(h_name);
	
	System.out.println("Ser 확인"+h_name);
	
	return hotel_info;
	}
}
