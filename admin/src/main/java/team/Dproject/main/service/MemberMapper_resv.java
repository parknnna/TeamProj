package team.Dproject.main.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import team.Dproject.main.model.MemberDTO_resv;

@Service
public class MemberMapper_resv {
	@Autowired
	private SqlSession sqlSession;

	public int insertMember_resv(MemberDTO_resv dto) {
		int res = sqlSession.insert("insertMember_resv", dto);
		return res;

	}

	public boolean checkMember_resv(MemberDTO_resv dto) {
		java.util.Map<String, String> map = new java.util.Hashtable<String, String>();
		map.put("ssn1", dto.getSsn1());
		map.put("ssn2", dto.getSsn2());
		int res = sqlSession.selectOne("checkMember_resv", map);
		if (res < 3){
			return true;
			
		}else{
			return false;
			
		}
		
	}

	public boolean checkId_resv(MemberDTO_resv dto) {
		int res = sqlSession.selectOne("checkId_resv", dto.getId());
		if(res == 0){
			return true;
			
		}else{
			return false;
			
		}
		
	}

	public List<MemberDTO_resv> memberList_resv() {
		List<MemberDTO_resv> list = sqlSession.selectList("memberList_resv");
		return list;
		
	}

	public List<MemberDTO_resv> findMember_resv(String search, String searchString) {
		List<MemberDTO_resv> list = null;
		if(search.equals("id")){
			list = sqlSession.selectList("findMemberId_resv", searchString);
			
		}
		if(search.equals("name")){
			list = sqlSession.selectList("findMemberName_resv", searchString);
			
		}
		return list;
		
	}

	public int editMember_resv(MemberDTO_resv dto) {
		int res = sqlSession.update("editMember_resv", dto);
		return res;
		
	}

	public int memberLogin_resv(String id, String passwd) {
		String dbPasswd = sqlSession.selectOne("getMemberPasswd_resv", id);
		if(dbPasswd == null){
			return 2; //해당하는 아이디가 없음
			
		}else{
			if(dbPasswd.trim().equals(passwd)){
				return 0; // 로그인 성공
				
			}else{
				return 1; // 비밀번호가 틀림
				
			}
			
		}
		
	}

	public MemberDTO_resv getMember_resv(String id) {
		MemberDTO_resv dto = sqlSession.selectOne("getMember_resv", id);
		return dto;
		
	}



	public int deleteMember_resv(int member_no) {
		int res = sqlSession.delete("deleteMember_resv", member_no);
		return res;
	}

	public List<MemberDTO_resv> searchMemberId_resv(String searchString, String ssn1, String ssn2) {
		java.util.Map<String, String> map = new java.util.Hashtable<String, String>();
		map.put("searchString", searchString);
		map.put("ssn1", ssn1);
		map.put("ssn2", ssn2);
		List<MemberDTO_resv> list = sqlSession.selectList("searchMemberId_resv", map);
		return list;
		
	}

	public List<MemberDTO_resv> searchMemberPasswd_resv(String searchString, String ssn1, String ssn2) {
		java.util.Map<String, String> map = new java.util.Hashtable<String, String>();
		map.put("searchString", searchString);
		map.put("ssn1", ssn1);
		map.put("ssn2", ssn2);
		List<MemberDTO_resv> list = sqlSession.selectList("searchMemberPasswd_resv", map);
		return list;
		
	}

	public int Member_buspoint_update_resv(MemberDTO_resv dto){
		return sqlSession.update("Member_buspoint_update_resv",dto);
	}
	
}