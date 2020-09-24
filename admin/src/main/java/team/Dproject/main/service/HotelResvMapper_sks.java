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
	
	public HotelResvDTO_sks getHotelResv_sks(int member_no,int hotel_resv_no){
		java.util.Map<String, Object> map=new java.util.Hashtable<String, Object>();
		map.put("member_no", member_no);
		map.put("hotel_resv_no", hotel_resv_no);
		return sqlSession.selectOne("getHotelResv_sks", map);
	}
	
	public List<String> checkResvRoomno_sks(String start_resv_date,String end_resv_date,int hotel_no){
		java.util.Map<String, Object> map=new java.util.Hashtable<String, Object>();
			map.put("start_resv_date", start_resv_date);
			map.put("end_resv_date", end_resv_date);
			map.put("hotel_no", hotel_no);
			return sqlSession.selectList("checkResvRoomno_sks", map);
	}
	
	public List<Integer> getHotelResvNo_sks(int member_no){
		return sqlSession.selectList("getHotelResvNo_sks",member_no);
	}
	
	public int deleteHotelResv_sks(int member_no,int hotel_resv_no){
		java.util.Map<String, Object> map=new java.util.Hashtable<String, Object>();
		map.put("member_no", member_no);
		map.put("hotel_resv_no", hotel_resv_no);
	    return sqlSession.insert("deleteHotelResv_sks",map);
	}
}
