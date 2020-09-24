package team.Dproject.main.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.Dproject.main.model.downDTO;


@Service
public class DownMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<downDTO> down_list(int member_no,int hotel_board_no) {
		java.util.Map<String,Object> map =new java.util.Hashtable<String,Object>();
		   
		map.put("member_no",member_no);
		map.put("hotel_board_no",hotel_board_no);
		
		return sqlSession.selectList("down_list",map);
	}
	public List<downDTO> down_list2(int member_no,int hotel_board_no) {
		java.util.Map<String,Object> map =new java.util.Hashtable<String,Object>();
		   
		map.put("member_no",member_no);
		map.put("hotel_board_no",hotel_board_no);
		
		return sqlSession.selectList("down_list2",map);
	}
	
	public int down_insert(int member_no,int hotel_board_no) {
		java.util.Map<String,Object> map =new java.util.Hashtable<String,Object>();
		   
		map.put("member_no",member_no);
		map.put("hotel_board_no",hotel_board_no);

		return sqlSession.insert("down_in", map);
	}
	
	public int down_delete(int member_no,int hotel_board_no) {
		java.util.Map<String,Object> map =new java.util.Hashtable<String,Object>();
		   
		map.put("member_no",member_no);
		map.put("hotel_board_no",hotel_board_no);

		return sqlSession.delete("down_del", map);
	}
	
}
