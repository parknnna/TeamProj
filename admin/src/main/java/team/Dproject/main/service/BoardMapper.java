package team.Dproject.main.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.Dproject.main.model.BoardDTO;
import team.Dproject.main.model.MemberDTO;

@Service
public class BoardMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<BoardDTO> board_list(){
		return sqlSession.selectList("board_list");
	}
	
	public int board_insert(BoardDTO dto) {
		return sqlSession.insert("board_insert", dto);
	}
	
	public BoardDTO getBoard(int main_board_no) {
		return sqlSession.selectOne("getBoard", main_board_no);
	}
	
	public MemberDTO getUser(int member_no) {
		return sqlSession.selectOne("getUser", member_no);
	}
	
	public int getCount(int main_board_no) {
		return sqlSession.update("getCount", main_board_no);
	}
}
