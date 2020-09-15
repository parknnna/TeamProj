package team.Dproject.main.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.Dproject.main.model.hotelDTO;

@Service
public class HotelMapper {
	@Autowired
	private SqlSession sqlSession;

	public List<hotelDTO> listHotel(String mnum) {
		return sqlSession.selectList("listHotel",mnum);
	}
	public List<hotelDTO> listHotel() {
		return sqlSession.selectList("listHotel2");
	}

	public int insertHotel(hotelDTO dto) {
		return sqlSession.insert("insertHotel", dto);
	}

	public int deletetHotel(String no) {
		return sqlSession.insert("deleteHotel", no);
	}

	public hotelDTO getHotel(String no) {
		return sqlSession.selectOne("getHotel", no);
	}

	public int updateHotel(hotelDTO dto) {
		return sqlSession.insert("updateHotel", dto);
	}
}
