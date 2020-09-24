package team.Dproject.main.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.Dproject.main.model.upDTO;


@Service
public class UpMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<upDTO> up_list(int member_no,int hotel_board_no) {
		java.util.Map<String,Object> map =new java.util.Hashtable<String,Object>();
		   
		map.put("member_no",member_no);
		map.put("hotel_board_no",hotel_board_no);
		
		return sqlSession.selectList("up_list",map);
	}
	
	public List<upDTO> up_list2(int member_no,int hotel_board_no) {
		java.util.Map<String,Object> map =new java.util.Hashtable<String,Object>();
		   
		map.put("member_no",member_no);
		map.put("hotel_board_no",hotel_board_no);
		
		return sqlSession.selectList("up_list2",map);
	}
	
	public int up_insert(int member_no,int hotel_board_no) {
		java.util.Map<String,Object> map =new java.util.Hashtable<String,Object>();
		   
		map.put("member_no",member_no);
		map.put("hotel_board_no",hotel_board_no);

		return sqlSession.insert("up_in", map);
	}
	
	public int up_delete(int member_no,int hotel_board_no) {
		java.util.Map<String,Object> map =new java.util.Hashtable<String,Object>();
		   
		map.put("member_no",member_no);
		map.put("hotel_board_no",hotel_board_no);

		return sqlSession.delete("up_del", map);
	}
	
}
