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
	
	public List<BoardDTO> board_list(int start, int end){
		java.util.Map<String, Object> map = new java.util.Hashtable<String, Object>();
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("board_list", map);
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
	
	public List<BoardDTO> getList(int start, int end ,int location_no){
		java.util.Map<String, Object> map = new java.util.Hashtable<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("location_no", location_no);
		return sqlSession.selectList("getList", map);	}
	
	public int board_update(BoardDTO dto) {
		return sqlSession.update("board_update", dto);
	}
	
	public int board_delete(int main_board_no) {
		return sqlSession.delete("board_delete", main_board_no);
	}
	
	public int prevNum(int main_board_no) {
		return sqlSession.selectOne("prevNum", main_board_no);
	}
	
	public int nextNum(int main_board_no) {
		return sqlSession.selectOne("nextNum", main_board_no);
	}
	
	public int MAX() {
		return sqlSession.selectOne("MAX");
	}
	
	public int MIN() {
		return sqlSession.selectOne("MIN");
	}
	
	public int board_count() {
		return sqlSession.selectOne("board_count");
	}
}
