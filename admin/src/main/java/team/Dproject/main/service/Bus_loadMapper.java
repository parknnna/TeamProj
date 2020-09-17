package team.Dproject.main.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.Dproject.main.model.bus_loadDTO;



@Service
public class Bus_loadMapper {
   
   @Autowired
   private SqlSession sqlSession;
   
   public List<bus_loadDTO> listBus_load(){
	      return sqlSession.selectList("listBus_load1");
   }
   public int insertBus_load(bus_loadDTO dto){
	      return sqlSession.insert("insertBus_load1",dto);
   }
   public int deletetBus_load(String no){
	      return sqlSession.insert("deleteBus_load1",no);
   }
   public bus_loadDTO getBus_load(String no){
	   return sqlSession.selectOne("getBus_load1",no);
   }
   public int updateBus_load(bus_loadDTO dto){
	      return sqlSession.insert("updateBus_load1",dto);
   }
   

}