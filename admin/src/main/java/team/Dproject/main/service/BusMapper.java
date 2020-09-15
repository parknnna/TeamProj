package team.Dproject.main.service;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.Dproject.main.model.BusDTO;

@Service
public class BusMapper {
	@Autowired
	private SqlSession sqlSession;
	
	 public List<BusDTO> listBus(){
	      return sqlSession.selectList("listBus");
	 }
	 public List<BusDTO> bus_list_count(int start,int end){
		 java.util.Map<String,Object> map =new java.util.Hashtable<String,Object>();
		    map.put("start",start);
		    map.put("end",end);
		 return sqlSession.selectList("bus_list_count",map);
	 }
  public int insertBus(BusDTO dto){
	      return sqlSession.insert("insertBus",dto);
  }
  public int insertBus_normal(){
	  return sqlSession.insert("insertBus_normal");
  }
  public int deletetBus(int no){
	      return sqlSession.insert("deleteBus",no);
  }
  public BusDTO getBus(int no){
	   return sqlSession.selectOne("getBus",no);
  }
  public int updateBus(BusDTO dto){
	      return sqlSession.insert("updateBus",dto);
  }
  
  public int bus_count(){
	  return sqlSession.selectOne("bus_count");
  }
}
