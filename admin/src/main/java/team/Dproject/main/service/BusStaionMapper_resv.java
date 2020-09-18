package team.Dproject.main.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.Dproject.main.model.BusStationDTO_resv;

@Service
public class BusStaionMapper_resv {
	@Autowired
	private SqlSession sqlSession;
	 
  public List<BusStationDTO_resv> listBus_station_resv(){
	      return sqlSession.selectList("listBus_station_resv");
  }
  public int insertBus_station_resv(BusStationDTO_resv dto){
	      return sqlSession.insert("insertBus_station_resv",dto);
  }
  public int deletetBus_station_resv(String no){
	      return sqlSession.insert("deleteBus_station_resv",no);
  }
  public BusStationDTO_resv getBus_station_resv(String no){
	   return sqlSession.selectOne("getBus_station_resv",no);
  }
  public BusStationDTO_resv getBus_station_name_resv(String name){
	  return sqlSession.selectOne("getBus_station_name_resv",name);
  }
  public BusStationDTO_resv getBus_number_resv(String name){
	  return sqlSession.selectOne("getBus_number_resv",name);
  }
  public int updateBus_station_resv(BusStationDTO_resv dto){
	      return sqlSession.insert("updateBus_station_resv",dto);
  }
  public List<BusStationDTO_resv> find_station_resv (String searchString){
	  return  sqlSession.selectList("find_station_resv",searchString);
  }
  
  public BusStationDTO_resv getBus_station_search_resv(int search){//station_no 값을 station_name 으로변경(main에서)
	  
	  return sqlSession.selectOne("getBus_station_search_resv",search);
  }
}
