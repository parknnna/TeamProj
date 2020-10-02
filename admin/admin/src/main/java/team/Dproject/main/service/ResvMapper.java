package team.Dproject.main.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.Dproject.main.model.resvDTO;





@Service
public class ResvMapper {
	@Autowired
	private SqlSession sqlSession;

	public List<resvDTO> listResv(int hnum) {
		return sqlSession.selectList("listHotel_resv",hnum);
	}

	public int insertResv(resvDTO dto) {
		return sqlSession.insert("insertHotel_resv", dto);
	}

	public int deletetResv(String no) {
		return sqlSession.insert("deleteHotel_resv", no);
	}

	public resvDTO getResv(String no) {
		return sqlSession.selectOne("getHotel_resv", no);
	}

	public int updateResv(resvDTO dto) {
		return sqlSession.insert("updateHotel_resv", dto);
	}
}
