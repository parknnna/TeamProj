package team.Dproject.main;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import team.Dproject.main.model.MemberDTO;
import team.Dproject.main.model.hotelDTO;
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
		String id = req.getParameter("id");
		String passwd = req.getParameter("passwd");
		String saveId = req.getParameter("saveId");
		int res = memberMapper.memberLogin(id, passwd);
		String msg = null, url = null;
		switch (res) {
		case 0:
			MemberDTO dto = memberMapper.getMember(id);
			HttpSession session = req.getSession();
			Cookie ck = new Cookie("id", id);
			if (saveId != null) {
				ck.setMaxAge(10 * 60);

			} else {
				ck.setMaxAge(0);

			}
			resp.addCookie(ck);
			session.setAttribute("sedto", dto);
			session.setAttribute("MNUM", dto.getMember_no());
			msg = dto.getName() + "�떂 �솚�쁺�빀�땲�떎. 硫붿씤�럹�씠吏�濡� �씠�룞�빀�땲�떎.";
			url = "index.do";
			break;

		case 1:
			msg = "鍮꾨�踰덊샇瑜� �옒紐� �엯�젰�븯�뀲�뒿�땲�떎. �떎�떆 �엯�젰�빐 二쇱꽭�슂";
			url = "member_login.do";
			break;

		case 2:
			msg = "�뾾�뒗 �븘�씠�뵒 �엯�땲�떎. �떎�떆 �솗�씤�븯�떆怨� �엯�젰�빐 二쇱꽭�슂";
			url = "member_login.do";
			break;

		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";

	}

	@RequestMapping(value = "/member_logout.do")
	public String MemberLogout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.removeAttribute("sedto");
		req.setAttribute("msg", "濡쒓렇�븘�썐 �릺�뿀�뒿�땲�떎. 硫붿씤�럹�씠吏�濡� �씠�룞�빀�땲�떎.");
		req.setAttribute("url", "index.do");
		return "message";

	}

	@RequestMapping(value = "/member_input.do")
	public String MemberInput() {
		return "member/member_input";

	}

	@RequestMapping(value = "/member_input_ok.do")
	public String MemberInputOk(HttpServletRequest req, MemberDTO dto, BindingResult result) {
		boolean checkMember = memberMapper.checkMember(dto);
		boolean isId;
		String msg = null, url = null;
		if (checkMember) {
			isId = memberMapper.checkId(dto);
			if (isId) {
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
				}
				dto.setFilename(filename);
				dto.setFilesize(filesize);
				int res = memberMapper.insertMember(dto);
				if (res > 0) {
					msg = "�쉶�썝媛��엯�꽦怨�! 濡쒓렇�씤 �럹�씠吏�濡� �씠�룞�빀�땲�떎.";
					url = "member_login.do";

				} else {
					msg = "�쉶�썝媛��엯�떎�뙣! 硫붿씤�럹�씠吏�濡� �씠�룞�빀�땲�떎.";
					url = "index.do";

				}

			} else {
				msg = "以묐났�맂 �븘�씠�뵒媛� �엳�뒿�땲�떎. �떎瑜� �븘�씠�뵒濡� 媛��엯�빐 二쇱꽭�슂";
				url = "member_input.do";

			}

		} else {
			msg = "�븘�씠�뵒媛� �꼫臾� 留롮뒿�땲�떎. 濡쒓렇�씤 �빐二쇱꽭�슂.";
			url = "member_login.do";

		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";

	}

	@RequestMapping(value = "/member_list.do")
	public String MemberList(HttpServletRequest req) {
		String mode = req.getParameter("mode");
		List<MemberDTO> list = null;
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

	}

	@RequestMapping(value = "/member_edit.do")
	public String MemberEdit(HttpServletRequest req) {
		String id = req.getParameter("id");
		MemberDTO dto = memberMapper.getMember(id);
		req.setAttribute("dto", dto);
		return "member/member_edit";

	}

	@RequestMapping(value = "/member_edit_ok.do")
	public String MemberEditOk(HttpServletRequest req, MemberDTO dto, BindingResult result) {
		String msg = null, url = null, mode = req.getParameter("mode");
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
		if (mode == null) {
			mode = "";

		}
		HttpSession session = req.getSession();
		int res = memberMapper.editMember(dto);
		if (res > 0) {
			session.removeAttribute("sedto");
			session.setAttribute("sedto", dto);
			if (mode.equals("mypage")) {
				msg = "�쉶�썝�닔�젙�꽦怨�! 留덉씠�럹�씠吏�濡� �씠�룞�빀�땲�떎.";
				url = "member_mypage.do";

			} else {
				msg = "�쉶�썝�닔�젙�꽦怨�! �쉶�썝紐⑸줉�쑝濡� �씠�룞�빀�땲�떎.";
				url = "member_list.do";

			}

		} else {
			if (mode.equals("mypage")) {
				msg = "�쉶�썝�닔�젙�떎�뙣! 留덉씠�럹�씠吏�濡� �씠�룞�빀�땲�떎.";
				url = "member_mypage.do";

			} else {
				msg = "�쉶�썝�닔�젙�떎�뙣! �쉶�썝�닔�젙�럹�씠吏�濡� �씠�룞�빀�땲�떎.";
				url = "member_edit.do?id=" + dto.getId();

			}

		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";

	}

	// 留덉씠�럹�씠吏� �씠�룞
	@RequestMapping(value = "/member_mypage.do")
	public String MemberMypage(HttpServletRequest req) {
		return "member/mypage";

	}

	// @RequestMapping(value = "/member_mypage.do")
	// public String MemberMypage(HttpServletRequest req){
	// return "mypage";
	//
	// }
	@RequestMapping(value = "/member_search.do")
	public String MemberSearch(HttpServletRequest req) {
		String mode = req.getParameter("mode");
		req.setAttribute("mode", mode);
		return "member/member_search";

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

	@RequestMapping(value = "/member_withdraw.do")
	public String MemberWithdraw(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("sedto");
		int res = memberMapper.deleteMember(dto.getMember_no());
		String msg = null, url = null;
		if (res > 0) {
			session.removeAttribute("sedto");
			msg = "회占쏙옙탈占쏜성곤옙! 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占싱듸옙占쌌니댐옙.";
			url = "index.do";

		} else {
			msg = "회占쏙옙탈占쏙옙占쏙옙占�! 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占싱듸옙占쌌니댐옙.";
			url = "index.do";

		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";

	}

	@RequestMapping(value = "/member_reserve.do")
	public String MemberReserve(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("sedto");
		List<hotelDTO> hotelList = memberMapper.getHotelReserve(dto.getMember_no());
		// List<BusDTO> busList = memberMapper.getReserve(dto.getMember_no());
		req.setAttribute("hotelList", hotelList);
		// req.setAttribute("busList", busList);
		return "member/member_reserve";

	}

}