package team.Dproject.main;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import team.Dproject.main.model.MemberDTO;
import team.Dproject.main.model.hotelDTO_resv_ysm;
import team.Dproject.main.service.MemberMapper;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {
	@Autowired
	private MemberMapper memberMapper;

	@Resource(name = "upLoadPath")
	private String upLoadPath;

	@RequestMapping(value = "/index.do")
	public String main() {
		return "index";

	}

	@RequestMapping(value = "/member_login.do")
	public String MemberLogin(HttpServletRequest req) {
		Cookie[] cks = req.getCookies();
		String value = null;
		if (cks != null && cks.length != 0) {
			for (int i = 0; i < cks.length; ++i) {
				String name = cks[i].getName();
				if (name.equals("id")) {
					value = cks[i].getValue();
					break;

				}

			}

		}
		req.setAttribute("value", value);
		return "member/member_login";

	}

	@RequestMapping(value = "/member_login_ok.do")
	public String MemberLoginOk(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		String id = req.getParameter("id");
		String passwd = req.getParameter("passwd");
		String saveId = req.getParameter("saveId");
		MemberDTO dto = memberMapper.getMember(id);
		String msg = null, url = null;
		if(dto == null){
			msg = "해당하는 아이디가 없습니다.";
			url = "member_login.do";
						
		}else if(!(dto.getPasswd().equals(passwd))){
			msg = "비밀번호를 잘못 입력하였습니다.";
			url = "member_login.do";
			
		}else{
			Cookie ck = new Cookie("id", id);
			if (saveId != null) {
				ck.setMaxAge(10 * 60);

			} else {
				ck.setMaxAge(0);

			}
			resp.addCookie(ck);
			session.setAttribute("sedto", dto);
			session.setAttribute("MNUM", dto.getMember_no());
			msg = dto.getName() + "님 환영합니다. 메인페이지로 이동합니다.";
			url = "index.do";
			
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";

	}

	@RequestMapping(value = "/member_logout.do")
	public String MemberLogout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.removeAttribute("sedto");
		session.removeAttribute("MNUM");
		req.setAttribute("msg", "로그아웃 되었습니다. 메인페이지로 이동합니다.");
		req.setAttribute("url", "index.do");
		return "message";

	}

	@RequestMapping(value = "/member_input.do")
	public String MemberInput(HttpServletRequest req) {
		req.setAttribute("idck", 0);
		return "member/member_input";

	}
	
	 @RequestMapping("/idcheck.do")
	    @ResponseBody
	    public boolean idcheck(@RequestBody String id, HttpServletRequest req) {
	        boolean data = memberMapper.idcheck(id);
	        req.setAttribute("idck", 1);
	        return data;
	        
	    }

	@RequestMapping(value = "/member_input_ok.do")
	public String MemberInputOk(HttpServletRequest req, MemberDTO dto, BindingResult result) {
		boolean checkMember = memberMapper.checkMember(dto);
		String msg = null, url = null;
		if (checkMember) {
			String filename = "";
			int filesize = 0;
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
			MultipartFile file = mr.getFile("filename");
			File target = new File(upLoadPath, file.getOriginalFilename());
			if (file.getSize() > 0) {
				try {
					file.transferTo(target);
				} catch (IOException e) {
				}
				filename = file.getOriginalFilename();
				filesize = (int) file.getSize();
			}else{
				if(dto.getSex() == 0){
					filename = "male.jpg";
					
				}else{
					filename = "female.jpg";
					
				}
				
			}
			dto.setFilename(filename);
			dto.setFilesize(filesize);
			int res = memberMapper.insertMember(dto);
			if (res > 0) {
				msg = "회원가입성공! 로그인 페이지로 이동합니다.";
				url = "member_login.do";

			} else {
				msg = "회원가입실패! 메인페이지로 이동합니다.";
				url = "index.do";

			}
			
		} else {
			msg = "아이디가 너무 많습니다. 로그인 해주세요.";
			url = "member_login.do";

		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";

	}

	@RequestMapping(value = "/member_list.do")
	public String MemberList(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("sedto");
		String mode = req.getParameter("mode");
		List<MemberDTO> list = null;
		if(dto.getPosition() == 0){
			if (mode == null) {
				mode = "all";

			}
			if (mode.equals("all")) {
				list = memberMapper.memberList();

			} else {
				String search = req.getParameter("search");
				String searchString = req.getParameter("searchString");
				if (search == null) {
					search = "id";

				}
				if (searchString == null) {
					searchString = "";

				}
				list = memberMapper.findMember(search, searchString);

			}
			req.setAttribute("memberList", list);
			req.setAttribute("mode", mode);
			return "member/member_list";
			
		}else{
			req.setAttribute("msg", "관리자만 볼 수 있는 페이지 입니다");
			req.setAttribute("url", "index.do");
			return "message";
			
		}

	}

	@RequestMapping(value = "/member_edit.do")
	public String MemberEdit(HttpServletRequest req) {
		String id = req.getParameter("id");
		MemberDTO dto = memberMapper.getMember(id);
		if(dto == null){
			req.setAttribute("msg", "회원 정보가 없습니다");
			req.setAttribute("url", "member/member_list");
			return "message";
			
		}
		req.setAttribute("dto", dto);
		return "member/member_edit";

	}

	@RequestMapping(value = "/member_edit_ok.do")
	public String MemberEditOk(HttpServletRequest req, MemberDTO dto, BindingResult result) {
		String msg = null, url = null, mode = req.getParameter("mode");
		HttpSession session = req.getSession();
		String filename = dto.getFilename();
		int filesize =dto.getFilesize();
		
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile file = mr.getFile("new_filename");
		File target = new File(upLoadPath, file.getOriginalFilename());
		if (file.getSize() > 0){
			try{
				file.transferTo(target);
				
			}catch(IOException e){}
			filename = file.getOriginalFilename();
			filesize = (int)file.getSize();
			dto.setFilename(filename);
			dto.setFilesize(filesize);
		}else if(dto.getFilename() == null){
			dto.setFilename("파일없음");
			dto.setFilesize(0);
			
		}
		int res = memberMapper.editMember(dto);
		if (res > 0) {
			session.removeAttribute("sedto");
			session.setAttribute("sedto", dto);
			if (mode.equals("mypage")) {
				msg = "회원수정성공! 마이페이지로 이동합니다.";
				url = "member_mypage.do";

			} else {
				msg = "회원수정성공! 회원목록으로 이동합니다.";
				url = "member_list.do";

			}

		} else {
			if (mode.equals("mypage")) {
				msg = "회원수정실패! 마이페이지로 이동합니다.";
				url = "member_mypage.do";

			} else {
				msg = "회원수정실패! 회원수정페이지로 이동합니다.";
				url = "member_edit.do?id=" + dto.getId();

			}

		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";

	}

	@RequestMapping(value = "/member_mypage.do")
	public String MemberMypage(HttpServletRequest req) {
		if((MemberDTO) req.getSession().getAttribute("sedto") == null){
			req.setAttribute("msg", "로그인 후 이용 가능한 페이지입니다.");
			req.setAttribute("url", "member_login.do");
			return "message";
			
		}
		return "member/mypage";

	}
	
	@RequestMapping(value = "/member_search.do")
	public String MemberSearch(HttpServletRequest req) {
		MemberDTO dto = (MemberDTO) req.getSession().getAttribute("sedto");
		if(dto.getPosition() == 0){
			String mode = req.getParameter("mode");
			req.setAttribute("mode", mode);
			return "member/member_search";
			
		}else{
			req.setAttribute("msg", "관리자만 볼 수 있는 페이지 입니다");
			req.setAttribute("url", "index.do");
			return "message";
			
		}

	}

	@RequestMapping(value = "/member_search_ok.do")
	public String MemberSearchOk(HttpServletRequest req) {
		String mode = req.getParameter("mode");
		String searchString = req.getParameter("searchString");
		String ssn1 = req.getParameter("ssn1");
		String ssn2 = req.getParameter("ssn2");
		List<MemberDTO> list = null;
		if (mode.equals("id")) {
			list = memberMapper.searchMemberId(searchString, ssn1, ssn2);

		}
		if (mode.equals("passwd")) {
			list = memberMapper.searchMemberPasswd(searchString, ssn1, ssn2);

		}
		req.setAttribute("searchList", list);
		req.setAttribute("mode", mode);
		return "member/searchResult";

	}

	@RequestMapping(value = "/member_delete.do")
	public String MemberDelete(HttpServletRequest req) {
		String mode = req.getParameter("mode");
		if(mode == null){
			mode = "";
			
		}
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("sedto");
		int res = 0;
		String msg = null, url = null;
		if(mode.equals("admin")){
			res = memberMapper.deleteMember(Integer.parseInt(req.getParameter("member_no")));
			if(res > 0){
				msg = "회원 삭제 성공! 회원목록으로 이동합니다.";
				url = "member_list.do";
				
			}else{
				msg = "회원 삭제 실패! 회원목록으로 이동합니다.";
				url = "member_list.do";
				
			}
			
		}else{
			String passwd = req.getParameter("passwd");
			if(passwd == null){
				msg = "비밀번호를 입력해주세요.";
				url = "member_mypage.do";
				
			}else if(passwd.equals(dto.getPasswd())){
				msg = "회원 탈퇴 성공! 메인 페이지로 이동합니다.";
				url = "index.do";
				
			}else{
				msg = "비밀번호를 잘못 입력하셨습니다. 다시 입력해주세요.";
				url = "member_mypage.do";
				
			}
			res = memberMapper.deleteMember(dto.getMember_no());
			if (res > 0) {
				session.removeAttribute("sedto");
				msg = "회원탈퇴성공! 메인페이지로 이동합니다.";
				url = "index.do";

			} else {
				msg = "회원탈퇴실패! 메인페이지로 이동합니다.";
				url = "index.do";

			}
			
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";

	}

	@RequestMapping(value = "/member_wishlist.do")
	public String MemberReserve(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("sedto");
		List<hotelDTO_resv_ysm> hotelList = memberMapper.getHotelReserve(dto.getMember_no());
		System.out.println(hotelList);
		req.setAttribute("List", hotelList);
		return "member/member_reserve";

	}
	
	@RequestMapping(value = "/member_reserve_ok.do")
	public String MemberReserveOk(HttpServletRequest req){
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("sedto");
		String[] value = req.getParameterValues("choose");
		List<hotelDTO_resv_ysm> hotelList = memberMapper.getHotelReserve(dto.getMember_no());
		List<hotelDTO_resv_ysm> hList = new ArrayList<hotelDTO_resv_ysm>();
		int total_price = 0;
		for(int i = 0 ; i < value.length ; i ++){
			for(hotelDTO_resv_ysm hdto : hotelList){
				if(hdto.getHotel_resv_no() == Integer.parseInt(value[i])){
					hList.add(hdto);
					total_price += hdto.getPrice();
					
				}
				
			}
			
		}
		req.setAttribute("List", hList);
		req.setAttribute("total_price", total_price);
		return "member/member_reserve_ok";
		
	}

}