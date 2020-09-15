package team.Dproject.main.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.Dproject.main.model.BusResvDTO_resv;
import team.Dproject.main.model.BusResv_BusRoadDTO;
import team.Dproject.main.model.Bus_BusRoadDTO;

@Service
public class BusResvMapper_resv {
	   @Autowired
	   private SqlSession sqlSession;
	   
	   public List<BusResvDTO_resv> listBus_resv_resv(){
		      return sqlSession.selectList("listBus_resv_resv");
	   }
	   public int insertBus_resv_resv(BusResvDTO_resv dto){
		      return sqlSession.insert("insertBus_resv_resv",dto);
	   }
	   public int deletetBus_resv_resv(int no){
		      return sqlSession.insert("deleteBus_resv_resv",no);
	   }
	   public BusResvDTO_resv getBus_resv_resv(String no){
		   return sqlSession.selectOne("getBus_resv_resv",no);
	   }
	   public int updateBus_resv_resv(BusResvDTO_resv dto){
		      return sqlSession.insert("updateBus_resv_resv",dto);
	   }
	   public List<Bus_BusRoadDTO> listdispatch_resv_resv(int arrival,int departure,String grade){
		   java.util.Map<String,Object> map =new java.util.Hashtable<String,Object>();
		   
		  
		   map.put("arrival",arrival);
		   map.put("departure",departure);
		   map.put("grade",grade);
	
		   
		   return sqlSession.selectList("listDispatch_resv_resv",map);
	   }
	   public List<BusResv_BusRoadDTO> resvlist_resv(int member_no){
		   
		   return sqlSession.selectList("resvlist_resv",member_no);
	   }
	   public List<Bus_BusRoadDTO> listdispatch_resv_count_resv(int arrival,int departure,String grade,int start,int end){//list 5개씩출력 우등,일반 버스중 하나
		   java.util.Map<String,Object> map =new java.util.Hashtable<String,Object>();
		   
		  
		   map.put("arrival",arrival);
		   map.put("departure",departure);
		   map.put("grade",grade);
		   map.put("start",start);
		   map.put("end",end);
		   
		   return sqlSession.selectList("listDispatch_resv_count_resv",map);
	   }
	   public List<Bus_BusRoadDTO> listdispatch_resv_reverse_count_resv(int arrival,int departure,String grade,int start,int end){//list 5개씩출력 우등,일반 버스중 하나(출발지 도착지 반대로 표시)
		   java.util.Map<String,Object> map =new java.util.Hashtable<String,Object>();
		   
		  
		   map.put("arrival",arrival);
		   map.put("departure",departure);
		   map.put("grade",grade);
		   map.put("start",start);
		   map.put("end",end);
		   
		   return sqlSession.selectList("listDispatch_resv_reverse_count_resv",map);
	   }
	   
	   
	   
	   public List<Bus_BusRoadDTO> listdispatch_resv_all_count_resv(int arrival,int departure,int start,int end){//list 5개씩 출력 모든종류 버스
		   java.util.Map<String,Object> map =new java.util.Hashtable<String,Object>();
		   
		  
		   map.put("arrival",arrival);
		   map.put("departure",departure);
		   map.put("start",start);
		   map.put("end",end);
		   
		   return sqlSession.selectList("listDispatch_resv_all_count_resv",map);
	   }
	   
	   public List<Bus_BusRoadDTO> listdispatch_resv_reverse_all_count_resv(int arrival,int departure,int start,int end){//list 5개씩 출력 모든종류 버스(출발지,도착지 반대로)
		   java.util.Map<String,Object> map =new java.util.Hashtable<String,Object>();
		   
		  
		   map.put("arrival",arrival);
		   map.put("departure",departure);
		   map.put("start",start);
		   map.put("end",end);
		   
		   return sqlSession.selectList("listDispatch_resv_all_reverse_count_resv",map);
	   }
	   

	   
	   public List<Bus_BusRoadDTO> listDispatch_resv_reverse_resv(int arrival,int departure,String grade){
		   java.util.Map<String,Object> map =new java.util.Hashtable<String,Object>();
		   
		   map.put("arrival",arrival);
		   map.put("departure",departure);
		   map.put("grade",grade);
		   
		   return sqlSession.selectList("listDispatch_resv_reverse_resv",map);
	   }
	   
	   public List<Bus_BusRoadDTO> listDispatch_resv_all_resv(int arrival,int departure){
		   java.util.Map<String,Object> map =new java.util.Hashtable<String,Object>();
		   
			  
		   map.put("arrival",arrival);
		   map.put("departure",departure);
		  
		   
		   return sqlSession.selectList("listDispatch_resv_all_resv",map);
	   }
	   
	   public List<Bus_BusRoadDTO> listDispatch_resv_all_reverse_resv(int arrival,int departure){
		   java.util.Map<String,Object> map =new java.util.Hashtable<String,Object>();
		   
			  
		   map.put("arrival",arrival);
		   map.put("departure",departure);
		  
		   
		   return sqlSession.selectList("listDispatch_resv_all_reverse_resv",map);
		   
	   }
	   
	   public Bus_BusRoadDTO resv_user_seat_select_resv(int road_no){
		   
	   return sqlSession.selectOne("resv_user_seat_select_resv",road_no);
	   }
	   
	   public int insertBus_resv_user_resv(BusResvDTO_resv dto){//bus_Resv 테이블 insert 후 결제하기 위해
		   java.util.Map<String,Object> map = new java.util.Hashtable<String,Object>();
		   map.put("bus_no",dto.getBus_no());
		   map.put("road_no",dto.getRoad_no());
		   map.put("seat",dto.getSeat());
		   map.put("resv_date",dto.getResv_date());
		   map.put("member_no",dto.getMember_no());
		   map.put("use_point",dto.getUse_point());
		   map.put("save_point",dto.getSave_point());
		   map.put("price",dto.getPrice());
		   
		   return sqlSession.insert("insertBus_resv_user_resv",map);
	   }
	   
	   public List<BusResvDTO_resv> list_seat_resv_user_resv(String resv_date,int road_no){//예약좌석 선택 못하게하기
		   java.util.Map<String,Object> map = new java.util.Hashtable<String,Object>();
		   map.put("resv_date",resv_date);
		   map.put("road_no",road_no);
		   return sqlSession.selectList("list_seat_resv_user_resv",map);
	   }
	   
	   public int bus_busroad_resv_count_resv(int arrival,int departure,String grade){//조인한 테이블 출발지,도착지,버스 등급 일치 한행 카운트
		   java.util.Map<String,Object> map = new java.util.Hashtable<String,Object>();
		   map.put("arrival",arrival);
		   map.put("departure",departure);
		   map.put("grade", grade);
		   return sqlSession.selectOne("bus_busroad_resv_count_resv",map);
	   }
	   public int bus_busroad_resv_resverse_count_resv(int arrival,int departure,String grade){//조인한 테이블 출발지,도착지,버스 등급 일치 한행 카운트(출발지 도착지 순서 변경)
		   java.util.Map<String,Object> map = new java.util.Hashtable<String,Object>();
		   map.put("arrival",arrival);
		   map.put("departure",departure);
		   map.put("grade", grade);
		   return sqlSession.selectOne("bus_busroad_resv_resverse_count_resv",map);
	   }
	   public int bus_busroad_resv_resverse_all_count_resv(int arrival,int departure){
		   java.util.Map<String,Object> map = new java.util.Hashtable<String,Object>();
		   map.put("arrival",arrival);
		   map.put("departure",departure);
		   return sqlSession.selectOne("bus_busroad_resv_resverse_all_count_resv",map);
	   }
	   
	   public int bus_busroad_resv_all_count_resv(int arrival,int departure){//조인한 테이블 출발지,도착지 일치 한행 카운트
		   java.util.Map<String,Object> map = new java.util.Hashtable<String,Object>();
		   map.put("arrival",arrival);
		   map.put("departure",departure);
		   
		   return sqlSession.selectOne("bus_busroad_resv_all_count_resv",map);
	   }
	   
	    
}
