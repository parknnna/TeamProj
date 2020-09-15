package team.Dproject.main.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.Dproject.main.model.bus_resvDTO;

@Service
public class Bus_resvMapper {
   
   @Autowired
   private SqlSession sqlSession;
   
   public List<bus_resvDTO> listBus_resv(){
	      return sqlSession.selectList("listBus_resv1");
   }
   public int insertBus_resv(bus_resvDTO dto){
	      return sqlSession.insert("insertBus_resv1",dto);
   }
   public int deletetBus_resv(String no){
	      return sqlSession.insert("deleteBus_resv1",no);
   }
   public bus_resvDTO getBus_resv(String no){
	   return sqlSession.selectOne("getBus_resv1",no);
   }
   public int updateBus_resv(bus_resvDTO dto){
	      return sqlSession.insert("updateBus_resv1",dto);
   }
    

}