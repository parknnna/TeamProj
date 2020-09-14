package team.Dproject.main.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.Dproject.main.model.BusStationDTO;

@Service
public class BusStaionMapper {
	@Autowired
	private SqlSession sqlSession;
	 
  public List<BusStationDTO> listBus_station(){
	      return sqlSession.selectList("listBus_station");
  }
  public int insertBus_station(BusStationDTO dto){
	      return sqlSession.insert("insertBus_station",dto);
  }
  public int deletetBus_station(String no){
	      return sqlSession.insert("deleteBus_station",no);
  }
  public BusStationDTO getBus_station(String no){
	   return sqlSession.selectOne("getBus_station",no);
  }
  public BusStationDTO getBus_station_name(String name){
	  return sqlSession.selectOne("getBus_station_name",name);
  }
  public BusStationDTO getBus_number(String name){
	  return sqlSession.selectOne("getBus_number",name);
  }
  public int updateBus_station(BusStationDTO dto){
	      return sqlSession.insert("updateBus_station",dto);
  }
  public List<BusStationDTO> find_station (String searchString){
	  return  sqlSession.selectList("find_station",searchString);
  }
}
