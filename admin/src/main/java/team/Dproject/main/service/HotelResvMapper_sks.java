package team.Dproject.main.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.Dproject.main.model.HotelResvDTO_sks;

@Service
public class HotelResvMapper_sks {
	@Autowired
	private SqlSession sqlSession;
	
	public int insertHotelResv_sks(HotelResvDTO_sks dto){
		
		return sqlSession.insert("insertHotelResv_sks", dto);
	}
	
	public List<HotelResvDTO_sks> getHotelResv_sks(int member_no){
		return sqlSession.selectList("getHotelResv_sks", member_no);
	}
}
