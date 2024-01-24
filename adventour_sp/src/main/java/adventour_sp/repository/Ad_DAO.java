package adventour_sp.repository;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import adventour_sp.VO.Ad_VO;



@Repository
public class Ad_DAO {

	@Autowired
	private DataSource dataSource;
	
	@Autowired
	private SqlSession sqlSession;
	
    public Ad_VO logining(Ad_VO vo) throws Exception { 
    	return sqlSession.selectOne("logining", vo);


    }
    
	
	public ArrayList<Ad_VO> h_main() throws Exception{
		 ArrayList<Ad_VO> arr = new  ArrayList<Ad_VO>();
		 
		 Connection conn = null;
		 Statement stmt = null;
		 ResultSet rs = null;
		 
		 try {
			 conn = dataSource.getConnection();
			 stmt = conn.createStatement();
			 rs = stmt.executeQuery(" SELECT" + 
			 		"		h_hotel.h_pho," + 
			 		"		h_hotel.country_ko," + 
			 		"		h_hotel.city_ko," + 
			 		"		h_hotel.h_name_ko," + 
			 		"		h_hotel.h_name_eng," + 
			 		"		COUNT(h_room.h_name_eng) AS room_count" + 
			 		"		FROM" + 
			 		"		h_reserve" + 
			 		"		INNER JOIN" + 
			 		"		h_room ON h_reserve.h_roomnum = h_room.h_roomnum" + 
			 		"		INNER JOIN" + 
			 		"		h_hotel ON h_room.h_name_eng = h_hotel.h_name_eng" + 
			 		"		GROUP BY" + 
			 		"		h_hotel.h_pho," + 
			 		"		h_hotel.country_ko," + 
			 		"		h_hotel.city_ko," + 
			 		"		h_hotel.h_name_ko," + 
			 		"		h_hotel.h_name_eng" + 
			 		"		ORDER BY" + 
			 		"		room_count DESC" + 
			 		"		LIMIT 10;");
			 
			 while (rs.next()) {
				 Ad_VO obj = new Ad_VO();

				 obj.setH_pho(rs.getString("h_pho"));
				 obj.setCountry_ko(rs.getString("country_ko"));
				 obj.setCity_ko(rs.getString("city_ko"));
				 obj.setH_name_ko(rs.getString("h_name_ko"));
				 obj.setH_name_eng(rs.getString("h_name_eng"));
				 
				// System.out.println(obj.getCountry_ko()); //넘어오는 값 확인ok
				// System.out.println(obj.getCity_ko());
				// System.out.println(obj.getH_pho());
				// System.out.println(obj.getH_name_ko());
				// System.out.println(obj.getH_name_eng());
				 
				 arr.add(obj);
			 }
			    // System.out.println("셀렉은 됨");
			 
		 }catch(SQLException e) {
			 e.printStackTrace();
		 }finally {
			 conn.close();
		 }
		return arr;
	}
	
	public ArrayList<Ad_VO> h_main_package() throws Exception{
		 ArrayList<Ad_VO> main_pack = new  ArrayList<Ad_VO>();
		 
		 Connection conn = null;
		 Statement stmt = null;
		 ResultSet rs = null;
		 
		 try {
			 conn = dataSource.getConnection();
			 stmt = conn.createStatement();
			 rs = stmt.executeQuery(" SELECT * FROM packages");
			 
			 while (rs.next()) {
				 Ad_VO obj = new Ad_VO();
				 

				 obj.setP_pho(rs.getString("p_pho"));
				 obj.setP_name_ko(rs.getString("p_name_ko"));
				 obj.setP_title1(rs.getString("p_title1"));
				 obj.setP_title2(rs.getString("p_title2"));
				 obj.setP_price(rs.getInt("p_price"));
				 
				 System.out.println(obj.getP_name_ko()); //넘어오는 값 확인ok
				 System.out.println(obj.getP_title1());
				 System.out.println(obj.getP_title2());
				 System.out.println(obj.getP_price());

				 
				 main_pack.add(obj);
			 }
			     System.out.println("셀렉은 됨");
			 
		 }catch(SQLException e) {
			 e.printStackTrace();
		 }finally {
			 conn.close();
		 }
		return  main_pack;
	}

	public List<Ad_VO> city_list(String city) throws Exception { 
	    List<Ad_VO> city_list = sqlSession.selectList("city_select", city);
	    System.out.println("DAO 확인 " + city);
	    
//	    for (Ad_VO adVO : city_list) { // 셀렉이 잘 됐는지 확인하는 방법
//	        System.out.println("DAO 확인1 " + adVO.getH_name_eng());
//	        System.out.println( "DAO 확인2 " +adVO.getH_name_ko());
//	
//	    }
//	    
	    return city_list;
	}

    
	public List<Ad_VO> hotel_info(String h_name) throws Exception { 
	    List<Ad_VO> hotel_info = sqlSession.selectList("hotel_in", h_name);
	    System.out.println("DAO 확인 " + h_name);
	    

	    return hotel_info;
	} 
    

    
	public List<Ad_VO> h_main_sch (Ad_VO vo) throws Exception { 
	    
		List<Ad_VO> h_main_sch = sqlSession.selectList("select_main_search", vo);
		
		//확인 ok
//	    System.out.println(vo.getH_indateY());
//	    System.out.println(vo.getH_outdateY());
//	    System.out.println(vo.getCity_eng());
//	    System.out.println(vo.getCountry_eng());
//	    
//	    for (Ad_VO adVO : h_main_sch) { // 셀렉이 잘 됐는지 확인하는 방법
//       System.out.println("DAO 확인1 " + adVO.getH_name_eng());
//       System.out.println( "DAO 확인2 " +adVO.getH_name_ko());
//   }

	    return h_main_sch;
	}  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
