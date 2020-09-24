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
		return "CSS";
	}
	
	@RequestMapping("/main")
	public String main(){
		return "home";
	}
	
	/*
	�쉶�썝 而⑦듃濡�
	*/
	
	@RequestMapping(value="/membercheck", method=RequestMethod.GET)
	public ModelAndView member(){
		String msg="�쉶�썝 泥댄겕 �럹�씠吏�濡� 媛묐땲�떎.";
		String url="membercheckpage";
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", msg);
		mv.addObject("url",url);
		mv.setViewName("message");
		return mv;
	}
	
	@RequestMapping("/membercheckpage")
	public String chekpage(){
		return "member/membercheck";
	}
	
	@RequestMapping(value="/membercheck", method=RequestMethod.POST)
	public String chekMember(HttpServletRequest req){
		String name = req.getParameter("name");
		String ssn1 = req.getParameter("ssn1");
		String ssn2 = req.getParameter("ssn2");
		
		boolean chek = memberMapper.checkMember_sks(ssn1, ssn2);
		
		String msg = null,url=null;
		if (chek){
			msg = "�쁽�옱 �쉶�썝�씠�떗�땲�떎. 濡쒓렇�씤�쓣 �빐 二쇱꽭�슂";
			url = "memberlist";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}else {
			msg="�쉶�썝媛��엯 �럹�씠吏�濡� 媛묐땲�떎.";
			req.setAttribute("msg", msg);		
			req.setAttribute("name",name);
			req.setAttribute("ssn1",ssn1);
			req.setAttribute("ssn2",ssn2);
	
	        return "member/member";
		}
	}
	
	@RequestMapping("/memberok")
	public String memberInputOk(HttpServletRequest req, MemberDTO_sks dto) {
		int sex=Integer.parseInt(req.getParameter("sex"));
		int res = memberMapper.insertMember_sks(dto,sex);
		String msg = null, url = null;
		if (res > 0) {
			msg = "�쉶�썝媛��엯�꽦怨�!! �쉶�썝紐⑸줉�럹�씠吏�濡� �씠�룞�빀�땲�떎.";
			url = "memberlist";
		} else {
			msg = "�쉶�썝媛��엯�떎�뙣!! �쉶�썝媛��엯�럹�씠吏�濡� �씠�룞�빀�땲�떎.";
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
		return "member/memberlist";
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
		return "member/login";
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
			msg = dto.getName() + "�떂 �솚�쁺�빀�땲�떎. 硫붿씤�럹�씠吏�濡� �씠�룞�빀�땲�떎.";
			url = "main";
			break;
			
		case 1 :
			msg = "鍮꾨�踰덊샇瑜� �옒紐� �엯�젰�븯�뀲�뒿�땲�떎. �떎�떆 �엯�젰�빐 二쇱꽭�슂";
			url = "member/login";
			break;
			
		case 2 :
			msg = "�뾾�뒗 �븘�씠�뵒 �엯�땲�떎. �떎�떆 �솗�씤�븯�떆怨� �엯�젰�빐 二쇱꽭�슂";
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
		req.setAttribute("msg", "濡쒓렇�븘�썐 �릺�뿀�뒿�땲�떎. 硫붿씤�럹�씠吏�濡� �씠�룞�빀�땲�떎.");
		req.setAttribute("url", "main");
		return "message";
		
	}
	
	/*
	�샇�뀛 而⑦듃濡�
	*/
	
	@RequestMapping("/hotelcheck")
	public String hotelcheck(){
		return "hotel/hotelmain";
	}
	
	@RequestMapping("/hoteladmin")
	public String hoteladmin(){
		return "hotel/hotelinsert";
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
		return "hotel/hotellist";
	}
	
	@RequestMapping("/hotelupdate")
	public String hotelupdate(HttpServletRequest req){
		int hotel_no = Integer.parseInt(req.getParameter("hotel_no"));
		HotelDTO_sks dto = hotelMapper.getHotel_sks(hotel_no);
		req.setAttribute("dto", dto);
		return "hotel/hotelupdate";
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
			msg = "�샇�뀛�닔�젙�꽦怨�!! �샇�뀛紐⑸줉�럹�씠吏�濡� �씠�룞�빀�땲�떎.";
			url = "hotellist";
		} else {
			msg = "�샇�뀛�닔�젙�떎�뙣!! �샇�뀛紐⑸줉�럹�씠吏�濡� �씠�룞�빀�땲�떎.";
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
		//filename split�궗�슜�빐�꽌 �걡�뼱�꽌 蹂대궡湲�
		/*String hotelfile = dto.getFilename();
		String regex="/";
		String [] filearr = hotelfile.split(regex);
		
		req.setAttribute("filearr", filearr);*/
		
		req.setAttribute("hoteloner", name);
		req.setAttribute("getHotel", dto);
		return "hotel/hotelcontent";
	}
	
	@RequestMapping("/hotellist")
	public String hotellist(HttpServletRequest req){
		List<HotelDTO_sks> list = hotelMapper.listHotel_sks();
		req.setAttribute("hotelList", list);
		return "hotel/hotellist";
	}
	
	@RequestMapping("/hoteldelete")
	public String hoteldelete(){
		return "hotel/hoteldelete";
	}
	
	/*
	猷� 而⑦듃濡�
	*/
	
	@RequestMapping("/roominsert")
	public String roominsert(HttpServletRequest req){
		int hotel_no = Integer.parseInt(req.getParameter("hotel_no"));
		req.setAttribute("hotel_no", hotel_no);
		return "room/roominsert";
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
		

		return "room/roomlist";
	}
	
	@RequestMapping("/roomlist")
	public String roomlist(HttpServletRequest req, @ModelAttribute RoomDTO_sks dto){
		int hotel_no = Integer.parseInt(req.getParameter("hotel_no"));
		if(dto.getHotel_no()==hotel_no){
			List<RoomDTO_sks> list = roomMapper.listRoom2_sks(hotel_no);
			req.setAttribute("roomList", list);	
		}
		
		return "room/roomlist";
	}
	
	@RequestMapping("/roomcontent")
	public String roomcontent(HttpServletRequest req){
		String room_no = req.getParameter("room_no");
		RoomDTO_sks dto = roomMapper.getRoom_sks(room_no);
		//猷� �궗吏� �뿬�윭�옣 媛��졇�삤湲�
		String roomfile = dto.getFilename();
		String regex="/";
		String [] filearr = roomfile.split(regex);
		
		req.setAttribute("filearr", filearr);
		req.setAttribute("getRoom", dto);
		
		return "room/roomcontent";
	}
	
	/*
	�샇�뀛 �삁�빟 而⑦듃濡�
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
		//�샇�뀛,猷� 由ъ뒪�듃 媛��졇�삤湲�(�샇�뀛 �꽆踰꾩� �씤�썝 �닔 �뿉 留욌뒗 猷� 媛��졇�삤湲�)
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
		//.replaceAll("[\\-\\+\\.\\^:,]","");�듅�닔臾몄옄 �젣嫄�
		
		//date �궇吏� �궗�씠 媛� 怨꾩궛(諛뺤닔�� �떆�옉遺��꽣 �걹 �궇吏� 源뚯� 遺덈윭�삤湲�)
		String strStartDate = req.getParameter("start_resv_date").replaceAll("[\\-\\+\\.\\^:,]","");
        String strEndDate = req.getParameter("end_resv_date").replaceAll("[\\-\\+\\.\\^:,]","");
        String strFormat = "yyyyMMdd";    //strStartDate �� strEndDate �쓽 format
        
        //SimpleDateFormat �쓣 �씠�슜�븯�뿬 startDate�� endDate�쓽 Date 媛앹껜瑜� �깮�꽦�븳�떎.
        SimpleDateFormat sdf = new SimpleDateFormat(strFormat);
        try{
            Date startDate = sdf.parse(strStartDate);
            Date endDate = sdf.parse(strEndDate);
 
            //�몢�궇吏� �궗�씠�쓽 �떆媛� 李⑥씠瑜� �븯猷� �룞�븞�쓽 (24�떆*60遺�*60珥�*1000諛�由ъ큹) 濡� �굹�늿�떎.
            long diffDay = (startDate.getTime() - endDate.getTime()) / (24*60*60*1000);
           
            stay = (int)Math.abs(diffDay);
            Calendar c1 = Calendar.getInstance();
            Calendar c2 = Calendar.getInstance();

            //Calendar ���엯�쑝濡� 蹂�寃� add()硫붿냼�뱶濡� 1�씪�뵫 異붽��빐 二쇨린�쐞�빐 蹂�寃�
            c1.setTime( startDate );
            c2.setTime( endDate );
            
            while( c1.compareTo( c2 ) !=1 ){

                //�떆�옉�궇吏� + 1 �씪
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
		return "hotel_resv/hotel_resvlist";
	}
	
	@RequestMapping("/hotel_resvcontent")
	public String hotel_resvcontent(HttpServletRequest req){
		/*HttpSession session = req.getSession();*/
		int hotel_no = Integer.parseInt(req.getParameter("hotel_no"));
		HotelDTO_sks hdto = hotelMapper.getHotel_sks(hotel_no);
		
		//�샇�뀛�쓽 猷� �벑湲됰퀎 猷� �븯�굹 媛��졇�삤湲�
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
		
		//寃��깋 媛� �쑀吏�
		req.setAttribute("stay", stay);
		req.setAttribute("address", req.getParameter("address"));
		req.setAttribute("roomsu", req.getParameter("roomsu"));
		req.setAttribute("sleeps", req.getParameter("sleeps"));
		req.setAttribute("start_resv_date", req.getParameter("start_resv_date"));
		req.setAttribute("end_resv_date", req.getParameter("end_resv_date"));
		//�뵒�윮�뒪
		req.setAttribute("d", rdto1);
		//�뒪�깲�떎�뱶
		req.setAttribute("s", rdto2);
		//�뙣諛�由�
		req.setAttribute("f", rdto3);
		req.setAttribute("getHotel", hdto);
		req.setAttribute("hotel_no", req.getParameter("hotel_no"));
		req.setAttribute("room_no", req.getParameter("room_no"));
		return "hotel_resv/hotel_resvcontent";
	}
	
	@RequestMapping("/hotel_resvroomcontent")
	public String hotel_resvroomcontent(HttpServletRequest req){
		RoomDTO_sks rdto = roomMapper.getRoom2_sks(Integer.parseInt(req.getParameter("hotel_no")),Integer.parseInt(req.getParameter("grade")));
		
		req.setAttribute("rdto", rdto);
		return "hotel_resv/hotel_resvroomcontent";
	}
	
	@RequestMapping("/hotel_resvfinal")
	public String hotel_resvfinal(HttpServletRequest req){
		HttpSession session = req.getSession();
		MemberDTO_sks dto = (MemberDTO_sks) session.getAttribute("sedto");
		String msg=null ,url = null;
		
		
		
		return "hotel_resv/hotel_resvfinal";
	}
	
	//�삁�빟�븯湲� 踰꾪듉 �겢由� �썑 濡쒓렇�씤 李�,濡쒓렇�씤李� �떕湲�
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
		return "member/loginclear";
	}
	
	@RequestMapping("/popup")
	public String popup(){
		return "hotel_resv/popup";
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
			msg = dto.getName() + "�떂 �솚�쁺�빀�땲�떎. 濡쒓렇�씤 李쎌쓣 �떕�뒿�땲�떎.";
			url = "popup";
			break;
			
		case 1 :
			msg = "鍮꾨�踰덊샇瑜� �옒紐� �엯�젰�븯�뀲�뒿�땲�떎. �떎�떆 �엯�젰�빐 二쇱꽭�슂";
			url = "loginclear";
			break;
			
		case 2 :
			msg = "�뾾�뒗 �븘�씠�뵒 �엯�땲�떎. �떎�떆 �솗�씤�븯�떆怨� �엯�젰�빐 二쇱꽭�슂";
			url = "loginclear";
			break;
		
		}
		
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
		
		
	}
}























