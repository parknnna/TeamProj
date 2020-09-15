package team.Dproject.main.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.Dproject.main.model.bus_stationDTO;

@Service
public class Bus_stationMapper {
   
   @Autowired
   private SqlSession sqlSession;
   
   public List<bus_stationDTO> listBus_station(){
	      return sqlSession.selectList("listBus_station1");
   }
   public int insertBus_station(bus_stationDTO dto){
	      return sqlSession.insert("insertBus_station1",dto);
   }
   public int deletetBus_station(String no){
	 return sqlSession.insert("deleteBus_station1",no);
   }
   public bus_stationDTO getBus_station(String no){
	   return sqlSession.selectOne("getBus_station1",no);
   }
   public int updateBus_station(bus_stationDTO dto){
	      return sqlSession.insert("updateBus_station1",dto);
   }
    

}