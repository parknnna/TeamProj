package team.Dproject.main.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.Dproject.main.model.MemberDTO_sks;

import java.util.*;

@Service
public class MemberMapper_sks {
	
	@Autowired
	private SqlSession sqlSession;
	
	public boolean checkMember_sks(String ssn1, String ssn2){
		java.util.Map<String,String> map = new java.util.Hashtable<String,String>();
		map.put("ssn1", ssn1);
		map.put("ssn2", ssn2);
		MemberDTO_sks dto = sqlSession.selectOne("checkMember_sks",map);
		if(dto==null)return false;
		return true;
		
	}
	
	public int insertMember_sks(MemberDTO_sks dto, int sex){
		dto.setPosition(3);
		dto.setPoint(0);
		dto.setSex(sex);
		int res = sqlSession.insert("insertMember_sks",dto);
		//sqlSession.commit();
		//db에 추가,삭제,수정을 할 때 session.commit을 해줘야 한다.
		//만약 예를 들어 승인 후 가입이면 승인처리 한 후 commit을 써줘야한다. 단 session.close를 하면 commit이 안된다.
		return res;
    }
	public List<MemberDTO_sks> listMember_sks(){
		return sqlSession.selectList("listMember_sks");
	}
	
	public MemberDTO_sks getMember_sks(int member_no){
		return sqlSession.selectOne("getMember_sks",member_no);
	}
	
	public int memberLogin_sks(String id, String passwd) {
		String dbPasswd = sqlSession.selectOne("getMemberPasswd_sks", id);
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

	public MemberDTO_sks getMember1_sks(String id) {
		MemberDTO_sks dto = sqlSession.selectOne("getMember1_sks", id);
		return dto;
		
	}
}
























