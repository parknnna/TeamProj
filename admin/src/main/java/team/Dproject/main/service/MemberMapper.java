package team.Dproject.main.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.Dproject.main.model.hotelDTO_resv_ysm;
import team.Dproject.main.model.MemberDTO;
import team.Dproject.main.model.MemberDTO_sm;
import team.Dproject.main.model.hotelDTO;

@Service
public class MemberMapper {
	@Autowired
	private SqlSession sqlSession;

	public int insertMember(MemberDTO dto) {
		int res = sqlSession.insert("insertMember", dto);
		return res;

	}

	public boolean checkMember(MemberDTO dto) {
		java.util.Map<String, String> map = new java.util.Hashtable<String, String>();
		map.put("ssn1", dto.getSsn1());
		map.put("ssn2", dto.getSsn2());
		int res = sqlSession.selectOne("checkMember", map);
		if (res < 3){
			return true;
			
		}else{
			return false;
			
		}
		
	}

	public boolean checkId(MemberDTO dto) {
		int res = sqlSession.selectOne("checkId", dto.getId());
		if(res == 0){
			return true;
			
		}else{
			return false;
			
		}
		
	}
	
	public List<MemberDTO> searchMemberId(String searchString, String ssn1, String ssn2) {
		java.util.Map<String, String> map = new java.util.Hashtable<String, String>();
		map.put("searchString", searchString);
		map.put("ssn1", ssn1);
		map.put("ssn2", ssn2);
		List<MemberDTO> list = sqlSession.selectList("searchMemberId", map);
		return list;
		
	}
	
	public List<MemberDTO> searchMemberPasswd(String searchString, String ssn1, String ssn2) {
		java.util.Map<String, String> map = new java.util.Hashtable<String, String>();
		map.put("searchString", searchString);
		map.put("ssn1", ssn1);
		map.put("ssn2", ssn2);
		List<MemberDTO> list = sqlSession.selectList("searchMemberPasswd", map);
		return list;
		
	}
	
	public List<hotelDTO_resv_ysm> getHotelReserve(int member_no) {
		List<hotelDTO_resv_ysm> list = sqlSession.selectList("getHotelReserve", member_no);
		if(list == null){
			
		}
		return list;
		
	}

	public int deleteMember(int member_no) {
		return sqlSession.delete("deleteMember", member_no);
		
	}

	public List<MemberDTO> memberList() {
		
		List<MemberDTO> list = sqlSession.selectList("memberList");
		return list;
		
	}

	public List<MemberDTO> findMember(String search, String searchString) {
		List<MemberDTO> list = null;
		if(search.equals("id")){
			list = sqlSession.selectList("findMemberId", searchString);
			
		}else if(search.equals("name")){
			list = sqlSession.selectList("findMemberName", searchString);
			
		}else{
			list = null;
			
		}
		return list;
		
	}

	public int editMember(MemberDTO dto) {
		int res = sqlSession.update("editMember", dto);
		return res;
		
	}

	public int memberLogin(String id, String passwd) {
		MemberDTO dto = sqlSession.selectOne("getMemberPasswd", id);
		if(dto == null){
			return 1;//아이디 없음
			
		}else{
			if(dto.getPasswd().equals(passwd)){
				return 0;//로그인 성공
				
			}else{
				return 1;//비밀번호 틀림
				
			}
			
		}
		
	}

	public MemberDTO getMember(String id) {
		return sqlSession.selectOne("getMember", id);
		
	}
	
	public List<MemberDTO> getPosition(String posistion) {
		List<MemberDTO> list = sqlSession.selectList("getPosition",posistion);
		return list;	
		
	}

	public List<MemberDTO> searchMember(String mode, String searchString, String ssn1, String ssn2) {
		java.util.Map<String, String> map = new java.util.Hashtable<String, String>();
		map.put("search", mode);
		map.put("searchString", searchString.trim());
		map.put("ssn1", ssn1);
		map.put("ssn2", ssn2);
		List<MemberDTO> list = sqlSession.selectList("searchMember", map);
		return list;
	}
	
	public int Member_buspoint_update(MemberDTO dto){
		return sqlSession.update("Member_buspoint_update",dto);
	}

	public MemberDTO_sm getMember2(String parameter) {
		return sqlSession.selectOne("getMember2", parameter);
		
	}
	
}
