package team.Dproject.main.service;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.Dproject.main.model.BusDTO_resv;

@Service
public class BusMapper_resv {
	@Autowired
	private SqlSession sqlSession;
	
	 public List<BusDTO_resv> listBus_resv(){
	      return sqlSession.selectList("listBus_resv");
	 }
	 public List<BusDTO_resv> bus_list_count_resv(int start,int end){
		 java.util.Map<String,Object> map =new java.util.Hashtable<String,Object>();
		    map.put("start",start);
		    map.put("end",end);
		 return sqlSession.selectList("bus_list_count_resv",map);
	 }
  public int insertBus_resv(BusDTO_resv dto){
	      return sqlSession.insert("insertBus_resv",dto);
  }
  public int insertBus_normal_resv(){
	  return sqlSession.insert("insertBus_normal_resv");
  }
  public int deletetBus_resv(int no){
	      return sqlSession.insert("deleteBus_resv",no);
  }
  public BusDTO_resv getBus_resv(int no){
	   return sqlSession.selectOne("getBus_resv",no);
  }
  public int updateBus_resv(BusDTO_resv dto){
	      return sqlSession.insert("updateBus_resv",dto);
  }
  
  public int bus_count_resv(){//버스 리스트 행의 갯수 출력
	  return sqlSession.selectOne("bus_count_resv");
  }
}
