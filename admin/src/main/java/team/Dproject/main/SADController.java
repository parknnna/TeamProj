package team.Dproject.main;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import team.Dproject.main.model.MemberDTO;
import team.Dproject.main.model.hotelDTO;
import team.Dproject.main.service.HotelMapper;
import team.Dproject.main.service.MemberMapper;
import team.Dproject.main.service.ResvMapper;
import team.Dproject.main.service.RoomMapper;

@Controller
public class SADController {
	@Autowired
	private HotelMapper hotelMapper;
	@Autowired
	private MemberMapper memberMapper;
	
	
	
	
	
	//================濡쒓렇�씤==========================
	@RequestMapping(value = "/ADmember_login.do")
	public String MemberLogin(HttpServletRequest req){
		Cookie[] cks = req.getCookies();
		String value = null;
		if (cks != null && cks.length != 0){
			for(int i=0; i<cks.length; ++i){
				String name = cks[i].getName();
				if (name.equals("id")){
					value = cks[i].getValue();
					break;				
				}			
			}	
		}
		req.setAttribute("value", value);
		return "member_login";	
	}
	@RequestMapping(value = "/ADmember_login_ok.do")
	public String MemberLoginOk(HttpServletRequest req, HttpServletResponse resp){
		String id = req.getParameter("id");
		String passwd = req.getParameter("passwd");
		String saveId = req.getParameter("saveId");
		int res = memberMapper.memberLogin(id, passwd);
		String msg = null, url = null;
		switch(res){
		case 0 :
			MemberDTO dto = memberMapper.getMember(id);
			HttpSession session = req.getSession();
			Cookie ck = new Cookie("id", id);
			if(saveId != null){
				ck.setMaxAge(10*60);		
			}else{
				ck.setMaxAge(0);	
			}
			resp.addCookie(ck);
			session.setAttribute("sedto", dto);
			session.setAttribute("MNUM", dto.getMember_no());
			msg = dto.getName() + "�떂 濡쒓렇�씤�셿猷�.";
			url = "home.do";
			break;
			
		case 1 :
			msg = "濡쒓렇�씤�떎�뙣";
			url = "home.do";
			break;
			
		case 2 :
			msg = "濡쒓렇�씤�떎�뙣";
			url = "home.do";
			break;
		
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
		
		
	}
	@RequestMapping(value = "/ADmember_logout.do")
	public String MemberLogout(HttpServletRequest req){
		HttpSession session = req.getSession();
		session.removeAttribute("sedto");
		session.removeAttribute("MNUM");
		req.setAttribute("msg", "濡쒓렇�븘�썐.");
		req.setAttribute("url", "home.do");
		return "message";
		
	}
	
	
	
	
	
	//================濡쒓렇�씤==========================
	

	@RequestMapping(value = "/ADsuperAD.do")
	public String SuperAD(HttpServletRequest req) {
		req.setAttribute("page_name", "Super Admin");
		return "SuperAD/SAD_main";
	}

	@RequestMapping(value = "/ADmember_list.do")
	public ModelAndView MemberList(HttpServletRequest req) {
		req.setAttribute("page_name", "Member List");
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
			list = memberMapper.findMember(search, searchString);
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("SuperAD/member/member_list");
		mav.addObject("memberList", list);
		mav.addObject("mode", mode);
		return mav;
	}

	@RequestMapping(value = "/ADmember_edit.do")
	public String MemberEdit(HttpServletRequest req) {
		String id = req.getParameter("id");
		MemberDTO dto = memberMapper.getMember(id);
		req.setAttribute("dto", dto);
		req.setAttribute("page_name", "Member Update");
		return "SuperAD/member/member_edit";

	}

	@RequestMapping(value = "/ADmember_edit_ok.do")
	public String MemberEditOk(HttpServletRequest req, MemberDTO dto) {
		String msg = null, url = null;
		String mode = req.getParameter("mode");
		if (mode == null) {
			mode = "";
		}
		HttpSession session = req.getSession();
		int res = memberMapper.editMember(dto);
		if (res > 0) {
			if (mode.equals("mypage")) {
				session.removeAttribute("sedto");
				session.setAttribute("sedto", dto);
				msg = "�쉶�썝�닔�젙�꽦怨�! 留덉씠�럹�씠吏�濡� �씠�룞�빀�땲�떎.";
				url = "ADmember_list.do";

			} else {
				msg = "�쉶�썝�닔�젙�꽦怨�! �쉶�썝紐⑸줉�쑝濡� �씠�룞�빀�땲�떎.";
				url = "ADmember_list.do";
			}
		} else {
			if (mode.equals("mypage")) {
				msg = "�쉶�썝�닔�젙�떎�뙣! 留덉씠�럹�씠吏�濡� �씠�룞�빀�땲�떎.";
				url = "ADmember_list.do";

			} else {
				msg = "�쉶�썝�닔�젙�떎�뙣! �쉶�썝�닔�젙�럹�씠吏�濡� �씠�룞�빀�땲�떎.";
				url = "ADmember_list.do?id=" + dto.getId();

			}

		}
		req.setAttribute("page_name", "Member List");
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}

	@RequestMapping(value = "/ADmember_input.do")
	public String MemberInput(HttpServletRequest req) {
		req.setAttribute("page_name", "Member Insert");
		return "SuperAD/member/member_input";

	}

	@RequestMapping(value = "/ADmember_input_ok.do")
	public String MemberInputOk(HttpServletRequest req, MemberDTO dto) {
		boolean checkMember = memberMapper.checkMember(dto);
		boolean isId;
		String msg = null, url = null;
		if (checkMember) {
			isId = memberMapper.checkId(dto);
			if (isId) {
				int res = memberMapper.insertMember(dto);
				if (res > 0) {
					msg = "�쉶�썝媛��엯�꽦怨�! 濡쒓렇�씤 �럹�씠吏�濡� �씠�룞�빀�땲�떎.";
					url = "ADmember_list.do";

				} else {
					msg = "�쉶�썝媛��엯�떎�뙣! 硫붿씤�럹�씠吏�濡� �씠�룞�빀�땲�떎.";
					url = "ADmember_list.do";

				}

			} else {
				msg = "以묐났�맂 �븘�씠�뵒媛� �엳�뒿�땲�떎. �떎瑜� �븘�씠�뵒濡� 媛��엯�빐 二쇱꽭�슂";
				url = "ADmember_input.do";

			}

		} else {
			msg = "�븘�씠�뵒媛� �꼫臾� 留롮뒿�땲�떎. 濡쒓렇�씤 �빐二쇱꽭�슂.";
			url = "ADmember_list.do";

		}
		req.setAttribute("page_name", "Super Admin");
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";

	}

	@RequestMapping(value = "/ADmember_show.do")
	public ModelAndView Member_show(HttpServletRequest req) {
		MemberDTO dto = memberMapper.getMember2(req.getParameter("no")); 

		ModelAndView mav = new ModelAndView();
		mav.setViewName("SuperAD/member/member_show");
		req.setAttribute("page_name", "Member Show");
		mav.addObject("dto", dto);
		return mav;
	}

	// ---------------------------------------------------------------------------
	// ---------------------------------------------------------------------------
	// ---------------------------------------------------------------------------
	@RequestMapping(value = "/ADBAD_list.do")
	public ModelAndView Member_ADBAD(HttpServletRequest req) {
		List<MemberDTO> list = memberMapper.getPosition(req.getParameter("pos"));
		ModelAndView mav = new ModelAndView();
		mav.setViewName("SuperAD/BAD/BAD_list");
		req.setAttribute("page_name", "Bus List");
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping(value = "/ADHAD_list.do")
	public ModelAndView Member_ADHAD(HttpServletRequest req) {
		List<MemberDTO> list = memberMapper.getPosition(req.getParameter("pos"));
		ModelAndView mav = new ModelAndView();
		mav.setViewName("SuperAD/HAD/HAD_list");
		req.setAttribute("page_name", "Hotel List");
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping("/ADHADhotel_list.do")
	public ModelAndView hotel_list(HttpServletRequest req, HttpSession session) {
		
		String MNUM = req.getParameter("no");
		List<hotelDTO> list = hotelMapper.listHotel(MNUM);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("SuperAD/HAD/Hotel");
		req.setAttribute("page_name", "Hotel List");
		mav.addObject("list", list);
		return mav;
	}
	@RequestMapping("/ADBADbus_list.do")
	public String botel_list(HttpServletRequest req, HttpSession session) {
		return "SuperAD/BAD/Bus";
	}

}