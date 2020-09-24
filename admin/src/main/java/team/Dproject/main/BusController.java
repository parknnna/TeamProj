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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import team.Dproject.main.model.BusDTO_resv;
import team.Dproject.main.model.BusResvDTO_resv;
import team.Dproject.main.model.BusResv_BusRoadDTO;
import team.Dproject.main.model.BusRoadDTO_resv;
import team.Dproject.main.model.BusStationDTO_resv;
import team.Dproject.main.model.Bus_BusRoadDTO;
import team.Dproject.main.model.HotelDTO_sks;
import team.Dproject.main.model.MemberDTO;
import team.Dproject.main.model.Member_BusRoadDTO;
import team.Dproject.main.service.BusMapper_resv;
import team.Dproject.main.service.BusResvMapper_resv;
import team.Dproject.main.service.BusRoadMapper_resv;
import team.Dproject.main.service.BusStaionMapper_resv;
import team.Dproject.main.service.MemberMapper;


@Controller
public class BusController {
	@Autowired
	private MemberMapper memberMapper; //로그인용으로만 사용하는 mapper (메인과 버스페이지들어갈시 dto 타입잉 안맞아 에러남)
	@Autowired
	private BusMapper_resv busMapper_resv;
	@Autowired
	private BusStaionMapper_resv busStationMapper_resv;
	@Autowired
	private BusRoadMapper_resv busRoadMapper_resv;
	@Autowired
	private BusResvMapper_resv busResvMapper_resv;
	@Resource(name="upLoadPath")
	private String upLoadPath;
	
	@RequestMapping(value = "/bus_main.do", method = RequestMethod.GET)
	
	public ModelAndView Bus_Main(BusStationDTO_resv sdto){
		ModelAndView mav = new ModelAndView();	
		List<BusStationDTO_resv> slist =  busStationMapper_resv.listBus_station_resv();
		mav.addObject("slist",slist);
		mav.setViewName("/bus_user/bus_main/bus_main");
		return mav;
	
	}
	@RequestMapping(value = "/bus_mainOk.do", method = RequestMethod.GET)
	public ModelAndView Bus_MainOk(HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		int search= (Integer.parseInt(req.getParameter("search")));
		int pageSize=10;
		String pageNum=req.getParameter("pageNum");
		if(pageNum==null){
			pageNum="1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = currentPage * pageSize - (pageSize-1);
		int endRow = currentPage * pageSize;
		int count = 0;
		count=busRoadMapper_resv.bus_road_count_resv(search);
		if(endRow>count){
			endRow=count;
		}
		
		List<BusStationDTO_resv> slist =  busStationMapper_resv.listBus_station_resv();
		List<BusRoadDTO_resv> brlist = busRoadMapper_resv.bus_road_list_count_resv(search, startRow, endRow);
		int startNum = count-((currentPage-1)*pageSize);
		int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
		int pageBlock = 5;
		int startPage = (currentPage-1)/pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage>pageCount) endPage = pageCount;
		//List<BusRoadDTO_resv> brlist = busRoadMapper_resv.bus_arrival_list(search);
		int size=brlist.size();
		
		for(BusRoadDTO_resv brdto : brlist ){
			BusStationDTO_resv to1=busStationMapper_resv.getBus_station_search_resv(Integer.parseInt(brdto.getArrival()));
			brdto.setArrival(to1.getStation_name());
			BusStationDTO_resv to2=busStationMapper_resv.getBus_station_search_resv(Integer.parseInt(brdto.getDeparture()));
			brdto.setDeparture(to2.getStation_name());
		}
		
	
		mav.addObject("slist",slist);
		mav.addObject("brlist",brlist);
		mav.addObject("size",size);
		mav.addObject("search",search);
		mav.addObject("count",count);
		mav.addObject("startNum",startNum);
		mav.addObject("pageCount",pageCount);
		mav.addObject("pageBlock",pageBlock);
		mav.addObject("startPage",startPage);
		mav.addObject("endPage",endPage);
		mav.setViewName("bus_user/bus_main/bus_main");
		return mav;
	}
	
	//로그인,회원가입----------------------------------------------------------------------------------
	@RequestMapping(value = "/member_login_resv.do") //로그인 페이지 이동 후 쿠키값 저장
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
		return "bus_user/bus_member/member_login";
		
	}
	 @RequestMapping("/idcheck_resv.do")
     @ResponseBody
     public boolean idcheck(@RequestBody String id, HttpServletRequest req) {
         boolean data = memberMapper.idcheck(id);
         req.setAttribute("idck", 1);
         return data;
         
     }
	
	@RequestMapping(value = "/member_login_ok_resv.do")//로그인 완료
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
			msg = dto.getName() + "님 환영합니다. 메인페이지로 이동합니다.";
			url = "bus_main.do";
			break;
			
		case 1 :
			msg = "비밀번호를 잘못 입력하셨습니다. 다시 입력해 주세요";
			url = "member_login_resv.do";
			break;
			
		case 2 :
			msg = "없는 아이디 입니다. 다시 확인하시고 입력해 주세요";
			url = "member_login_resv.do";
			break;
		
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
		
		
	}
	
	@RequestMapping(value = "/member_logout_resv.do") //로그아웃 페이지
	public String MemberLogout(HttpServletRequest req){
		HttpSession session = req.getSession();
		session.removeAttribute("sedto");
		req.setAttribute("msg", "로그아웃 되었습니다. 메인페이지로 이동합니다.");
		req.setAttribute("url", "bus_main.do");
		return "message";
		
	}
	
	@RequestMapping(value = "/member_input_resv.do")
	   public String MemberInput(HttpServletRequest req) {
	      req.setAttribute("idck", 0);
	      return "bus_user/bus_member/member_input";

	   }
	
	@RequestMapping(value = "/member_input_ok_resv.do")
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
	            url = "member_login_resv.do";

	         } else {
	            msg = "회원가입실패! 메인페이지로 이동합니다.";
	            url = "bus_main.do";

	         }
	         
	      } else {
	         msg = "아이디가 너무 많습니다. 로그인 해주세요.";
	         url = "member_login_resv.do";

	      }
	      req.setAttribute("msg", msg);
	      req.setAttribute("url", url);
	      return "message";

	   }
	
	@RequestMapping(value = "/member_search_resv.do")//아이디 비밀번호 찾기 페이지 이동
	public String MemberSearch(HttpServletRequest req){
		String mode = req.getParameter("mode");
		req.setAttribute("mode", mode);
		return "bus_user/bus_member/member_search";
		
	}
	@RequestMapping(value = "/member_search_ok_resv.do")//아이디 비밀번호 찾기 완료
	public String MemberSearchOk(HttpServletRequest req){
		String mode = req.getParameter("mode");
		String searchString = req.getParameter("searchString");
		String ssn1 = req.getParameter("ssn1");
		String ssn2 = req.getParameter("ssn2");
		List<MemberDTO> list = null;
		if(mode.equals("id")){
			list = memberMapper.searchMemberId(searchString, ssn1, ssn2);
			
		}
		if(mode.equals("passwd")){
			list = memberMapper.searchMemberPasswd(searchString, ssn1, ssn2);
			
		}
		req.setAttribute("searchList", list);
		req.setAttribute("mode", mode);
		return "bus_user/bus_member/searchResult";
		
	}
	
	@RequestMapping(value = "/member_mypage_resv.do") //마이페이지     
	public String MemberMypage(HttpServletRequest req){
		return "bus_user/bus_member/mypage";
		
	}
	
	@RequestMapping(value = "/member_edit_ok_resv.do")//수정완료
	public String MemberEditOk(HttpServletRequest req, MemberDTO dto){
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
	            url = "member_mypage_resv.do";

	         } else {
	            msg = "회원수정실패! 회원목록으로 이동합니다.";
	            url = "member_mypage_resv.do";

	         }

	      } else {
	         if (mode.equals("mypage")) {
	            msg = "회원수정실패! 마이페이지로 이동합니다.";
	            url = "member_mypage_resv.do";

	         } else {
	            msg = "회원수정실패! 회원수정페이지로 이동합니다.";
	            url = "member_mypage_resv.do?id=" + dto.getId();

	         }

	      }
	      req.setAttribute("msg", msg);
	      req.setAttribute("url", url);
	      return "message";

	   }
	@RequestMapping(value = "/member_delete_resv.do")
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
	            url = "member_mypage_resv.do";
	            
	         }else if(passwd.equals(dto.getPasswd())){
	            msg = "회원 탈퇴 성공! 메인 페이지로 이동합니다.";
	            url = "bus_main.do";
	            
	         }else{
	            msg = "비밀번호를 잘못 입력하셨습니다. 다시 입력해주세요.";
	            url = "member_mypage_resv.do";
	            
	         }
	         res = memberMapper.deleteMember(dto.getMember_no());
	         if (res > 0) {
	            session.removeAttribute("sedto");
	            msg = "회원탈퇴성공! 메인페이지로 이동합니다.";
	            url = "bus_main.do";

	         } else {
	            msg = "회원탈퇴실패! 메인페이지로 이동합니다.";
	            url = "bus_main.do";

	         }
	         
	      }
	      req.setAttribute("msg", msg);
	      req.setAttribute("url", url);
	      return "message";

	   }
	
	
	
	//버스관련---------------------------------------------------------------
		
		
		//버스---------------------------------------------------------------
		@RequestMapping(value="/bus_list.do" )
		public ModelAndView bus_list(HttpServletRequest req) {
			int pageSize=10;
			String pageNum=req.getParameter("pageNum");
			if(pageNum==null){
				pageNum="1";
			}
			int currentPage = Integer.parseInt(pageNum);
			int startRow = currentPage * pageSize - (pageSize-1);
			int endRow = currentPage * pageSize;
			int count = 0;
			count=busMapper_resv.bus_count_resv();
			if(endRow>count){
				endRow=count;
			}
			List<BusDTO_resv> bus_list = busMapper_resv.bus_list_count_resv(startRow, endRow);//노선만든사람 한글로 표시위해 member 테이블 bus_road테이블 조인 후 행의 출력범위 지정
			int startNum = count-((currentPage-1)*pageSize);
			int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
			int pageBlock = 5;
			int startPage = (currentPage-1)/pageBlock * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			if (endPage>pageCount) endPage = pageCount;
			//List<BusDTO> list = busMapper.listBus();
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bus_user/bus/bus_list");
			mav.addObject("bus_list", bus_list);
			mav.addObject("count",count);
			mav.addObject("startNum",startNum);
			mav.addObject("pageCount",pageCount);
			mav.addObject("pageBlock",pageBlock);
			mav.addObject("startPage",startPage);
			mav.addObject("endPage",endPage);
			return mav;
		}
		@RequestMapping(value="/bus_insert.do",method = RequestMethod.GET)
		public ModelAndView bus_insert() {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bus_user/bus/bus_insert");
			
			return mav;
		}
		@RequestMapping(value="/bus_insert.do",method = RequestMethod.POST)
		public String bus_insertOK(HttpServletRequest req, BusDTO_resv dto)  {
			int res=busMapper_resv.insertBus_resv_resv(dto);
			String msg = null, url = null;
			if (res > 0) {
				msg = "버스등록 성공";
				url = "bus_list.do";
			} else {
				msg = "버스등록 실패";
				url = "bus_list.do";
			}
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}
		@RequestMapping("bus_delete.do")
		public String bus_delete(HttpServletRequest req) {
			int res=busMapper_resv.deletetBus_resv_resv(Integer.parseInt(req.getParameter("no")));
			String msg = null, url = null;
			if (res > 0) {
				msg = "버스삭제 성공";
				url = "bus_list.do";
			} else {
				msg = "버스삭제 실패";
				url = "bus_list.do";
			}
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}
		@RequestMapping(value="/bus_update.do",method = RequestMethod.GET)
		public ModelAndView bus_update(HttpServletRequest req) {
			BusDTO_resv dto = busMapper_resv.getBus_resv_resv(Integer.parseInt(req.getParameter("no")));
			ModelAndView mav = new ModelAndView("bus_user/bus/bus_update", "bus", dto);
			return mav;
		}
		@RequestMapping(value="/bus_update.do",method = RequestMethod.POST)
		public String bus_updateOK(HttpServletRequest req, BusDTO_resv dto)  {
			int res=busMapper_resv.updateBus_resv_resv(dto); 
			String msg = null, url = null;
			if (res > 0) {
				msg = "버스수정 성공";
				url = "bus_list.do";
			} else {
				msg = "버스수정 실패";
				url = "bus_list.do";
			}
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}
		
		@RequestMapping(value = "/member_withdraw_resv.do")//회원 탈퇴
		public String MemberWithdraw(HttpServletRequest req){
			HttpSession session = req.getSession();
			MemberDTO dto = (MemberDTO)session.getAttribute("sedto");
			int res = memberMapper.deleteMember(dto.getMember_no());
			String msg = null, url = null;
			if(res > 0){
				session.removeAttribute("sedto");
				msg = "회원탈퇴성공! 메인페이지로 이동합니다.";
				url = "bus_main.do";
				
			}else{
				msg = "회원탈퇴실패! 메인페이지로 이동합니다.";
				url = "bus_main.do";
				
			}
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
			
		}
		
		//터미널---------------------------------------------------------------
		@RequestMapping("/bus_station_list.do")
		public ModelAndView bus_station_list() {
			List<BusStationDTO_resv> list = busStationMapper_resv.listBus_station_resv();
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bus_user/bus_station/bus_station_list");
			mav.addObject("bus_station_list", list);
			return mav;
		}
		@RequestMapping(value="/bus_station_insert.do",method = RequestMethod.GET)
		public String bus_station_insert() {
			return "bus_user/bus_station/bus_station_insert";
		}
		@RequestMapping(value="/bus_station_insert.do",method = RequestMethod.POST)
		public String bus_station_insertOK(HttpServletRequest req,@ModelAttribute BusStationDTO_resv dto,BindingResult result)  {
			String filename = "";
			int filesize = 0;
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
			MultipartFile file = mr.getFile("filename");
			File target = new File(upLoadPath, file.getOriginalFilename());
			if (file.getSize() > 0){
				try{
					file.transferTo(target);
				}catch(IOException e){}
				filename = file.getOriginalFilename();
				filesize = (int)file.getSize();
			}
			dto.setFilename(filename);
			dto.setFilesize(filesize);
			
			int res=busStationMapper_resv.insertBus_station_resv(dto);
			
			String msg = null, url = null;
			if (res > 0) {
				msg = "버스정류소 성공";
				url = "bus_station_list.do";
			} else {
				msg = "버스정류소 실패";
				url = "bus_station_list.do";
			}
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
			
		}
		@RequestMapping("bus_station_delete.do")
		public String bus_station_delete(HttpServletRequest req) {
			int res=busStationMapper_resv.deletetBus_station_resv((req.getParameter("no")));
			String msg = null, url = null;
			if (res > 0) {
				msg = "터미널삭제 성공";
				url = "bus_station_list.do";
			} else {
				msg = "터미널삭제 실패";
				url = "bus_station_list.do";
			}
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}
		@RequestMapping(value="/bus_station_update.do",method = RequestMethod.GET)
		public ModelAndView bus_station_update(HttpServletRequest req) {
			BusStationDTO_resv dto = busStationMapper_resv.getBus_station_resv(req.getParameter("no"));
			ModelAndView mav = new ModelAndView("bus_user/bus_station/bus_station_update", "station", dto);
			return mav;
		}
		@RequestMapping(value="/bus_station_update.do",method = RequestMethod.POST)
		public String bus_station_updateOK(HttpServletRequest req,@ModelAttribute  BusStationDTO_resv dto,BindingResult result)  {
			
			
			
			String filename = dto.getFilename();
			int filesize =dto.getFilesize();
			
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
			MultipartFile file = mr.getFile("filename");
			File target = new File(upLoadPath, file.getOriginalFilename());
			if (file.getSize() > 0){
				try{
					file.transferTo(target);
				}catch(IOException e){}
				filename = file.getOriginalFilename();
				filesize = (int)file.getSize();
				dto.setFilename(filename);
				dto.setFilesize(filesize);
			}else{
				dto.setFilename("파일없음");
				dto.setFilesize(0);
			}
			
			
			
			
			int res=busStationMapper_resv.updateBus_station_resv(dto); 
			String msg = null, url = null;
			if (res > 0) {
				msg = "터미널수정 성공";
				url = "bus_station_list.do";
			} else {
				msg = "터미널수정 실패";
				url = "bus_station_list.do";
			}
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}
		
		//노선---------------------------------------------------------------
		@RequestMapping(value="/bus_road_list.do" )
		public ModelAndView bus_road_list(HttpServletRequest req) {
			//List<Member_BusRoadDTO> listBus_road=busRoadMapper.bus_road_member_list();//노선만든사람 한글로 표시위해 member 테이블 bus_road테이블 조인
			//page 나누기
			int pageSize=10;
			String pageNum=req.getParameter("pageNum");
			if(pageNum==null){
				pageNum="1";
			}
			int currentPage = Integer.parseInt(pageNum);
			int startRow = currentPage * pageSize - (pageSize-1);
			int endRow = currentPage * pageSize;
			int count = 0;
			count=busRoadMapper_resv.bus_road_member_count_resv();
			if(endRow>count){
				endRow=count;
			}
			List<Member_BusRoadDTO> listBus_road = busRoadMapper_resv.bus_road_member_list_count_resv(startRow, endRow);//노선만든사람 한글로 표시위해 member 테이블 bus_road테이블 조인 후 행의 출력범위 지정
			int startNum = count-((currentPage-1)*pageSize);
			int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
			int pageBlock = 5;
			int startPage = (currentPage-1)/pageBlock * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			if (endPage>pageCount) endPage = pageCount;
			
			for(Member_BusRoadDTO mdto : listBus_road){ //출발지 도착지 한글로 표시하는 작업
				BusStationDTO_resv to=busStationMapper_resv.getBus_station_resv(String.valueOf(mdto.getArrival()));
				mdto.setArrival(to.getStation_name());
				BusStationDTO_resv to1=busStationMapper_resv.getBus_station_resv(String.valueOf(mdto.getDeparture()));
				mdto.setDeparture(to1.getStation_name());
				
			}
			
		
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bus_user/bus_road/bus_road_list");
			mav.addObject("listBus_road",listBus_road);
			mav.addObject("count",count);
			mav.addObject("startNum",startNum);
			mav.addObject("pageCount",pageCount);
			mav.addObject("pageBlock",pageBlock);
			mav.addObject("startPage",startPage);
			mav.addObject("endPage",endPage);
		
			return mav;
		}
		@RequestMapping(value="/bus_road_insert.do",method = RequestMethod.GET)
		public ModelAndView bus_road_insert(HttpServletRequest req) {
			List<BusStationDTO_resv> bus_station_list = busStationMapper_resv.listBus_station_resv(); //station_no 받아오기
			List<Bus_BusRoadDTO> bus_no_list = busRoadMapper_resv.bus_no_list_null_resv(); // 사용중인 bus_no 제외하고 출력
			
			
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("bus_no_list",bus_no_list);
			mav.addObject("bus_station_list",bus_station_list);
			mav.setViewName("bus_user/bus_road/bus_road_insert");
			
			return mav;
		}
		@RequestMapping(value="/bus_road_insert.do",method = RequestMethod.POST)
		public String bus_road_insertOK(HttpServletRequest req, BusRoadDTO_resv dto,@RequestParam String plus,@RequestParam int bus_no,@RequestParam int tot_time,@RequestParam String arrival,@RequestParam String departure)  {
			BusDTO_resv bdto = busMapper_resv.getBus_resv_resv(bus_no);
			
			
			HttpSession session = req.getSession();
			MemberDTO mdto = (MemberDTO)session.getAttribute("sedto");//로그인되어있는 회원 정보 불러오기
			
			
			dto.setArrival(String.valueOf(busStationMapper_resv.getBus_number_resv(arrival).getStation_no()));//int 형값 을 string 형으로 변경 작업(출발지 한글로 표시하기위해)
			dto.setDeparture(String.valueOf(busStationMapper_resv.getBus_number_resv(departure).getStation_no()));//int 형값 을 string 형으로 변경 작업(도착지 한글로 표시위해)
			dto.setMember_no(mdto.getMember_no());
			if(bdto.getGrade().equals("일반")){//일반버스일때 가격
				int price=5000;
				dto.setPrice(price*tot_time);
			}else if(bdto.getGrade().equals("우등")){//우등버스일때 가격
				int price=8000;
				dto.setPrice(price*tot_time);	
			}
			int res;
			if(plus.equals("plural")){//복수 노선 만들시
				int dip_time=Integer.parseInt(req.getParameter("dip_time"));//배차시간 가져오기 
				 res=busRoadMapper_resv.insertBus_road_resv(dto);//기본적으로 선택된 bus노선 만들어주기
				 int a_time=dto.getArr_time();
				 int bus_count=0; //버스갯수
				
				 for(int i=a_time; i<=22; i++){//필요한 버스 갯수 
					a_time=dto.getTot_time()+dip_time;
					 if(a_time>=22){//jsp페이지에 출발시간이 22시이후로는 설정못하게 되있어서 출발시간이 22시간 까지만 노선만들기위해
						 break;
					 }
					 bus_count++;

				 }
					 int count=busRoadMapper_resv.bus_no_list_null_count_resv();//사용중이지않은 버스 갯수
					 
					 if(count<bus_count){//버스갯수가 부족할떄(만들노선보다 노선에사용중인 버스가 많을떄)
						 //버스추가후 노선생성
						for(int j=0; j<bus_count; j++){
							 res=busMapper_resv.insertBus_normal_resv();//일반 버스 생성(버스가 노선갯수보다 하나더 만들어지게 설계됨)
							 Bus_BusRoadDTO bbdto1=busRoadMapper_resv.bus_no_null_rownum_resv();//bus_no 값 하나씩 출력하기 위해서
							 dto.setBus_no(bbdto1.getBus_no());//bus_no 값을 bbdto1 객체에서 받아와 하나씩 넣어줌
							 dto.setArr_time(dto.getArr_time()+dto.getTot_time()+dip_time);//출발시간 지속적으로 변경
							
							 if(dto.getArr_time()>22){
								 break;
							 }
							 res=busRoadMapper_resv.insertBus_road_resv(dto);

						 }
					 }else if(count>=bus_count){//버스갯수가 충분할때
						 for(int j=0; j<bus_count; j++){
							 Bus_BusRoadDTO bbdto2=busRoadMapper_resv.bus_no_null_rownum_resv();//bus_no 값 하나씩 출력하기 위해서
							 dto.setBus_no(bbdto2.getBus_no());
							 dto.setArr_time(dto.getArr_time()+dto.getTot_time()+dip_time);
							 if(dto.getArr_time()>22){
								 break;
							 }
							 res=busRoadMapper_resv.insertBus_road_resv(dto);
							
						 }
					 }
				 
			}else{
				 res=busRoadMapper_resv.insertBus_road_resv(dto);
			}
			String msg = null, url = null;
			if (res > 0) {
				msg = "노선등록 성공";
				url = "bus_road_list.do";
			} else {
				msg = "노선등록 실패";
				url = "bus_road_list.do";
			}
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}
		@RequestMapping("bus_road_delete.do")
		public String bus_road_delete(HttpServletRequest req) {
			int res=busRoadMapper_resv.deletetBus_road_resv(Integer.parseInt(req.getParameter("no")));
			String msg = null, url = null;
			if (res > 0) {
				msg = "노선삭제 성공";
				url = "bus_road_list.do";
			} else {
				msg = "노선삭제 실패";
				url = "bus_road_list.do";
			}
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}
		@RequestMapping(value="/bus_road_update.do",method = RequestMethod.GET)
		public ModelAndView bus_road_update(HttpServletRequest req) {
			BusRoadDTO_resv dto = busRoadMapper_resv.getBus_road_resv(Integer.parseInt(req.getParameter("no")));//특정 bus_no 값을가지고 있는 항목 
			BusStationDTO_resv arr_dto=busStationMapper_resv.getBus_station_resv(dto.getArrival());//넘어온 bus_no 값에대한 station 테이블에 station_no 값에 따른 station_name 찾기
			BusStationDTO_resv dep_dto=busStationMapper_resv.getBus_station_resv(dto.getDeparture());//넘어온 bus_no 값에대한 station 테이블에 station_no 값에 따른 station_name 찾기
			dto.setArrival(arr_dto.getStation_name());//넘어온 bus_no 값을 출발지  숫자->한글
			dto.setDeparture(dep_dto.getStation_name());//넘어온 bus_no 에 대한 도착지 숫자->한글
			
			List<Bus_BusRoadDTO> bus_no_list = busRoadMapper_resv.bus_no_list_null_resv(); // 사용중인 bus_no 제외하고 출력
			List<BusStationDTO_resv> bus_station_list = busStationMapper_resv.listBus_station_resv(); //station_no 받아오기
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bus_user/bus_road/bus_road_update");
			mav.addObject("bus_road_getBoard",dto);
			mav.addObject("bus_no_list",bus_no_list);
			mav.addObject("bus_station_list",bus_station_list);
			mav.addObject("add_dto",arr_dto);//jsp 창에서 조건문 쓰기위해 저장
			mav.addObject("dep_dto",dep_dto);//jsp 창에서 조건문 쓰기위해 저장
			
			return mav;
		}
		@RequestMapping(value="/bus_road_update.do",method = RequestMethod.POST)
		public ModelAndView bus_road_updateOK(HttpServletRequest req, BusRoadDTO_resv dto,@RequestParam String arrival,@RequestParam String departure)  {
			
			dto.setArrival(String.valueOf(busStationMapper_resv.getBus_number_resv(arrival).getStation_no()));
			dto.setDeparture(String.valueOf(busStationMapper_resv.getBus_number_resv(departure).getStation_no()));
			
			int res=busRoadMapper_resv.updateBus_road_resv(dto); 
			String msg = null, url = null;
			if (res > 0) {
				msg = "노선수정 성공";
				url = "bus_road_list.do";
			} else {
				msg = "노선수정 실패";
				url = "bus_road_list.do";
			}
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("message");
			mav.addObject("msg",msg);
			mav.addObject("url",url);
			return mav;
		}
		//예약---------------------------------------------------------------
		@RequestMapping(value="/bus_resv_list.do" )
		public ModelAndView bus_resv_list() {
			List<BusResvDTO_resv> list = busResvMapper_resv.listBus_resv_resv_resv();
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bus_user/bus_resv/bus_resv_list");
			mav.addObject("list", list);
			return mav;
		}
		@RequestMapping(value="/bus_resv_insert.do",method = RequestMethod.GET)
		public String bus_resv_insert() {
			return "bus_user/bus_resv/bus_resv_insert";
		}
		@RequestMapping(value="/bus_resv_insert.do",method = RequestMethod.POST)
		public String bus_resv_insertOK(HttpServletRequest req, BusResvDTO_resv dto)  {
			int res=busResvMapper_resv.insertBus_resv_resv_resv(dto);
			String msg = null, url = null;
			if (res > 0) {
				msg = "예약등록 성공";
				url = "bus_resv_list.do";
			} else {
				msg = "예약등록 실패";
				url = "bus_resv_list.do";
			}
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}
		@RequestMapping("bus_resv_delete.do")
		public String bus_resv_delete(HttpServletRequest req) {
			int res=busResvMapper_resv.deletetBus_resv_resv_resv(Integer.parseInt(req.getParameter("no")));
			String msg = null, url = null;
			if (res > 0) {
				msg = "예약삭제 성공";
				url = "bus_resv_list.do";
			} else {
				msg = "예약삭제 실패";
				url = "bus_resv_list.do";
			}
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}
		@RequestMapping(value="/bus_resv_update.do",method = RequestMethod.GET)
		public ModelAndView bus_resv_update(HttpServletRequest req) {
			BusResvDTO_resv dto = busResvMapper_resv.getBus_resv_resv_resv(req.getParameter("no"));
			ModelAndView mav = new ModelAndView("bus_resv/bus_resv_update", "bus", dto);
			return mav;
		}
		@RequestMapping(value="/bus_resv_update.do",method = RequestMethod.POST)
		public String bus_resv_updateOK(HttpServletRequest req, BusResvDTO_resv dto)  {
			int res=busResvMapper_resv.updateBus_resv_resv(dto); 
			String msg = null, url = null;
			if (res > 0) {
				msg = "예약수정 성공";
				url = "bus_resv_list.do";
			} else {
				msg = "예약수정 실패";
				url = "bus_resv_list.do";
			}
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}
		
		//버스 유저 페이지--------------------------------------------------
		
		//버스 터미널 정보
		
		@RequestMapping(value="/bus_station_info.do")
		public ModelAndView bus_station_info(){
			List<BusStationDTO_resv> bus_station_list = busStationMapper_resv.listBus_station_resv();
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bus_user/bus_station_user/bus_station_info");
			mav.addObject("bus_station_list",bus_station_list);
			
			return mav;
		}
		
		@RequestMapping(value="bus_station_info_detail.do") //버스정류소 디테일 페이지
		public ModelAndView bus_station_info_detail(@RequestParam String station_no){
			
			BusStationDTO_resv dto =busStationMapper_resv.getBus_station_resv(station_no);
			
			String str=dto.getStation_name();
			String address=str.replaceAll("고속버스터미널","");
			List<HotelDTO_sks> hotel_list = busStationMapper_resv.find_hotel_resv(address);
			
			for(HotelDTO_sks hdto : hotel_list){
		         String name=hdto.getFilename();
		         String[] arrname=name.split("/");
		         hdto.setFilename(arrname[0]);
		      }
			ModelAndView mav= new ModelAndView();
			mav.setViewName("bus_user/bus_station_user/bus_station_info_detail");
			mav.addObject("get_busstation",dto);
			mav.addObject("hotel_list",hotel_list);
			
			return mav;
		}
		
		@RequestMapping(value="bus_station_info_map.do") //지도 확대 페이지
		public ModelAndView bus_station_info_map(@RequestParam String station_name,@RequestParam String address){
			ModelAndView mav =new ModelAndView();
		
			mav.setViewName("bus_user/bus_station_user/bus_station_info_map");
			mav.addObject("station_name",station_name);
			mav.addObject("address",address);
			
			return mav;
		}
		
		//버스 노선 조회 및 예약
		@RequestMapping(value="bus_user_resv_lookup.do") //버스 조회 및 예약 메인
		public ModelAndView bus_user_resv_list(){
			
			
			ModelAndView mav= new ModelAndView();
			mav.setViewName("bus_user/bus_resv_user/bus_user_resv_lookup");
			
			return mav;
			
		}
		
		@RequestMapping(value="bus_resv_user_arrival.do", method=RequestMethod.GET) //출발지 선택 페이지
		public ModelAndView bus_resv_user_arrival(){
			List<BusStationDTO_resv> bus_station_list = busStationMapper_resv.listBus_station_resv();
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bus_user/bus_resv_user/bus_resv_user_arrival");
			mav.addObject("bus_station_list",bus_station_list);
			return mav;
		}
		@RequestMapping(value="bus_resv_user_arrival_select.do")//출발지 선택 하기
		public ModelAndView bus_resv_user_arrival_select(BusStationDTO_resv dto,@RequestParam String arrival) {
		
			List<BusStationDTO_resv> bus_station_list = busStationMapper_resv.listBus_station_resv();
		
			ModelAndView mav = new ModelAndView();
					if(arrival != null){
						dto =busStationMapper_resv.getBus_station_resv(arrival);
						mav.addObject("arr_dto",dto);
						mav.addObject("bus_station_list",bus_station_list);
						mav.setViewName("bus_user/bus_resv_user/bus_resv_user_arrival");
						return mav;
					}
					else  {
						mav.setViewName("bus_resv_user_arrival.do");
						return mav;
					}	
				
				}
		@RequestMapping(value="bus_resv_user_arrival.do" ,method =RequestMethod.POST)//출발지 선택후 원래페이지
		public ModelAndView bus_Resv_user_arrivalOk(HttpServletRequest req,@RequestParam String arrival){
			ModelAndView mav = new ModelAndView();
			
			BusStationDTO_resv dto = busStationMapper_resv.getBus_station_name_resv(arrival);
			HttpSession session=req.getSession();
			
			session.setAttribute("arrDTO", dto);
			BusStationDTO_resv arr_no_dto =busStationMapper_resv.getBus_number_resv(arrival);
			session.setAttribute("arrnoDTO",arr_no_dto);
			
			if(session.getAttribute("depDTO")!=null){
				BusStationDTO_resv depdto=(BusStationDTO_resv) session.getAttribute("depDTO");
				mav.addObject("dep_dto",depdto);
				BusStationDTO_resv dep_no_dto=(BusStationDTO_resv) session.getAttribute("depnoDTO");
				mav.addObject("depnoDTO",dep_no_dto);
			}
			
			mav.addObject("arr_dto",dto);
			mav.setViewName("bus_user/bus_resv_user/popclose");
			
			return mav;
		}
		
	
		
		@RequestMapping(value="bus_resv_user_departure.do",method=RequestMethod.GET)//도착지 페이지
		public ModelAndView bus_resv_user_departure_select() {
			List<BusStationDTO_resv> bus_station_list = busStationMapper_resv.listBus_station_resv();
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("bus_user/bus_resv_user/bus_resv_user_departure");
			mav.addObject("bus_station_list",bus_station_list);
			return mav;
				
				}
		
		@RequestMapping(value="bus_resv_user_departure_select.do")//도착지 선택 하기
		public ModelAndView bus_resv_user_departure_select(BusStationDTO_resv dto,@RequestParam String departure) {
		
			List<BusStationDTO_resv> bus_station_list = busStationMapper_resv.listBus_station_resv();
			
			ModelAndView mav = new ModelAndView();
					if(departure != null){
						dto =busStationMapper_resv.getBus_station_resv(departure);
						mav.addObject("dep_dto",dto);
						mav.addObject("bus_station_list",bus_station_list);
						mav.setViewName("bus_user/bus_resv_user/bus_resv_user_departure");
						return mav;
					}
					else  {
						mav.setViewName("bus_resv_user_departure.do");
						return mav;
					}	
					
				
				}
		
		@RequestMapping(value="bus_resv_user_departure.do",method=RequestMethod.POST)
		public ModelAndView bus_rsev_user_departureOk(HttpServletRequest req ,@RequestParam String departure){
			ModelAndView mav = new ModelAndView();
			BusStationDTO_resv dto = busStationMapper_resv.getBus_station_name_resv(departure);
			HttpSession session=req.getSession();
			session.setAttribute("depDTO", dto);
			
			BusStationDTO_resv dep_no_dto =busStationMapper_resv.getBus_number_resv(departure);
			session.setAttribute("depnoDTO",dep_no_dto);
			
			if(session.getAttribute("arrDTO")!=null){
				BusStationDTO_resv arrdto=(BusStationDTO_resv) session.getAttribute("arrDTO");
				mav.addObject("arr_dto",arrdto);
				BusStationDTO_resv arr_no_dto=(BusStationDTO_resv) session.getAttribute("arrnoDTO");
				mav.addObject("arrnoDTO",arr_no_dto);
			}
			
			mav.addObject("dep_dto",dto);
			mav.setViewName("bus_user/bus_resv_user/popclose");
			
			return mav;
		}
				
		@RequestMapping(value="resv_user_arrival_find.do")//출발지 검색
		public ModelAndView bus_resv_arrival_find(@RequestParam String searchString){
			ModelAndView mav = new ModelAndView();
			
			List<BusStationDTO_resv> list = busStationMapper_resv.find_station_resv(searchString);
			mav.addObject("find_station",list);
			mav.setViewName("bus_user/bus_resv_user/bus_resv_user_arrival");
			return mav;
		}
		@RequestMapping(value="resv_user_departure_find.do")//도착지 검색
		public ModelAndView bus_resv_departure_find(@RequestParam String searchString){
			ModelAndView mav= new ModelAndView();
			
			List<BusStationDTO_resv> list = busStationMapper_resv.find_station_resv(searchString);
			mav.addObject("find_station",list);
			mav.setViewName("bus_user/bus_resv_user/bus_resv_user_departure");
			return mav;
		}
		
		//배차조회 list
		@RequestMapping(value="bus_resv_user_dispatch.do")
		public ModelAndView bus_user_dispatch(
				HttpServletRequest req,BusRoadDTO_resv dto,@RequestParam String mode,@RequestParam int arrival,@RequestParam int departure,@RequestParam String grade,@RequestParam String one_date,@RequestParam String two_date){
			ModelAndView mav = new ModelAndView();
			if(mode.equals("oneway")){//편도 선택 했을떄
				int pageSize=10;
				String pageNum=req.getParameter("pageNum");
				if(pageNum==null){
					pageNum="1";
				}
				int currentPage = Integer.parseInt(pageNum);
				int startRow = currentPage * pageSize - (pageSize-1);
				int endRow = currentPage * pageSize;
				int count = 0;
				count=busResvMapper_resv.bus_busroad_resv_count_resv(arrival,departure,grade);//bus테이블과 bus_road 테이블 조인 시 출발지,도착지,등급과 일치하는 행들 카운트
				if(endRow>count){
					endRow=count;
				}
				List<Bus_BusRoadDTO> dispatch_list=busResvMapper_resv.listdispatch_resv_count_resv(arrival,departure,grade,startRow,endRow);//출발지,도착지,버스등급에 맞는 리스트를 5개씩출력
				
				if(grade.equals("전체")){//grade 가 전체 일때
					currentPage = Integer.parseInt(pageNum);
					startRow = currentPage * pageSize - (pageSize-1);
					endRow = currentPage * pageSize;
					count = 0;
					dispatch_list=busResvMapper_resv.listdispatch_resv_all_count_resv(arrival, departure, startRow, endRow);//출발지,도착지 에 맞는 리스트를 5개씩 출력
					count=busResvMapper_resv.bus_busroad_resv_all_count_resv(arrival,departure);//bus테이블과 bus_road 테이블 조인 시 출발지,도착지와 일치하는 행들 카운트
						if(endRow>count){
							endRow=count;
						}
					}
				
				int startNum = count-((currentPage-1)*pageSize);
				int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
				int pageBlock = 5;
				int startPage = (currentPage-1)/pageBlock * pageBlock + 1;
				int endPage = startPage + pageBlock - 1;
				if (endPage>pageCount) endPage = pageCount;
				
				
			BusResvDTO_resv resvdto = new BusResvDTO_resv();
			for(Bus_BusRoadDTO roadDTO : dispatch_list){//숫자화 된 출발지 도착지를 한글로 변환
				String arr=roadDTO.getArrival(); //숫자화된 출발지를 저장(dto arrival 이 string 으로 되어있음)
				BusStationDTO_resv BDTO=busStationMapper_resv.getBus_station_resv(arr);//station_no 값을 이용해 해당하는 station_name 찾기
				roadDTO.setArrival(BDTO.getStation_name());//dto에 출발지 한글로저장
				String dep=roadDTO.getDeparture();
				BusStationDTO_resv BDTO2=busStationMapper_resv.getBus_station_resv(dep);
				roadDTO.setDeparture(BDTO2.getStation_name());
					
				}
			
			
			
			
			
		
			
			
			mav.addObject("mode",mode);
			mav.addObject("arrival",arrival);//페이지이동을위해 넘겨줌
			mav.addObject("departure",departure);//페이지이동을위해 넘겨줌
			mav.addObject("grade",grade);//페이지이동을위해 넘겨줌
			mav.addObject("one_date",one_date);
			mav.addObject("dispatch_list",dispatch_list);
			mav.addObject("count",count);
			mav.addObject("startNum",startNum);
			mav.addObject("pageCount",pageCount);
			mav.addObject("pageBlock",pageBlock);
			mav.addObject("startPage",startPage);
			mav.addObject("endPage",endPage);
			mav.setViewName("bus_user/bus_resv_user/bus_resv_user_dispatch");
		
			}
				if(mode.equals("twoway")){
					int pageSize=10;
					int pageSize2=10;
					String pageNum=req.getParameter("pageNum");
					String pageNum2=req.getParameter("pageNum2");
					
					if(pageNum==null){
						pageNum="1";
					}
					if(pageNum2==null){
						pageNum2="1";
					}
					int currentPage = Integer.parseInt(pageNum);
					int startRow = currentPage * pageSize - (pageSize-1);
					int endRow = currentPage * pageSize;
					int count = 0;
					
					int currentPage2 = Integer.parseInt(pageNum2);
					int startRow2 = currentPage2 * pageSize2 - (pageSize2-1);
					int endRow2 = currentPage2 * pageSize2;
					int count2 = 0;
					
					count =busResvMapper_resv.bus_busroad_resv_count_resv(arrival, departure, grade);
					count2=busResvMapper_resv.bus_busroad_resv_resverse_count_resv(arrival, departure,grade);
					if(endRow>count){
						endRow=count;
					}
					if(endRow>count2){
						endRow=count2;
					}
					List<Bus_BusRoadDTO> arr_dispatch_list=busResvMapper_resv.listdispatch_resv_count_resv(arrival,departure,grade,startRow,endRow);//출발지,도착지,버스등급에 맞는 리스트를 5개씩출력
					List<Bus_BusRoadDTO> dep_dispatch_list=busResvMapper_resv.listdispatch_resv_reverse_count_resv(arrival, departure, grade,startRow2,endRow2);
					if(grade.equals("전체")){//grade 가 전체 일떄
						currentPage = Integer.parseInt(pageNum);
						startRow = currentPage * pageSize - (pageSize-1);
						endRow = currentPage * pageSize;
						count = 0;
						
						currentPage2 = Integer.parseInt(pageNum2);
						startRow2 = currentPage2 * pageSize2 - (pageSize2-1);
						endRow2 = currentPage2 * pageSize2;
						count2=0;
						
						arr_dispatch_list=busResvMapper_resv.listdispatch_resv_all_count_resv(arrival, departure, startRow, endRow);//출발지,도착지 에 맞는 리스트를 5개씩 출력
						count=busResvMapper_resv.bus_busroad_resv_all_count_resv(arrival,departure);//bus테이블과 bus_road 테이블 조인 시 출발지,도착지와 일치하는 행들 카운트
						dep_dispatch_list=busResvMapper_resv.listdispatch_resv_reverse_all_count_resv(arrival, departure, startRow2, endRow2);
						count2=busResvMapper_resv.bus_busroad_resv_resverse_all_count_resv(arrival, departure);
						}
						int startNum = count-((currentPage-1)*pageSize);
						int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
						int pageBlock = 5;
						int startPage = (currentPage-1)/pageBlock * pageBlock + 1;
						int endPage = startPage + pageBlock - 1;
						if (endPage>pageCount) endPage = pageCount;
						
						int startNum2 = count2-((currentPage2-1)*pageSize2);
						int pageCount2 = count2/pageSize2 + (count2%pageSize2 == 0 ? 0 : 1);
						int pageBlock2 = 5;
						int startPage2 = (currentPage2-1)/pageBlock2 * pageBlock2 + 1;
						int endPage2 = startPage2 + pageBlock2 - 1;
						if (endPage2>pageCount2) endPage2 = pageCount2;
						
					for(Bus_BusRoadDTO arrDTO : arr_dispatch_list){
						String arr=arrDTO.getArrival();
						BusStationDTO_resv BDTO=busStationMapper_resv.getBus_station_resv(arr);
						arrDTO.setArrival(BDTO.getStation_name());
						String dep=arrDTO.getDeparture();
						BusStationDTO_resv BDTO2=busStationMapper_resv.getBus_station_resv(dep);
						arrDTO.setDeparture(BDTO2.getStation_name());
					}
					for(Bus_BusRoadDTO depDTO : dep_dispatch_list){
						String arr=depDTO.getArrival();
						BusStationDTO_resv BDTO=busStationMapper_resv.getBus_station_resv(arr);
						depDTO.setArrival(BDTO.getStation_name());
						String dep=depDTO.getDeparture();
						BusStationDTO_resv BDTO2=busStationMapper_resv.getBus_station_resv(dep);
						depDTO.setDeparture(BDTO2.getStation_name());
					}
					HttpSession session=req.getSession();
					if(session.getAttribute("arr_seat_dto")!=null){//왕복 노선 할때 출발일 부터 설정할때 선택한 좌석값 저장
						String[] seat=req.getParameterValues("seat");
						int seat_no=seat.length;
						session.setAttribute("seat",seat);
						session.setAttribute("seat_no",seat_no);
					}
					if(session.getAttribute("dep_seat_dto")!=null){//왕복 노선 할때 도착일 부터 설정할때 선택한 좌석값 저장
						String[] seat_reverse=req.getParameterValues("seat_reverse");
						int seat_no_reverse=seat_reverse.length;
						session.setAttribute("seat_reverse",seat_reverse);
						session.setAttribute("seat_no_reverse",seat_no_reverse);
					}
					mav.addObject("one_date",one_date);
					mav.addObject("two_date",two_date);
					mav.addObject("mode",mode);
					mav.addObject("arrival",arrival);
					mav.addObject("departure",departure);
					mav.addObject("grade",grade);
					mav.addObject("arr_dispatch_list",arr_dispatch_list);
					mav.addObject("dep_dispatch_list",dep_dispatch_list);
					mav.addObject("count",count);
					mav.addObject("startNum",startNum);
					mav.addObject("pageCount",pageCount);
					mav.addObject("pageBlock",pageBlock);
					mav.addObject("startPage",startPage);
					mav.addObject("endPage",endPage);
					mav.addObject("count2",count2);
					mav.addObject("startNum2",startNum2);
					mav.addObject("pageCount2",pageCount2);
					mav.addObject("pageBlock2",pageBlock2);
					mav.addObject("startPage2",startPage2);
					mav.addObject("endPage2",endPage2);
					mav.setViewName("bus_user/bus_resv_user/bus_resv_user_dispatch");
					
				}
				return mav;
		}
	
		//좌석 선택(편도)
		@RequestMapping(value="bus_resv_user_seat.do")
		public  ModelAndView bus_resv_user_seat(HttpServletRequest req,Bus_BusRoadDTO dto,@RequestParam String mode,@RequestParam int road_no,@RequestParam String arrival,@RequestParam String departure){
			ModelAndView mav = new ModelAndView();
			HttpSession session=req.getSession();
			if(session.getAttribute("sedto")==null){
				String msg="예약시 로그인이 필요합니다";
				String url="member_login_resv.do";
				mav.addObject("msg",msg);
				mav.addObject("url",url);
				mav.setViewName("message");
				return mav;
			}
			String one_date=req.getParameter("one_date");
			Bus_BusRoadDTO seat_dto= busResvMapper_resv.resv_user_seat_select_resv(road_no);
			List<BusResvDTO_resv> resv_list=busResvMapper_resv.list_seat_resv_user_resv(one_date,road_no);//예약된 좌석 체크위한 리스트
			String seats="";
				if(resv_list !=null){
			for(BusResvDTO_resv rdto:resv_list){
				seats +=rdto.getSeat()+"/";
				
				}
			}else{
				seats="0";
			}
			dto.setArrival(arrival);
			dto.setDeparture(departure);
			
			 mav.addObject("seat_dto",seat_dto);//자리
	         mav.addObject("one_date",one_date);
	         mav.addObject("dto",dto);
	         mav.addObject("resv",seats);//예약
	         mav.addObject("mode",mode);
	         mav.setViewName("bus_user/bus_resv_user/bus_resv_user_seat");
	         return mav;
			
			
			
		}
		//좌석선택(왕복-가는날)
		@RequestMapping(value="bus_resv_user_arr_seat.do")
		public ModelAndView bus_resv_user_arr_seat(HttpServletRequest req,Bus_BusRoadDTO dto,@RequestParam String mode,@RequestParam int road_no,@RequestParam String arrival_name,@RequestParam String departure_name,@RequestParam int departure,@RequestParam int arrival,@RequestParam String grade){
			ModelAndView mav= new ModelAndView();
			
			String one_date=req.getParameter("one_date");
			String two_date=req.getParameter("two_date");
			Bus_BusRoadDTO arr_seat_dto= busResvMapper_resv.resv_user_seat_select_resv(road_no);
			List<BusResvDTO_resv> resv_list=busResvMapper_resv.list_seat_resv_user_resv(one_date,road_no);//예약된 좌석 체크위한 리스트
			
			String seats="";
				if(resv_list !=null){
			for(BusResvDTO_resv rdto:resv_list){
				seats +=rdto.getSeat()+"/";
				
				}
			}else{
				seats="0";
			}
			arr_seat_dto.setArrival(arrival_name);
			arr_seat_dto.setDeparture(departure_name);
			HttpSession session=req.getSession();
			session.setAttribute("arr_seat_dto",arr_seat_dto);
			session.setAttribute("one_date",one_date);
			session.setAttribute("two_date",two_date);
			session.setAttribute("resv",seats);
			session.setAttribute("arrival",arrival);
			session.setAttribute("departure",departure);
			session.setAttribute("grade",grade);
			session.setAttribute("road_no",road_no);
			/*
			 mav.addObject("arr_seat_dto",arr_seat_dto);//자리
	         mav.addObject("arr_date",arr_date);
	         mav.addObject("dto",dto);
	         mav.addObject("resv",seats);//예약
			*/
			
			mav.setViewName("bus_user/bus_resv_user/bus_resv_user_arr_seat");
			
			return mav;
		}
		//좌석선택(왕복-오는날)
		@RequestMapping(value="bus_resv_user_dep_seat.do")
		public ModelAndView bus_resv_user_dep_seat(HttpServletRequest req,Bus_BusRoadDTO dto,@RequestParam String mode,@RequestParam int road_no,@RequestParam String arrival_name,@RequestParam String departure_name,@RequestParam int departure,@RequestParam int arrival,@RequestParam String grade){
			ModelAndView mav= new ModelAndView();
			String one_date=req.getParameter("one_date");
			String two_date=req.getParameter("two_date");
			Bus_BusRoadDTO dep_seat_dto= busResvMapper_resv.resv_user_seat_select_resv(road_no);
			List<BusResvDTO_resv> resv_list=busResvMapper_resv.list_seat_resv_user_resv(two_date,road_no);//예약된 좌석 체크위한 리스트
			
			String seats="";
				if(resv_list !=null){
			for(BusResvDTO_resv rdto:resv_list){
				seats +=rdto.getSeat()+"/";
				
				}
			}else{
				seats="0";
			}
			dep_seat_dto.setArrival(arrival_name);
			dep_seat_dto.setDeparture(departure_name);
			HttpSession session=req.getSession();
			session.setAttribute("dep_seat_dto",dep_seat_dto);
			session.setAttribute("one_date",one_date);
			session.setAttribute("two_date",two_date);
			session.setAttribute("resv_reverse",seats);
			
			session.setAttribute("arrival",arrival);
			session.setAttribute("departure",departure);
			session.setAttribute("grade",grade);
			session.setAttribute("road_no_reverse",road_no);
			/*
			 mav.addObject("dep_seat_dto",dep_seat_dto);//자리
	         mav.addObject("dep_date",dep_date);
	         mav.addObject("dto",dto);
	         mav.addObject("resv",seats);//예약
			*/
			mav.setViewName("bus_user/bus_resv_user/bus_resv_user_dep_seat");
			return mav;
		}
		
		//결제 페이지(편도)
		@RequestMapping(value="bus_resv_user_pay.do")
		public ModelAndView bus_resv_user_pay(HttpServletRequest req,Bus_BusRoadDTO dto,@RequestParam String one_date,@RequestParam int road_no,@RequestParam String arrival,@RequestParam String departure){
			ModelAndView mav = new ModelAndView();
			Bus_BusRoadDTO resv_dto= busResvMapper_resv.resv_user_seat_select_resv(road_no);
			dto.setArrival(arrival);
			dto.setDeparture(departure);
			
			String[] seat = req.getParameterValues("seat");//좌석수 배열에 저장
		
			int seat_no=seat.length;//좌석수 저장,티켓총가격 구하기위해
			
			mav.addObject("resv_dto",resv_dto);
			mav.addObject("one_date",one_date);
			mav.addObject("seat_no",seat_no);
			mav.addObject("seat",seat);
			mav.addObject("seatlist",seat);
			mav.addObject("dto",dto);
			mav.setViewName("bus_user/bus_resv_user/bus_resv_user_pay");
			return mav;
		}
		//결제페이지(왕복)
		@RequestMapping(value="bus_resv_user_total_pay.do")
		public ModelAndView bus_resv_user_total_pay(HttpServletRequest req,Bus_BusRoadDTO dto,@RequestParam int road_no,@RequestParam String arrival,@RequestParam String departure){
			ModelAndView mav = new ModelAndView();
			HttpSession session=req.getSession();
			
			if(session.getAttribute("dep_seat_dto")==null || session.getAttribute("arr_seat_dto")==null){
				
				mav.setViewName("bus_user/bus_resv_user/bus_resv_user_dispatch");
			}else{
				if(session.getAttribute("seat_no")!=null){//출발일부터 할떄 조건
					String[] seat_reverse=req.getParameterValues("seat_reverse");
					int seat_no_reverse=seat_reverse.length;
					session.setAttribute("seat_reverse",seat_reverse);
					session.setAttribute("seat_no_reverse",seat_no_reverse);
					mav.setViewName("bus_user/bus_resv_user/bus_resv_user_total_pay");
				}else if(session.getAttribute("seat_no_reverse")!=null){//도착일부터 할떄 조건
					String[] seat=req.getParameterValues("seat");
					int seat_no=seat.length;
					session.setAttribute("seat",seat);
					session.setAttribute("seat_no",seat_no);
					mav.setViewName("bus_user/bus_resv_user/bus_resv_user_total_pay");
				}
			}
			return mav;
		}
		
		//결제완료 
		@RequestMapping(value="bus_resv_user_payok.do")
		public ModelAndView bus_resv_user_payok(BusResvDTO_resv dto,HttpServletRequest req,@RequestParam String one_date,@RequestParam int road_no,@RequestParam int use_point,@RequestParam int save_point,@RequestParam int price){
			ModelAndView mav=new ModelAndView();
			String[] seat = req.getParameterValues("seat");//좌석수 배열에 저장
			String[] seats=new String[seat.length];//좌석수를 for문 돌릴 setter 메소드 저장 용도
			//좌석번호 구하기
			for(int i=0; i<seat.length; i++){
				dto.setSeat(seat[i]);
				seats[i]=dto.getSeat();
			}
			String result_seat = String.join("/",seats); //seats 배열의 자리 번호를 '/' 기준으로 나누어서 저장
			
			mav.addObject("result_seat",result_seat);
			mav.addObject("one_date",one_date);
			mav.addObject("road_no",road_no);
			mav.addObject("use_point",use_point);
			mav.addObject("save_point",save_point);
			mav.addObject("price",price);
			mav.setViewName("bus_user/bus_resv_user/bus_resv_user_payok");
			return mav;
			/*
			Bus_BusRoadDTO rdto=busResvMapper_resv.resv_user_seat_select_resv(road_no);
			HttpSession session = req.getSession();
			MemberDTO mdto = (MemberDTO)session.getAttribute("sedto");//로그인되어있는 회원 정보 불러오기
			String[] seat = req.getParameterValues("seat");//좌석수 배열에 저장
			String[] seats=new String[seat.length];//좌석수를 for문 돌릴 setter 메소드 저장 용도
			int seat_no=seat.length;//좌석수 저장,티켓총가격 구하기위해
			
			//좌석번호 구하기
			for(int i=0; i<seat.length; i++){
				dto.setSeat(seat[i]);
				seats[i]=dto.getSeat();
			}
			String result_seat = String.join("/",seats); //seats 배열의 자리 번호를 '/' 기준으로 나누어서 저장
			
			
			int res=0;
			if(use_point ==0){ // 포인트를 사용하지 않았을떄
				dto.setUse_point(0);
				dto.setSave_point(save_point);
				dto.setPrice(price);
				mdto.setPoint(mdto.getPoint()+dto.getSave_point());
				res=memberMapper.Member_buspoint_update(mdto); //포인트 사용내역 meber 테이블에 업데이트
			}else{ //포인트를 사용했을떄(포인트적립x)
				dto.setUse_point(use_point);
				dto.setSave_point(0);
				dto.setPrice(price-dto.getUse_point());
				mdto.setPoint(mdto.getPoint()-dto.getUse_point());
				res=memberMapper.Member_buspoint_update(mdto);//포인트 사용내역 meber 테이블에 업데이트
			}
			
			dto.setBus_no(rdto.getBus_no());
			dto.setResv_date(one_date);
			dto.setRoad_no(road_no);
			dto.setSeat(result_seat);
			dto.setMember_no(mdto.getMember_no());
			
			res =busResvMapper_resv.insertBus_resv_user_resv(dto);
			
			mav.setViewName("bus_user/bus_resv_user/bus_resv_user_payok");
			mav.addObject("rdto",rdto);
			mav.addObject("seat_no",seat_no);
			mav.addObject("use_point",use_point);
			return mav;
			*/
			}
		@RequestMapping(value="bus_user_resv_paytable.do")
		public ModelAndView bus_user_resv_paytable(BusResvDTO_resv dto,HttpServletRequest req,@RequestParam String one_date,@RequestParam int road_no,@RequestParam int use_point,@RequestParam int save_point,@RequestParam int price,@RequestParam String result_seat){
			ModelAndView mav= new ModelAndView();
			Bus_BusRoadDTO rdto=busResvMapper_resv.resv_user_seat_select_resv(road_no);
			HttpSession session = req.getSession();
			MemberDTO mdto = (MemberDTO)session.getAttribute("sedto");//로그인되어있는 회원 정보 불러오기
			
			
			
			int res=0;
			if(use_point ==0){ // 포인트를 사용하지 않았을떄
				dto.setUse_point(0);
				dto.setSave_point(save_point);
				dto.setPrice(price);
				mdto.setPoint(mdto.getPoint()+dto.getSave_point());
				res=memberMapper.Member_buspoint_update(mdto); //포인트 사용내역 meber 테이블에 업데이트
			}else{ //포인트를 사용했을떄(포인트적립x)
				dto.setUse_point(use_point);
				dto.setSave_point(0);
				dto.setPrice(price-dto.getUse_point());
				mdto.setPoint(mdto.getPoint()-dto.getUse_point());
				res=memberMapper.Member_buspoint_update(mdto);//포인트 사용내역 meber 테이블에 업데이트
			}
			
			dto.setBus_no(rdto.getBus_no());
			dto.setResv_date(one_date);
			dto.setRoad_no(road_no);
			dto.setSeat(result_seat);
			dto.setMember_no(mdto.getMember_no());
			
			res =busResvMapper_resv.insertBus_resv_user_resv(dto);
			
			String msg="결제성공 메인페이지로 돌아갑니다";
			String url="bus_main.do";
			mav.addObject("msg",msg);
			mav.addObject("url",url);
			mav.setViewName("message");
				
				
				
			return mav;
		}
		//결제완료 (왕복 bus_resv 테이블에 저장)
		@RequestMapping(value="bus_resv_user_total_payok.do")
		public ModelAndView bus_resv_user_total_payok(BusResvDTO_resv dto,HttpServletRequest req,@RequestParam String one_date,@RequestParam String two_date,@RequestParam int road_no,@RequestParam int road_no_reverse,@RequestParam int price,@RequestParam int arr_price,@RequestParam int dep_price){
			ModelAndView mav = new ModelAndView();
			String[] seat = req.getParameterValues("seat");//좌석수 배열에 저장
			String[] seats=new String[seat.length];//좌석수를 for문 돌릴 setter 메소드 저장 용도
			int seat_no=seat.length;//좌석수 저장,티켓총가격 구하기위해
			
			String[] seat_reverse = req.getParameterValues("seat_reverse");//좌석수 배열에 저장
			String[] seats_reverse=new String[seat_reverse.length];//좌석수를 for문 돌릴 setter 메소드 저장 용도
			int seat_no_reverse=seat_reverse.length;//좌석수 저장,티켓총가격 구하기위해
			
			for(int i=0; i<seat.length; i++){
				dto.setSeat(seat[i]);
				seats[i]=dto.getSeat();
			}
			String result_seat = String.join("/",seats); //seats 배열의 자리 번호를 '/' 기준으로 나누어서 저장
			
			//좌석번호 구하기
			for(int j=0; j<seat_reverse.length; j++){
				dto.setSeat(seat_reverse[j]);
				seats_reverse[j]=dto.getSeat();
			}
			String result_seat_reverse = String.join("/",seat_reverse); //seats 배열의 자리 번호를 '/' 기준으로 나누어서 저장
			
			HttpSession session = req.getSession();
			session.removeAttribute("arr_seat_dto");
			session.removeAttribute("dep_seat_dto");
			session.removeAttribute("seat");
			session.removeAttribute("seat_reverse");
			
			mav.addObject("result_seat",result_seat);
			mav.addObject("result_seat_reverse",result_seat_reverse);
			mav.addObject("one_date",one_date);
			mav.addObject("two_date",two_date);
			mav.addObject("road_no",road_no);
			mav.addObject("road_no_revere",road_no_reverse);
			mav.addObject("price",price);
			mav.addObject("arr_price",arr_price);
			mav.addObject("dep_price",dep_price);
			mav.setViewName("bus_user/bus_resv_user/bus_resv_user_total_payok");
			return mav;
			/*
			Bus_BusRoadDTO rdto=busResvMapper_resv.resv_user_seat_select_resv(road_no);
			Bus_BusRoadDTO rdto_reverse=busResvMapper_resv.resv_user_seat_select_resv(road_no_reverse);
			HttpSession session = req.getSession();
			
			MemberDTO mdto = (MemberDTO)session.getAttribute("sedto");//로그인되어있는 회원 정보 불러오기
			String[] seat = req.getParameterValues("seat");//좌석수 배열에 저장
			String[] seats=new String[seat.length];//좌석수를 for문 돌릴 setter 메소드 저장 용도
			int seat_no=seat.length;//좌석수 저장,티켓총가격 구하기위해
			
			String[] seat_reverse = req.getParameterValues("seat_reverse");//좌석수 배열에 저장
			String[] seats_reverse=new String[seat_reverse.length];//좌석수를 for문 돌릴 setter 메소드 저장 용도
			int seat_no_reverse=seat_reverse.length;//좌석수 저장,티켓총가격 구하기위해
			
			//좌석번호 구하기
			for(int i=0; i<seat.length; i++){
				dto.setSeat(seat[i]);
				seats[i]=dto.getSeat();
			}
			String result_seat = String.join("/",seats); //seats 배열의 자리 번호를 '/' 기준으로 나누어서 저장
			
			//좌석번호 구하기
			for(int j=0; j<seat_reverse.length; j++){
				dto.setSeat(seat_reverse[j]);
				seats_reverse[j]=dto.getSeat();
			}
			String result_seat_reverse = String.join("/",seat_reverse); //seats 배열의 자리 번호를 '/' 기준으로 나누어서 저장
			
			int res=0;

			dto.setUse_point(0);
			dto.setSave_point(0);
			dto.setPrice(arr_price);
			dto.setBus_no(rdto.getBus_no());
			dto.setResv_date(two_date);
			dto.setRoad_no(road_no);
			dto.setSeat(result_seat);
			dto.setMember_no(mdto.getMember_no());
			
			res =busResvMapper_resv.insertBus_resv_user_resv(dto);
			
			dto.setUse_point(0);
			dto.setSave_point(0);
			dto.setPrice(dep_price);
			dto.setBus_no(rdto_reverse.getBus_no());
			dto.setResv_date(one_date);
			dto.setRoad_no(road_no_reverse);
			dto.setSeat(result_seat_reverse);
			dto.setMember_no(mdto.getMember_no());
			
			res =busResvMapper_resv.insertBus_resv_user_resv(dto);
			
			mav.addObject("price",arr_price+dep_price);
			mav.setViewName("bus_user/bus_resv_user/bus_resv_user_total_payok");
			
			session.removeAttribute("arr_seat_dto");
			session.removeAttribute("dep_seat_dto");
			session.removeAttribute("seat");
			session.removeAttribute("seat_reverse");
			return mav;*/
		}
		@RequestMapping(value="bus_user_resv_totalpaytable.do")
		public ModelAndView bus_user_resv_totalpaytable(BusResvDTO_resv dto,HttpServletRequest req,@RequestParam String one_date,@RequestParam String two_date,@RequestParam int road_no,@RequestParam int road_no_reverse,@RequestParam int price,@RequestParam int arr_price,@RequestParam int dep_price,@RequestParam String result_seat,@RequestParam String result_seat_reverse){
			ModelAndView mav = new ModelAndView();
			Bus_BusRoadDTO rdto=busResvMapper_resv.resv_user_seat_select_resv(road_no);
			Bus_BusRoadDTO rdto_reverse=busResvMapper_resv.resv_user_seat_select_resv(road_no_reverse);
			HttpSession session = req.getSession();
			
			MemberDTO mdto = (MemberDTO)session.getAttribute("sedto");//로그인되어있는 회원 정보 불러오기
			
			
			int res=0;

			dto.setUse_point(0);
			dto.setSave_point(0);
			dto.setPrice(arr_price);
			dto.setBus_no(rdto.getBus_no());
			dto.setResv_date(two_date);
			dto.setRoad_no(road_no);
			dto.setSeat(result_seat);
			dto.setMember_no(mdto.getMember_no());
			
			res =busResvMapper_resv.insertBus_resv_user_resv(dto);
			
			dto.setUse_point(0);
			dto.setSave_point(0);
			dto.setPrice(dep_price);
			dto.setBus_no(rdto_reverse.getBus_no());
			dto.setResv_date(one_date);
			dto.setRoad_no(road_no_reverse);
			dto.setSeat(result_seat_reverse);
			dto.setMember_no(mdto.getMember_no());
			
			res =busResvMapper_resv.insertBus_resv_user_resv(dto);
			
			mav.addObject("price",arr_price+dep_price);
			
			String msg="결제성공 메인페이지로 돌아갑니다";
			String url="bus_main.do";
			mav.addObject("msg",msg);
			mav.addObject("url",url);
			mav.setViewName("message");
			
			session.removeAttribute("arr_seat_dto");
			session.removeAttribute("dep_seat_dto");
			session.removeAttribute("seat");
			session.removeAttribute("seat_reverse");
			return mav;
		}
		//예약리스트 페이지
		@RequestMapping(value="bus_resv_user_resvlist.do")
		public ModelAndView bus_resv_user_resvlist(HttpServletRequest req){
			ModelAndView mav = new ModelAndView();
			HttpSession session=req.getSession();
			String msg="";
			String url="";
			if(session.getAttribute("sedto")==null){//로그인 유효성검사
				msg = "해당서비스는 로그인이 필요합니다.로그인페이지로 이동";
				url = "member_login_resv.do";
				mav.addObject("msg",msg);
				mav.addObject("url",url);
				mav.setViewName("message");
				return mav;
			}else{
				session.getAttribute("sedto");
				MemberDTO mdto = (MemberDTO)session.getAttribute("sedto");
				List<BusResv_BusRoadDTO> resv_list = busResvMapper_resv.resvlist_resv(mdto.getMember_no());
				for(BusResv_BusRoadDTO dto : resv_list){
					BusStationDTO_resv to = busStationMapper_resv.getBus_station_resv(String.valueOf(dto.getArrival()));
					dto.setArrival(to.getStation_name());
					BusStationDTO_resv to2=busStationMapper_resv.getBus_station_resv(String.valueOf(dto.getDeparture()));
					dto.setDeparture(to2.getStation_name());
				}
			
				mav.addObject("resv_list",resv_list);
				mav.setViewName("bus_user/bus_resv_user/bus_resv_user_resvlist");
				return mav;
			}
		}
		
		//환불하기
		@RequestMapping(value="bus_resv_user_refund.do")
		public ModelAndView bus_resv_user_refund(HttpServletRequest req,@RequestParam int bus_resv_no,@RequestParam int use_point,@RequestParam int save_point){
			ModelAndView mav = new ModelAndView();
			int res=busResvMapper_resv.deletetBus_resv_resv_resv(bus_resv_no);
			HttpSession session = req.getSession();
			String msg="";
			String url="";
			if (res > 0) {
				if(use_point>0){
					MemberDTO mdto = (MemberDTO)session.getAttribute("sedto");	
					mdto.setPoint(mdto.getPoint()+use_point);
					res=memberMapper.Member_buspoint_update(mdto);
					
				}else if(save_point>0){
					MemberDTO mdto = (MemberDTO)session.getAttribute("sedto");	
					mdto.setPoint(mdto.getPoint()-save_point);
					res=memberMapper.Member_buspoint_update(mdto);
				}
				msg = "환불성공";
				url = "bus_resv_user_resvlist.do";
				mav.addObject("msg",msg);
				mav.addObject("url",url);
				mav.setViewName("message");
				return mav;
				
			} else {
				msg = "환불실패";
				url = "bus_resv_user_resvlist.do";
				mav.addObject("msg",msg);
				mav.addObject("url",url);
				mav.setViewName("message");
				return mav;
			}
			
		}
		}