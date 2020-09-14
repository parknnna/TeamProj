package team.Dproject.main.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.Dproject.main.model.hotel_boardDTO;

@Service
public class Hotel_boardMapper {

	@Autowired
	private SqlSession sqlSession;

	public List<hotel_boardDTO> listHotel_board(int start, int end ,int hotel_no) {
		java.util.Map<String, Object> map = new java.util.Hashtable<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("hotel_no", hotel_no);
		return sqlSession.selectList("listHotel_board", map);
	}
	
	public List<hotel_boardDTO> listHotel_board2(int start, int end ,int re_group) {
		java.util.Map<String, Object> map = new java.util.Hashtable<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("re_group", re_group);
		return sqlSession.selectList("listHotel_board2", map);
	}

	public int insertHotel_board(hotel_boardDTO dto) {
		return sqlSession.insert("insertHotel_board", dto);
	}

	public int deleteHotel_board(String no) {
		return sqlSession.delete("deleteHotel_board", no);
	}

	public hotel_boardDTO getHotel_board(String no) {
		return sqlSession.selectOne("getHotel_board", no);
	}

	public int updateHotel_board(hotel_boardDTO dto) {
		return sqlSession.update("updateHotel_board", dto);
	}

	public int hotel_board_count() {
		return sqlSession.selectOne("hotel_board_count");
	}
	public int hotel_board_count2(int re_group) {
		return sqlSession.selectOne("hotel_board_count2",re_group);
	}

	public int hotel_board_MAX() {
		return sqlSession.selectOne("hotel_board_MAX");
	}

	public int hotel_board_re_UP(int re_step,int re_group) {
		java.util.Map<String, Object> map = new java.util.Hashtable<String, Object>();
		map.put("re_step", re_step);
		map.put("re_group", re_group);
		return sqlSession.update("hotel_board_re_UP",map);
	}
	
	
	public int read_count(int hotel_board_no){
		return sqlSession.delete("read_count",hotel_board_no);
	}

}