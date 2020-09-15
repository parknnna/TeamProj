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
import team.Dproject.main.model.MemberDTO_sks;
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
	public String memberInputOk(HttpServletRequest req, MemberDTO_sks dto) {
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
		List<MemberDTO_sks> list = memberMapper.listMember_sks();
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
			MemberDTO_sks dto = memberMapper.getMember1_sks(id);
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
		MemberDTO_sks mdto = memberMapper.getMember_sks(member_num);
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
	
	@RequestMapping("/hotel_resvfinal")
	public String hotel_resvfinal(HttpServletRequest req){
		HttpSession session = req.getSession();
		MemberDTO_sks dto = (MemberDTO_sks) session.getAttribute("sedto");
		String msg=null ,url = null;
		
		
		
		return "hotel_user/hotel_resv/hotel_resvfinal";
	}
	
	//예약하기 버튼 클릭 후 로그인 창,로그인창 닫기
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
	
	@RequestMapping("/popup")
	public String popup(){
		return "hotel_user/hotel_resv/popup";
	}
	
	@RequestMapping("/loginclearok")
	public String loginclearOk(HttpServletRequest req, HttpServletResponse resp){
		String id = req.getParameter("id");
		String passwd = req.getParameter("passwd");
		String saveId = req.getParameter("saveId");
		int res = memberMapper.memberLogin_sks(id, passwd);
		String msg = null, url = null;
		switch(res){
		case 0 :
			MemberDTO_sks dto = memberMapper.getMember1_sks(id);
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
}























