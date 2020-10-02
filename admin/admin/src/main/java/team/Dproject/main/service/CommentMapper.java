package team.Dproject.main.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.Dproject.main.model.CommentDTO;

@Service
public class CommentMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<CommentDTO> commentList(int main_board_no){
		return sqlSession.selectList("commentList", main_board_no);
	}
	
	public int commentCount() {
		return sqlSession.selectOne("commentCount");
	}
	
	public int commentInsert(CommentDTO dto) {
		return sqlSession.insert("commentInsert", dto);
	}
	
	public int commentUpdate(CommentDTO dto) {
		return sqlSession.update("commentUpdate", dto);
	}
	
	public int commentDelete(int cno) {
		return sqlSession.delete("commentDelete", cno);
	}
}
