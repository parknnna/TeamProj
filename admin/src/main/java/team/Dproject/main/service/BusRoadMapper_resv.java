package team.Dproject.main.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.Dproject.main.model.BusRoadDTO_resv;
import team.Dproject.main.model.Bus_BusRoadDTO;
import team.Dproject.main.model.Member_BusRoadDTO;


@Service
public class BusRoadMapper_resv {
	@Autowired
	private SqlSession sqlSession;
	
	 public List<BusRoadDTO_resv> listBus_road_resv(){
	      return sqlSession.selectList("listBus_road_resv");
	 }
	 public List<Bus_BusRoadDTO> bus_no_list_null_resv(){//사용중인 bus_no값 제외하고 출력
		 return sqlSession.selectList("bus_no_list_null_resv");
	 }
	
	 public int bus_no_list_null_count_resv(){//사용중이지 않은 bus_no 값 수 구하기
		 return sqlSession.selectOne("bus_no_list_null_count_resv");
	 }
	 public int bus_road_member_count_resv(){//버스 노선 행구하기
		 return sqlSession.selectOne("bus_road_member_count_resv");
	 }
	 public Bus_BusRoadDTO bus_no_null_rownum_resv(){//사용중이지 않은 bus_no 값중에 첫번째값
		 return sqlSession.selectOne("bus_no_null_rownum_resv");
	 }
	 
	 public List<Member_BusRoadDTO> bus_road_member_list_resv(){
		 
		 return sqlSession.selectList("bus_road_member_list_resv");
	 }
	 public List<Member_BusRoadDTO> bus_road_member_list_count_resv(int start,int end){//
		  java.util.Map<String,Object> map =new java.util.Hashtable<String,Object>();
		    map.put("start",start);
		    map.put("end",end);
		 return sqlSession.selectList("bus_road_member_list_count_resv",map);
	 }
	

  public int insertBus_road_resv(BusRoadDTO_resv dto){
	  
	  return sqlSession.insert("insertBus_road_resv",dto);
  }
  public int deletetBus_road_resv(int no){
	      return sqlSession.insert("deleteBus_road_resv",no);
  }
  public BusRoadDTO_resv getBus_road_resv(int no){
	   return sqlSession.selectOne("getBus_road_resv",no);
  }
  public BusRoadDTO_resv getBus_road_plus_resv(BusRoadDTO_resv dto){
	  return sqlSession.selectOne("getBus_road_plus_resv",dto);
  }
  public int updateBus_road_resv(BusRoadDTO_resv dto){
	      return sqlSession.insert("updateBus_road_resv",dto);
  }
}
