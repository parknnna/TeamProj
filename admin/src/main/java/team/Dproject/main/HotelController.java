  package team.Dproject.main;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import team.Dproject.main.model.HotelDTO_sks;
import team.Dproject.main.model.HotelResvDTO_sks;
import team.Dproject.main.model.MemberDTO;
import team.Dproject.main.model.RoomDTO_sks;
import team.Dproject.main.service.HotelMapper_sks;
import team.Dproject.main.service.HotelResvMapper_sks;
import team.Dproject.main.service.MemberMapper_sks;
import team.Dproject.main.service.RoomMapper_sks;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HotelController {
	
	@Autowired
	private MemberMapper_sks memberMapper;
	
	@Autowired
	private HotelMapper_sks hotelMapper;
	
	@Autowired
	private RoomMapper_sks roomMapper;
	
	@Autowired
	private HotelResvMapper_sks hotelResvMapper;
	
	@Resource(name="upLoadPath")
	private String upLoadPath;
	
	private static final Logger logger = LoggerFactory.getLogger(HotelController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "home";
//	}
//	
	@RequestMapping("/CSS")
	public String css(){
		return "hotel_user/CSS";
	}
	
	/*@RequestMapping("/main")
	public String main(){
		return "hotel_user/home";
	}
	*/
	@RequestMapping("/hotel_main.do")
	public String main(){
		return "hotel_user/hotel_resv/hotel_resv";
	}
	
	/*
	회원 컨트롤
	*/
	
	@RequestMapping(value="/membercheck", method=RequestMethod.GET)
	public ModelAndView member(){
		String msg="회원 체크 페이지로 갑니다.";
		String url="membercheckpage";
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", msg);
		mv.addObject("url",url);
		mv.setViewName("message");
		return mv;
	}
	
	@RequestMapping("/membercheckpage")
	public String chekpage(){
		return "hotel_user/member/membercheck";
	}
	
	@RequestMapping(value="/membercheck", method=RequestMethod.POST)
	public String chekMember(HttpServletRequest req){
		String name = req.getParameter("name");
		String ssn1 = req.getParameter("ssn1");
		String ssn2 = req.getParameter("ssn2");
		
		boolean chek = memberMapper.checkMember_sks(ssn1, ssn2);
		
		String msg = null,url=null;
		if (chek){
			msg = "현재 회원이십니다. 로그인을 해 주세요";
			url = "memberlist";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}else {
			msg="회원가입 페이지로 갑니다.";
			req.setAttribute("msg", msg);		
			req.setAttribute("name",name);
			req.setAttribute("ssn1",ssn1);
			req.setAttribute("ssn2",ssn2);
	
	        return "hotel_user/member/member";
		}
	}
	
	@RequestMapping("/memberok")
	public String memberInputOk(HttpServletRequest req, MemberDTO dto) {
		int sex=Integer.parseInt(req.getParameter("sex"));
		int res = memberMapper.insertMember_sks(dto,sex);
		String msg = null, url = null; 
		if (res > 0) {
			msg = "회원가입성공!! 회원목록페이지로 이동합니다.";
			url = "memberlist";
		} else {
			msg = "회원가입실패!! 회원가입페이지로 이동합니다.";
			url = "membercheck";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	@RequestMapping("/memberlist")
	public String memberlist(HttpServletRequest req){
		List<MemberDTO> list = memberMapper.listMember_sks();
		req.setAttribute("memberlist", list);
		return "hotel_user/member/memberlist";
	}
	
	@RequestMapping("/memberlogin")
	public String memberlogin(HttpServletRequest req){
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
		return "hotel_user/member/login";
	}
	
	@RequestMapping(value = "/loginok")
	public String MemberLoginOk(HttpServletRequest req, HttpServletResponse resp){
		String id = req.getParameter("id");
		String passwd = req.getParameter("passwd");
		String saveId = req.getParameter("saveId");
		int res = memberMapper.memberLogin_sks(id, passwd);
		String msg = null, url = null;
		switch(res){
		case 0 :
			MemberDTO dto = memberMapper.getMember1_sks(id);
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
			url = "main";
			break;
			
		case 1 :
			msg = "비밀번호를 잘못 입력하셨습니다. 다시 입력해 주세요";
			url = "member/login";
			break;
			
		case 2 :
			msg = "없는 아이디 입니다. 다시 확인하시고 입력해 주세요";
			url = "member/login";
			break;
		
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
		
		
	}
	@RequestMapping(value = "/memberlogout")
	public String MemberLogout(HttpServletRequest req){
		HttpSession session = req.getSession();
		session.removeAttribute("sedto");
		req.setAttribute("msg", "로그아웃 되었습니다. 메인페이지로 이동합니다.");
		req.setAttribute("url", "main");
		return "message";
		
	}
	
	/*
	호텔 컨트롤
	*/
	
	@RequestMapping("/hotelcheck")
	public String hotelcheck(){
		return "hotel_user/hotel/hotelmain";
	}
	
	@RequestMapping("/hoteladmin")
	public String hoteladmin(){
		return "hotel_user/hotel/hotelinsert";
	}
	
	@RequestMapping("/hotelinsertok")
	public String hotelinsertok(HttpServletRequest req, 
			@ModelAttribute HotelDTO_sks dto, BindingResult rs,MultipartHttpServletRequest mtfRequest) {
		if (rs.hasErrors()){
			dto.setHotel_no(0);
		}
		List<MultipartFile> fileList = mtfRequest.getFiles("filename");

		String filename = "";
		int filesize = 0; 	
		for (MultipartFile mf : fileList) {
			String tempname = mf.getOriginalFilename();
			long tempsize = mf.getSize(); 	
			try {
				mf.transferTo(new File(upLoadPath, mf.getOriginalFilename()));
				filename+=tempname+"/";
				filesize+=tempsize;
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		dto.setFilename(filename);
		dto.setFilesize(filesize);
		int res = hotelMapper.insertHotel_sks(dto);
		
		
		return "redirect:hotelmember";
	}
	
	@RequestMapping("/hotelmember")
	public String hotelmember(HttpServletRequest req){
		List<HotelDTO_sks> list = hotelMapper.listHotel_sks();
		req.setAttribute("hotelList", list);
		return "hotel_user/hotel/hotellist";
	}
	
	@RequestMapping("/hotelupdate")
	public String hotelupdate(HttpServletRequest req){
		int hotel_no = Integer.parseInt(req.getParameter("hotel_no"));
		HotelDTO_sks dto = hotelMapper.getHotel_sks(hotel_no);
		req.setAttribute("dto", dto);
		return "hotel_user/hotel/hotelupdate";
	}
	
	@RequestMapping("/hotelupdateok")
	public String hotelupdateok(HttpServletRequest req, @ModelAttribute HotelDTO_sks dto,BindingResult result){
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
		dto.setMember_num(Integer.parseInt(req.getParameter("member_num")));
		int res = hotelMapper.updateHotel_sks(dto);
		String msg=null,url=null;
		if (res > 0) {
			msg = "호텔수정성공!! 호텔목록페이지로 이동합니다.";
			url = "hotellist";
		} else {
			msg = "호텔수정실패!! 호텔목록페이지로 이동합니다.";
			url = "hotellist";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	@RequestMapping("/hotelcontent")
	public String hotelcontent(HttpServletRequest req){
		int hotel_no = Integer.parseInt(req.getParameter("hotel_no"));
		HotelDTO_sks dto = hotelMapper.getHotel_sks(hotel_no);
		int member_num = dto.getMember_num();
		MemberDTO mdto = memberMapper.getMember_sks(member_num);
		String name = mdto.getName();
		//filename split사용해서 끊어서 보내기
		/*String hotelfile = dto.getFilename();
		String regex="/";
		String [] filearr = hotelfile.split(regex);
		
		req.setAttribute("filearr", filearr);*/
		
		req.setAttribute("hoteloner", name);
		req.setAttribute("getHotel", dto);
		return "hotel_user/hotel/hotelcontent";
	}
	
	@RequestMapping("/hotellist")
	public String hotellist(HttpServletRequest req){
		List<HotelDTO_sks> list = hotelMapper.listHotel_sks();
		req.setAttribute("hotelList", list);
		return "hotel_user/hotel/hotellist";
	}
	
	@RequestMapping("/hoteldelete")
	public String hoteldelete(){
		return "hotel_user/hotel/hoteldelete";
	}
	
	/*
	룸 컨트롤
	*/
	
	@RequestMapping("/roominsert")
	public String roominsert(HttpServletRequest req){
		int hotel_no = Integer.parseInt(req.getParameter("hotel_no"));
		req.setAttribute("hotel_no", hotel_no);
		return "hotel_user/room/roominsert";
	}
	
	@RequestMapping("/roominsertok")
	public String roominsertok(HttpServletRequest req,
			@ModelAttribute RoomDTO_sks dto, BindingResult rs,MultipartHttpServletRequest mtfRequest){
		if(rs.hasErrors()){
			dto.setHotel_no(0);
			/*dto.setRoom_no(0);*/
		}
		List<MultipartFile> fileList = mtfRequest.getFiles("filename");
		int hotel_no = Integer.parseInt(req.getParameter("hotel_no"));
		
		roomMapper.seqUP_sks(); 
		String seq = String.valueOf(roomMapper.seqGET_sks());

		String filename = "";
		int filesize = 0; 	
		for (MultipartFile mf : fileList) {
			String tempname = mf.getOriginalFilename();
			long tempsize = mf.getSize(); 	
			try {
				mf.transferTo(new File(upLoadPath, mf.getOriginalFilename()));
				filename+=tempname+"/";
				filesize+=tempsize;
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		for (int i = 1; i <= dto.getRooms(); i++) {
			dto.setFilename(filename);
			dto.setFilesize(filesize);
			dto.setRoom_no(seq + "-" + i);
			dto.setHotel_no(hotel_no);
			int res = roomMapper.insertRoom_sks(dto);
		}
		if(dto.getHotel_no()==hotel_no){
			List<RoomDTO_sks> list = roomMapper.listRoom2_sks(hotel_no);
			req.setAttribute("roomList", list);
		}
		

		return "hotel_user/room/roomlist";
	}
	
	@RequestMapping("/roomlist")
	public String roomlist(HttpServletRequest req, @ModelAttribute RoomDTO_sks dto){
		int hotel_no = Integer.parseInt(req.getParameter("hotel_no"));
		if(dto.getHotel_no()==hotel_no){
			List<RoomDTO_sks> list = roomMapper.listRoom2_sks(hotel_no);
			req.setAttribute("roomList", list);	
		}
		
		return "hotel_user/room/roomlist";
	}
	
	@RequestMapping("/roomcontent")
	public String roomcontent(HttpServletRequest req){
		String room_no = req.getParameter("room_no");
		RoomDTO_sks dto = roomMapper.getRoom_sks(room_no);
		//룸 사진 여러장 가져오기
		String roomfile = dto.getFilename();
		String regex="/";
		String [] filearr = roomfile.split(regex);
		
		req.setAttribute("filearr", filearr);
		req.setAttribute("getRoom", dto);
		
		return "hotel_user/room/roomcontent";
	}
	
	/*
	호텔 예약페이지 팝업 컨트롤
	*/
	
	//예약하기 버튼 클릭 후 로그인 창 열기
		@RequestMapping("/loginclear")
		public String loginclear(HttpServletRequest req){
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
			return "hotel_user/member/loginclear";
		}
		
		//로그인 창 팝업 로그인 작업 완료 후 팝업창 닫는 jsp로 가기
		@RequestMapping("/loginclearok")
		public String loginclearOk(HttpServletRequest req, HttpServletResponse resp){
			String id = req.getParameter("id");
			String passwd = req.getParameter("passwd");
			String saveId = req.getParameter("saveId");
			int res = memberMapper.memberLogin_sks(id, passwd);
			String msg = null, url = null;
		switch(res){
		case 0 :
			MemberDTO dto = memberMapper.getMember1_sks(id);
			HttpSession session = req.getSession();
			Cookie ck = new Cookie("id", id);
			if(saveId != null){
				ck.setMaxAge(10*60);
				
			}else{
				ck.setMaxAge(0);
				
			}
			resp.addCookie(ck);
			session.setAttribute("sedto", dto);
			msg = dto.getName() + "님 환영합니다. 로그인 창을 닫습니다.";
			url = "popup";
			break;
						
		case 1 :
			msg = "비밀번호를 잘못 입력하셨습니다. 다시 입력해 주세요";
			url = "loginclear";
			break;
						
		case 2 :
			msg = "없는 아이디 입니다. 다시 확인하시고 입력해 주세요";
			url = "loginclear";
			break;
					
		}
					
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}
		
		//로그인 완료 후 팝업 창 닫기
		@RequestMapping("/popup")
		public String popup(){
			return "hotel_user/hotel_resv/popup";
	}	
	
		/*
		호텔 예약 컨트롤
		*/
		
		@RequestMapping("/hotel_resv")
		public String hotel_resvselect(){
			return "hotel_user/hotel_resv/hotel_resv";
		}
		
		@RequestMapping("/hotel_resvlist")
		public String hotel_resvlist(HttpServletRequest req/*,@ModelAttribute HotelDTO dto,@ModelAttribute RoomDTO rdto*/){
			List<String> list = hotelMapper.getRoomno_sks(req.getParameter("address"),req.getParameter("sleeps"));
			List<HotelDTO_sks> hlist = new ArrayList<HotelDTO_sks>();
			List<RoomDTO_sks> rlist = new ArrayList<RoomDTO_sks>();
			int stay = 0;
			//호텔,룸 리스트 가져오기(호텔 넘버와 인원 수 에 맞는 룸 가져오기)
			for (String i : list){
				RoomDTO_sks getroom = roomMapper.getRoom_sks(i);
				HotelDTO_sks gethotel = hotelMapper.getHotel_sks(getroom.getHotel_no());
				hlist.add(gethotel);
				rlist.add(getroom);
			}
			
			for(HotelDTO_sks hdto : hlist){
				String name=hdto.getFilename();
				String[] arrname=name.split("/");
				hdto.setFilename(arrname[0]);
			}
			//.replaceAll("[\\-\\+\\.\\^:,]","");특수문자 제거
			
			//date 날짜 사이 값 계산(박수와 시작부터 끝 날짜 까지 불러오기)
			String strStartDate = req.getParameter("start_resv_date").replaceAll("[\\-\\+\\.\\^:,]","");
	        String strEndDate = req.getParameter("end_resv_date").replaceAll("[\\-\\+\\.\\^:,]","");
	        String strFormat = "yyyyMMdd";    //strStartDate 와 strEndDate 의 format
	        
	        //SimpleDateFormat 을 이용하여 startDate와 endDate의 Date 객체를 생성한다.
	        SimpleDateFormat sdf = new SimpleDateFormat(strFormat);
	        try{
	            Date startDate = sdf.parse(strStartDate);
	            Date endDate = sdf.parse(strEndDate);
	 
	            //두날짜 사이의 시간 차이를 하루 동안의 (24시*60분*60초*1000밀리초) 로 나눈다.
	            long diffDay = (startDate.getTime() - endDate.getTime()) / (24*60*60*1000);
	           
	            stay = (int)Math.abs(diffDay);
	            Calendar c1 = Calendar.getInstance();
	            Calendar c2 = Calendar.getInstance();

	            //Calendar 타입으로 변경 add()메소드로 1일씩 추가해 주기위해 변경
	            c1.setTime( startDate );
	            c2.setTime( endDate );
	            
	            while( c1.compareTo( c2 ) !=1 ){

	                //시작날짜 + 1 일
	                c1.add(Calendar.DATE, 1);
	                }
	        }catch(ParseException e){
	            e.printStackTrace();
	        }
			
			req.setAttribute("stay", stay);
			req.setAttribute("address", req.getParameter("address"));
			req.setAttribute("roomsu", req.getParameter("roomsu"));
			req.setAttribute("sleeps", req.getParameter("sleeps"));
			req.setAttribute("start_resv_date", req.getParameter("start_resv_date"));
			req.setAttribute("end_resv_date", req.getParameter("end_resv_date"));
			req.setAttribute("rlist", rlist);
			req.setAttribute("hlist", hlist);
			return "hotel_user/hotel_resv/hotel_resvlist";
		}
		
		@RequestMapping("/hotel_resvcontent")
		public String hotel_resvcontent(HttpServletRequest req){
			/*HttpSession session = req.getSession();*/
			int hotel_no = Integer.parseInt(req.getParameter("hotel_no"));
			HotelDTO_sks hdto = hotelMapper.getHotel_sks(hotel_no);
			
			//호텔의 룸 등급별 룸 하나 가져오기
			RoomDTO_sks rdto1 = roomMapper.getRoom2_sks(hotel_no,1);
			RoomDTO_sks rdto2 = roomMapper.getRoom2_sks(hotel_no,2);
			RoomDTO_sks rdto3 = roomMapper.getRoom2_sks(hotel_no,3);
			
			int stay=0;
			String strStartDate = req.getParameter("start_resv_date").replaceAll("[\\-\\+\\.\\^:,]","");
	        String strEndDate = req.getParameter("end_resv_date").replaceAll("[\\-\\+\\.\\^:,]","");
	        String strFormat = "yyyyMMdd";    
	        
	        SimpleDateFormat sdf = new SimpleDateFormat(strFormat);
	        try{
	            Date startDate = sdf.parse(strStartDate);
	            Date endDate = sdf.parse(strEndDate);
	 
	            long diffDay = (startDate.getTime() - endDate.getTime()) / (24*60*60*1000);
	           
	            stay = (int)Math.abs(diffDay);
	            Calendar c1 = Calendar.getInstance();
	            Calendar c2 = Calendar.getInstance();

	            
	            c1.setTime( startDate );
	            c2.setTime( endDate );
	            
	            while( c1.compareTo( c2 ) !=1 ){

	                c1.add(Calendar.DATE, 1);
	                }
	        }catch(ParseException e){
	            e.printStackTrace();
	        }
			
			//검색 값 유지
			req.setAttribute("stay", stay);
			req.setAttribute("address", req.getParameter("address"));
			req.setAttribute("roomsu", req.getParameter("roomsu"));
			req.setAttribute("sleeps", req.getParameter("sleeps"));
			req.setAttribute("start_resv_date", req.getParameter("start_resv_date"));
			req.setAttribute("end_resv_date", req.getParameter("end_resv_date"));
			//디럭스
			req.setAttribute("d", rdto1);
			//스탠다드
			req.setAttribute("s", rdto2);
			//패밀리
			req.setAttribute("f", rdto3);
			req.setAttribute("droom_su", 10);
			req.setAttribute("getHotel", hdto);
			req.setAttribute("hotel_no", req.getParameter("hotel_no"));
			req.setAttribute("room_no", req.getParameter("room_no"));
			return "hotel_user/hotel_resv/hotel_resvcontent";
		}
		
		@RequestMapping("/hotel_resvroomcontent")
		public String hotel_resvroomcontent(HttpServletRequest req){
			RoomDTO_sks rdto = roomMapper.getRoom2_sks(Integer.parseInt(req.getParameter("hotel_no")),Integer.parseInt(req.getParameter("grade")));
			
			req.setAttribute("rdto", rdto);
			return "hotel_user/hotel_resv/hotel_resvroomcontent";
		}
		
		
		//예약 하기!(예약 페이지, 선택 한 룸에 대한 정보 보여주기)
		@RequestMapping("/hotel_resvfinal")
		public String hotel_resvfinal(HttpServletRequest req,MemberDTO mdto){
			int hotel_no = Integer.parseInt(req.getParameter("hotel_no"));
			//호텔 이름 가져오기
			HotelDTO_sks hdto = hotelMapper.getHotel_sks(hotel_no);
			String hotelname = hdto.getName();
			
			//총액 구하기
			int d_price=0;
			int s_price=0;
			int f_price=0;
			int stay=Integer.parseInt(req.getParameter("stay"));
			
			int d_roomsu = Integer.parseInt(req.getParameter("d_roomsu"));
			int s_roomsu = Integer.parseInt(req.getParameter("s_roomsu"));
			int f_roomsu = Integer.parseInt(req.getParameter("f_roomsu"));
			int d_grade=0,s_grade=0,f_grade=0;
			
			//룸 넘버를 불러오기 위해 grade별 넘어온 예약 수 의 따른 grade설정
			if(d_roomsu>0){
				d_grade=1;
			}
			if(s_roomsu>0){
				s_grade=2;
			}
			if(f_roomsu>0){
				f_grade=3;
			}
			
			//grade가 0이 아닐 때 예약 가능한 방의 room_no 가져오기.
			if(d_grade!=0){
				//등급과 호텔에 맞는 룸가져오기
				RoomDTO_sks drdto = roomMapper.getRoom2_sks(hotel_no,d_grade);
				//선택 한 등급에 맞는 룸dto가져오기
				List<RoomDTO_sks> drlist = roomMapper.getResvRoom_sks(hotel_no, d_grade);
				//선택 한 등급에 맞는 룸no가져오기
				List<String> d_rnlist = roomMapper.getResvRoomno_sks(hotel_no, d_grade);
				List<String> d_rn = new ArrayList<String>();
				//선택 한 등급에 맞는 룸name가져오기
				String drname = drlist.get(1).getName();
				for(int i = 0;i<d_roomsu;i++){
					d_rn.add(i, d_rnlist.get(i));
				}
				d_price=drdto.getPrice()*stay*d_roomsu;
				req.setAttribute("d_roomsu", d_roomsu);
				req.setAttribute("drdto", drdto);
				req.setAttribute("drname", drname);
				req.setAttribute("d_rn", d_rn);
			}
			if(s_grade!=0){
				RoomDTO_sks srdto = roomMapper.getRoom2_sks(hotel_no,s_grade);
				
				List<RoomDTO_sks> srlist = roomMapper.getResvRoom_sks(hotel_no, s_grade);
				
				List<String> s_rnlist = roomMapper.getResvRoomno_sks(hotel_no, s_grade);
				List<String> s_rn = new ArrayList<String>();
				
				String srname = srlist.get(1).getName();
				
				for(int i = 0;i<s_roomsu;i++){
					s_rn.add(i, s_rnlist.get(i));
				}
				s_price=srdto.getPrice()*stay*s_roomsu;
				req.setAttribute("s_roomsu", s_roomsu);
				req.setAttribute("srdto", srdto);
				req.setAttribute("srname", srname);
				req.setAttribute("s_rn", s_rn);
			}
			if(f_grade!=0){
				RoomDTO_sks frdto = roomMapper.getRoom2_sks(hotel_no,f_grade);
				
				List<RoomDTO_sks> frlist = roomMapper.getResvRoom_sks(hotel_no, f_grade);
				
				List<String> f_rnlist = roomMapper.getResvRoomno_sks(hotel_no, f_grade);
				List<String> f_rn = new ArrayList<String>();
				
				String frname = frlist.get(1).getName();
				
				for(int i = 0;i<f_roomsu;i++){
					f_rn.add(i, f_rnlist.get(i));
				}
				f_price=frdto.getPrice()*stay*f_roomsu;
				req.setAttribute("f_roomsu", f_roomsu);
				req.setAttribute("frdto", frdto);
				req.setAttribute("frname", frname);
				req.setAttribute("f_rn", f_rn);
			}
			
			//박수와 날짜 계산
			/*int stay=0;*/
			String strStartDate = req.getParameter("start_resv_date").replaceAll("[\\-\\+\\.\\^:,]","");
	        String strEndDate = req.getParameter("end_resv_date").replaceAll("[\\-\\+\\.\\^:,]","");
	        String strFormat = "yyyyMMdd";    
	        
	        SimpleDateFormat sdf = new SimpleDateFormat(strFormat);
	        try{
	            Date startDate = sdf.parse(strStartDate);
	            Date endDate = sdf.parse(strEndDate);
	 
	            long diffDay = (startDate.getTime() - endDate.getTime()) / (24*60*60*1000);
	           
	            stay = (int)Math.abs(diffDay);
	            Calendar c1 = Calendar.getInstance();
	            Calendar c2 = Calendar.getInstance();

	            
	            c1.setTime( startDate );
	            c2.setTime( endDate );
	            
	            while( c1.compareTo( c2 ) !=1 ){

	                c1.add(Calendar.DATE, 1);
	                }
	        }catch(ParseException e){
	            e.printStackTrace();
	        }
	        
			//총합 값 넘기기
	        int total = d_price+s_price+f_price;
	        req.setAttribute("total", total);
	        req.setAttribute("hotelname", hotelname);
			//검색 값 유지
	        req.setAttribute("hotel_no", hotel_no);
			req.setAttribute("stay", stay);
			req.setAttribute("start_resv_date", req.getParameter("start_resv_date"));
			req.setAttribute("end_resv_date", req.getParameter("end_resv_date"));
			
			return "hotel_user/hotel_resv/hotel_resvfinal";
		}
		
		//결제하는 페이지
		@RequestMapping("/hotel_resvpayment")
		public String hotel_resvpayment(HttpServletRequest req){
			//넘겨줄 값
			String start = req.getParameter("start_resv_date");
			String end = req.getParameter("end_resv_date");
			int hotel_no = Integer.parseInt(req.getParameter("hotel_no"));
			int member_no = Integer.parseInt(req.getParameter("member_no"));
			
			//넘어온 룸 넘버 가져와서 배열로 옮기기
			String[] droom_no = new String[]{};
			String[] sroom_no = new String[]{};
			String[] froom_no = new String[]{};
			
			if (req.getParameterValues("d_rn") != null) {
				//jsp에서 넘어온 룸 넘버가 여러 개 일 때 []과 공백 제거 후 스플릿으로 배열에 저장
				/*String d = req.getParameter("d_rn").replaceAll("[\\[\\]\\p{Z}]","");
				droom_no=d.split(",");
				req.setAttribute("droom_no", droom_no);*/
				
				req.setAttribute("dr", req.getParameter("d_rn"));
				
				//배열 잘 들어가나 확인
				/*for(int i = 0;i<Integer.parseInt(req.getParameter("d_roomsu"));i++){
					System.out.println(droom_no[i]);
				}*/
			}
			if (req.getParameter("s_rn") != null) {
				/*String s = req.getParameter("s_rn").replaceAll("[\\[\\]\\p{Z}]","");
				sroom_no=s.split(",");
				req.setAttribute("sroom_no",sroom_no);*/
				
				req.setAttribute("sr", req.getParameter("s_rn"));
				
				/*for(int i = 0;i<Integer.parseInt(req.getParameter("s_roomsu"));i++){
					System.out.println(sroom_no[i]);
				}*/
			}
			if (req.getParameter("f_rn") != null) {
				/*String f = req.getParameter("f_rn").replaceAll("[\\[\\]\\p{Z}]","");
				froom_no=f.split(",");
				req.setAttribute("froom_no", froom_no);*/
				
				req.setAttribute("fr", req.getParameter("f_rn"));
				
				/*for(int i = 0;i<Integer.parseInt(req.getParameter("f_roomsu"));i++){
					System.out.println(froom_no[i]);
				}*/
			}
			int total=Integer.parseInt(req.getParameter("total"));
			//결제 하면서 데이터 넘겨 주기
			req.setAttribute("use_point", req.getParameter("use_point"));
			req.setAttribute("user_point", req.getParameter("user_point"));
			req.setAttribute("save_point", req.getParameter("save_point"));
			req.setAttribute("member_no", member_no);
			req.setAttribute("hotel_no", hotel_no);
			req.setAttribute("start_resv_date", start);
			req.setAttribute("end_resv_date", end);
			req.setAttribute("total", total);
			return "hotel_user/hotel_resv/hotel_resvpayment";
		}
		
		//결제 완료 후 페이지,예약 테이블에 값 넣어주기
		@RequestMapping("/hotel_paymentok")
		public String hotel_paymentok(HttpServletRequest req,@ModelAttribute HotelResvDTO_sks dto){
			//전 페이지에서 배열로 넘겨지지 못해서 다시 쓰는거..
			String d = req.getParameter("droom_no").replaceAll("[\\[\\]\\p{Z}]","");
			String s = req.getParameter("sroom_no").replaceAll("[\\[\\]\\p{Z}]","");
			String f = req.getParameter("froom_no").replaceAll("[\\[\\]\\p{Z}]","");
			
			String room_no = "";
			
			//디럭스를 선택했을 때
			if(d!=null){
				//d!=""해주지 않으면 넘어갈 때 0이 선택되면 //가 추가되서 넘어간다.
				if(d!=""){
			String[] droom_no=d.split(",");
			req.setAttribute("droom_no", droom_no);
			for(int i = 0;i<droom_no.length;i++){
				room_no+=droom_no[i]+"/";
					}
				}
			}
			
			//스탠다드를 선택했을 때
			if(s!=null){
				if(s!=""){
			String[] sroom_no=s.split(",");
			req.setAttribute("sroom_no", sroom_no);
			for(int i = 0;i<sroom_no.length;i++){
				room_no+=sroom_no[i]+"/";
			}
			 }
			}
			
			//패밀리를 선택했을 때
			if(f!=null){
				if(f!=""){
			String[] froom_no=f.split(",");
			req.setAttribute("froom_no", froom_no);
			for(int i = 0;i<froom_no.length;i++){
				room_no+=froom_no[i]+"/";
			}
			 }
			}
			
			//예약 DTO에 넣어줄 값 가져오기!
			int member_no = Integer.parseInt(req.getParameter("member_no"));
			int hotel_no = Integer.parseInt(req.getParameter("hotel_no"));
			String start_resv_date = req.getParameter("start_resv_date");
			String end_resv_date = req.getParameter("end_resv_date");
			int total = Integer.parseInt(req.getParameter("total"));
			int save_point= Integer.parseInt(req.getParameter("save_point"));		
			int use_point = Integer.parseInt(req.getParameter("use_point"));
			int user_point = Integer.parseInt(req.getParameter("user_point"))+save_point;
			String pay = "O";
			System.out.println(member_no);
			//예약 DTO에 값 넣어주기!
			dto.setMember_no(member_no);
			dto.setHotel_no(hotel_no);
			dto.setRoom_no(room_no);
			dto.setUse_point(use_point);
			dto.setPay(pay);
			dto.setSave_point(save_point);
			dto.setStart_resv_date(start_resv_date);
			dto.setEnd_resv_date(end_resv_date);
			int res = hotelResvMapper.insertHotelResv_sks(dto);
			List<HotelResvDTO_sks> h_resvdto = hotelResvMapper.getHotelResv_sks(member_no);
			if(res>0){
				HttpSession session = req.getSession();
				session.setAttribute("h_resvdto", h_resvdto);
			}
			
			if(res<0){
				String msg = "예약이 제대로 이루어지지 않았습니다. 다시 확인하시고 입력해 주세요";
				String url = "hotel_resvfinal";
						
				req.setAttribute("msg", msg);
				req.setAttribute("url", url);
				return "message";
			}
			//결제 후 잔여 포인트,금액에 따른 포인트 저장
			int update_point = memberMapper.updateMemberPoint_sks(user_point, member_no);
			if(update_point<0){
				String msg = "고객님의 포인트가 제대로 변경되지 않았습니다. 관리자에게 문의해주세요.";
				String url = "hotel_resvfinal";
				
				req.setAttribute("msg", msg);
				req.setAttribute("url", url);
				return "message";
			}
			
			
			req.setAttribute("total", total);
			
			return "hotel_user/hotel_resv/hotel_paymentok";
		}
		
		@RequestMapping("/hotel_paymentoklist")
		public String hotel_paymentoklist(HttpServletRequest req){
			HttpSession session = req.getSession();
			if(session.getAttribute("sedto")==null){
				session.removeAttribute("h_resvdto");
			}
			req.setAttribute("total", req.getParameter("total"));
			
			return "hotel_user/hotel_resv/hotel_paymentoklist";
		}

}























