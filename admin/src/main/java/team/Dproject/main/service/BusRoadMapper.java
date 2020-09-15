package team.Dproject.main.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.Dproject.main.model.BusRoadDTO;
import team.Dproject.main.model.Bus_BusRoadDTO;
import team.Dproject.main.model.Member_BusRoadDTO;


@Service
public class BusRoadMapper {
	@Autowired
	private SqlSession sqlSession;
	
	 public List<BusRoadDTO> listBus_road(){
	      return sqlSession.selectList("listBus_road");
	 }
	 public List<Bus_BusRoadDTO> bus_no_list_null(){//������� bus_no�� �����ϰ� ���
		 return sqlSession.selectList("bus_no_list_null");
	 }
	
	 public int bus_no_list_null_count(){//��������� ���� bus_no �� �� ���ϱ�
		 return sqlSession.selectOne("bus_no_list_null_count");
	 }
	 public int bus_road_member_count(){//���� �뼱 �౸�ϱ�
		 return sqlSession.selectOne("bus_road_member_count");
	 }
	 public Bus_BusRoadDTO bus_no_null_rownum(){//��������� ���� bus_no ���߿� ù��°��
		 return sqlSession.selectOne("bus_no_null_rownum");
	 }
	 
	 public List<Member_BusRoadDTO> bus_road_member_list(){
		 
		 return sqlSession.selectList("bus_road_member_list");
	 }
	 public List<Member_BusRoadDTO> bus_road_member_list_count(int start,int end){//
		  java.util.Map<String,Object> map =new java.util.Hashtable<String,Object>();
		    map.put("start",start);
		    map.put("end",end);
		 return sqlSession.selectList("bus_road_member_list_count",map);
	 }
	

  public int insertBus_road(BusRoadDTO dto){
	  
	  return sqlSession.insert("insertBus_road",dto);
  }
  public int deletetBus_road(int no){
	      return sqlSession.insert("deleteBus_road",no);
  }
  public BusRoadDTO getBus_road(int no){
	   return sqlSession.selectOne("getBus_road",no);
  }
  public BusRoadDTO getBus_road_plus(BusRoadDTO dto){
	  return sqlSession.selectOne("getBus_road_plus",dto);
  }
  public int updateBus_road(BusRoadDTO dto){
	      return sqlSession.insert("updateBus_road",dto);
  }
}
