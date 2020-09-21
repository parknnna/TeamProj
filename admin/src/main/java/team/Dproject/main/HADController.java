package team.Dproject.main;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import team.Dproject.main.model.MemberDTO_sm;
import team.Dproject.main.model.downDTO;
import team.Dproject.main.model.hotelDTO;
import team.Dproject.main.model.hotel_boardDTO;
import team.Dproject.main.model.resvDTO;
import team.Dproject.main.model.roomDTO;
import team.Dproject.main.model.upDTO;
import team.Dproject.main.service.DownMapper;
import team.Dproject.main.service.HotelMapper;
import team.Dproject.main.service.Hotel_boardMapper;
import team.Dproject.main.service.MemberMapper;
import team.Dproject.main.service.ResvMapper;
import team.Dproject.main.service.RoomMapper;
import team.Dproject.main.service.UpMapper;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HADController {

	@Autowired
	private HotelMapper hotelMapper;
	@Autowired
	private RoomMapper roomMapper;
	@Autowired
	private ResvMapper resvMapper;
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private Hotel_boardMapper hotel_boardMapper;
	@Autowired
	private UpMapper upMapper;
	@Autowired
	private DownMapper downMapper;

	private int memNUM;

	@Resource(name = "upLoadPath")
	private String upLoadPath;

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	


	//======================================================================================
	@RequestMapping(value="/hotel_board_up.do")
	public String up(HttpServletRequest req, HttpSession session) {
		int hotel_board_no=Integer.parseInt(req.getParameter("hotel_board_no"));
		int member_no=(Integer)session.getAttribute("MNUM");
		List<upDTO> ulist=upMapper.up_list(member_no,hotel_board_no);
		List<downDTO> dlist=downMapper.down_list(member_no,hotel_board_no);
		String msg = null, url = null;
		if(dlist.size()!=0){
			msg = "이미 싫어요";
			url = "hotel_content.do?hotel_board_no="+hotel_board_no+"&hotel_no="+req.getParameter("hotel_no");
		}else if(ulist.size()==0){//싫어요 체크
			upMapper.up_insert(member_no, hotel_board_no);
			List<upDTO> ulist2=upMapper.up_list2(member_no,hotel_board_no);
			hotel_boardMapper.upUpdate(ulist2.size(), hotel_board_no);
			msg = "좋아요.";
			url = "hotel_content.do?hotel_board_no="+hotel_board_no+"&hotel_no="+req.getParameter("hotel_no");
		}else{
			msg = "이미 좋아요";
			url = "hotel_content.do?hotel_board_no="+hotel_board_no+"&hotel_no="+req.getParameter("hotel_no");
		}
		
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	@RequestMapping(value="/hotel_board_up_re.do")
	public String up_re(HttpServletRequest req, HttpSession session) {
		int hotel_board_no=Integer.parseInt(req.getParameter("hotel_board_no"));
		int member_no=(Integer)session.getAttribute("MNUM");
		String msg = null, url = null;
		int res=upMapper.up_delete(member_no, hotel_board_no);
		List<upDTO> ulist2=upMapper.up_list2(member_no,hotel_board_no);
		if(res>0){
			hotel_boardMapper.upUpdate(ulist2.size(), hotel_board_no);
			msg = "좋아요 취소.";
			url = "hotel_content.do?hotel_board_no="+hotel_board_no+"&hotel_no="+req.getParameter("hotel_no");
		}else{
			msg = "취소 실패";
			url = "hotel_content.do?hotel_board_no="+hotel_board_no+"&hotel_no="+req.getParameter("hotel_no");
		}
		
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	@RequestMapping(value="/hotel_board_down_re.do")
	public String down_re(HttpServletRequest req, HttpSession session) {
		int hotel_board_no=Integer.parseInt(req.getParameter("hotel_board_no"));
		int member_no=(Integer)session.getAttribute("MNUM");
		String msg = null, url = null;
		int res=downMapper.down_delete(member_no, hotel_board_no);
		if(res>0){
			msg = "싫어요 취소.";
			url = "hotel_content.do?hotel_board_no="+hotel_board_no+"&hotel_no="+req.getParameter("hotel_no");
		}else{
			msg = "취소 실패";
			url = "hotel_content.do?hotel_board_no="+hotel_board_no+"&hotel_no="+req.getParameter("hotel_no");
		}
		
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	
	@RequestMapping(value="/hotel_board_down.do")
	public String down(HttpServletRequest req, HttpSession session) {
		int hotel_board_no=Integer.parseInt(req.getParameter("hotel_board_no"));
		int member_no=(Integer)session.getAttribute("MNUM");
		List<upDTO> ulist=upMapper.up_list(member_no,hotel_board_no);
		List<downDTO> dlist=downMapper.down_list(member_no,hotel_board_no);
		String msg = null, url = null;
		if(ulist.size()!=0){
			msg = "이미 좋아요.";
			url = "hotel_content.do?hotel_board_no="+hotel_board_no+"&hotel_no="+req.getParameter("hotel_no");
		}else if(dlist.size()==0){//싫어요 체크
			downMapper.down_insert(member_no, hotel_board_no);
			msg = "싫어요.";
			url = "hotel_content.do?hotel_board_no="+hotel_board_no+"&hotel_no="+req.getParameter("hotel_no");
		}else{
			msg = "이미 좋아요";
			url = "hotel_content.do?hotel_board_no="+hotel_board_no+"&hotel_no="+req.getParameter("hotel_no");
		}
		
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	@RequestMapping(value="/hotel_board_list.do")
	public ModelAndView listBoard(HttpServletRequest req) {
		String no=req.getParameter("hotel_no");
		hotelDTO hdto=hotelMapper.getHotel(no);
		int hotel_no=Integer.parseInt(no);
		int pageSize=5;
		String pageNum=req.getParameter("pageNum");
		if(pageNum==null){
			pageNum="1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = currentPage * pageSize - (pageSize-1);
		int endRow = currentPage * pageSize;
		int count = 0;
		count=hotel_boardMapper.hotel_board_count();
		if(endRow>count){
			endRow=count;
		}
		List<hotel_boardDTO> list = hotel_boardMapper.listHotel_board(startRow,endRow,hotel_no);
		for(hotel_boardDTO dto :list) {
			MemberDTO_sm mdto=memberMapper.getMember2(String.valueOf(dto.getMember_no()));
			dto.setMember_no(mdto.getName()); 
			dto.setRe_step(hotel_boardMapper.hotel_board_count2(dto.getRe_group()));
		}
		int startNum = count-((currentPage-1)*pageSize);
		int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
		int pageBlock = 5;
		int startPage = (currentPage-1)/pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage>pageCount) endPage = pageCount;

		ModelAndView mav = new ModelAndView();
		req.setAttribute("page_name", "Hotel Board");
		mav.setViewName("hotel_board/list");
		mav.addObject("listBoard", list);
		mav.addObject("hdto", hdto);
		mav.addObject("count",count);
		mav.addObject("startNum",startNum);
		mav.addObject("pageCount",pageCount);
		mav.addObject("pageBlock",pageBlock);
		mav.addObject("startPage",startPage);
		mav.addObject("endPage",endPage);
		return mav;
	}
	
	@RequestMapping(value="/hotel_board_write.do", method=RequestMethod.GET)
	public String writeForm(HttpServletRequest req) {
		req.setAttribute("page_name", "Hotel Board List");
		return "hotel_board/writeForm";
	}
	
	@RequestMapping(value="/hotel_board_write.do", method=RequestMethod.POST)
	public String insertBoard(MultipartHttpServletRequest mtfRequest,HttpServletRequest req, hotel_boardDTO dto,HttpSession session) {
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		int member_no=(Integer)session.getAttribute("MNUM");
		dto.setMember_no(String.valueOf(member_no));
		int count=hotel_boardMapper.hotel_board_count();
		if (dto.getHotel_board_no() == 0){
			if(count!=0){
				int max = hotel_boardMapper.hotel_board_MAX();
				dto.setRe_group(max+1);
			}else{
				dto.setRe_group(1);
			}
		}else {
			hotel_boardMapper.hotel_board_re_UP(dto.getRe_step(), dto.getRe_group());
			dto.setRe_step(dto.getRe_step() + 1);
			dto.setRe_level(dto.getRe_level() + 1);
		}
		
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
		int res = hotel_boardMapper.insertHotel_board(dto);

		String msg = null, url = null;
		if(res>0) {
			msg = "새 글 작성이 완료되었습니다. 게시글 목록으로 이동합니다.";
			url = "hotel_board_list.do?hotel_no="+dto.getHotel_no()+"&page_name=Hotel Board";
		}else {
			msg = "새 글 작성이 완료되지 않았습니다. 다시 작성해주세요.";
			url = "hotel_board_list.do?hotel_no="+dto.getHotel_no()+"&page_name=Hotel Board";
		}
		
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	@RequestMapping(value="/hotel_board_delete.do", method=RequestMethod.GET)//삭제
	public String hotel_board_delete(HttpServletRequest req) {
		hotel_boardDTO dto = hotel_boardMapper.getHotel_board(req.getParameter("hotel_board_no"));
		int res=hotel_boardMapper.deleteHotel_board(req.getParameter("hotel_board_no"));
		String msg = null, url = null;
		if(res>0) {
			msg = "글이 삭제되었습니다. 게시글 목록으로 이동합니다.";
			url = "hotel_board_list.do?hotel_no="+dto.getHotel_no()+"&page_name=Hotel Board";
		}else {
			msg = "글이 삭제되지 않았습니다. 다시 작성해주세요.";
			url = "hotel_board_list.do?hotel_no="+dto.getHotel_no()+"&page_name=Hotel Board";
		}
		
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	@RequestMapping(value="/hotel_board_delete3.do", method=RequestMethod.GET)//삭제
	public String hotel_board_delete3(HttpServletRequest req) {
		hotel_boardDTO dto = hotel_boardMapper.getHotel_board(req.getParameter("hotel_board_no"));
		int res=hotel_boardMapper.deleteHotel_board(req.getParameter("hotel_board_no"));
		String msg = null, url = null;
		if(res>0) {
			msg = "댓글삭제";
			url = "hotel_content.do?hotel_board_no="+req.getParameter("re")+"&hotel_no="+dto.getHotel_no();
		}else {
			msg = "댓글삭제실패";
			url = "hotel_content.do?hotel_board_no="+dto.getHotel_board_no()+"&hotel_no="+dto.getHotel_no();
		}
		
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	@RequestMapping(value="/hotel_board_delete2.do", method=RequestMethod.GET)//삭제
	public String hotel_board_delete2(HttpServletRequest req) {
		hotel_boardDTO dto = hotel_boardMapper.getHotel_board(req.getParameter("hotel_board_no"));
		hotel_boardMapper.deleteHotel_board2(String.valueOf(dto.getRe_group()));
		int res=hotel_boardMapper.deleteHotel_board(req.getParameter("hotel_board_no"));
		String msg = null, url = null;
		if(res>0) {
			msg = "글이 삭제되었습니다. 게시글 목록으로 이동합니다.";
			url = "hotel_board_list.do?hotel_no="+dto.getHotel_no()+"&page_name=Hotel Board";
		}else {
			msg = "글이 삭제되었습니다. 게시글 목록으로 이동합니다.";
			url = "hotel_board_list.do?hotel_no="+dto.getHotel_no()+"&page_name=Hotel Board";
		}
		
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	@RequestMapping(value="/hotel_board_update.do", method=RequestMethod.GET)//수정
	public String hotel_board_update(HttpServletRequest req) {
		hotel_boardDTO dto = hotel_boardMapper.getHotel_board(req.getParameter("hotel_board_no"));
		System.out.println(dto.getHotel_board_no());
		req.setAttribute("dto", dto);
		return "hotel_board/board_update";
	}
	
	@RequestMapping(value="/hotel_board_update.do", method=RequestMethod.POST)
	public String hotel_board_update2(MultipartHttpServletRequest mtfRequest,HttpServletRequest req, hotel_boardDTO dto,HttpSession session) {
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		
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
		int res = hotel_boardMapper.updateHotel_board(dto);

		String msg = null, url = null;
		if(res>0) {
			msg = "글 수정완료. 게시글 목록으로 이동합니다.";
			url = "hotel_board_list.do?hotel_no="+dto.getHotel_no()+"&page_name=Hotel Board";
		}else {
			msg = "새 글 작성이 완료되지 않았습니다. 다시 작성해주세요.";
			url = "hotel_board_list.do?hotel_no="+dto.getHotel_no()+"&page_name=Hotel Board";
		}
		
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	
	
	
	@RequestMapping(value="/re_insert.do", method=RequestMethod.POST)
	public String insertBoard2(HttpServletRequest req, hotel_boardDTO dto,HttpSession session) {
		int member_no=(Integer)session.getAttribute("MNUM");
		dto.setMember_no(String.valueOf(member_no));
		int count=hotel_boardMapper.hotel_board_count();
		if (dto.getHotel_board_no() == 0){
			if(count!=0){
				int max = hotel_boardMapper.hotel_board_MAX();
				dto.setRe_group(max+1);
			}else{
				dto.setRe_group(1);
			}
		}else {
			hotel_boardMapper.hotel_board_re_UP(dto.getRe_step(), dto.getRe_group());
			dto.setRe_step(dto.getRe_step() + 1);
			dto.setRe_level(dto.getRe_level() + 1);
		}

		dto.setTitle("1");
		dto.setFilename("1");
		dto.setFilesize(0);
		
		int res = hotel_boardMapper.insertHotel_board(dto);
		String msg = null, url = null;
		if(res>0) {
			msg = "댓글달기 성공";
			url = "hotel_content.do?hotel_board_no="+dto.getHotel_board_no()+
					"&hotel_no="+dto.getHotel_no()+"&page_name=Hotel Board";
		}else {
			msg = "댓글달기 실패";
			url = "hotel_content.do?hotel_board_no="+dto.getHotel_board_no()+
					"&hotel_no="+dto.getHotel_no()+"&page_name=Hotel Board";
		}
		
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	@RequestMapping(value="/hotel_content.do")
	public ModelAndView getBoard(@RequestParam int hotel_board_no ,HttpServletRequest req,HttpSession session) {
		hotel_boardMapper.read_count(hotel_board_no);
		hotel_boardDTO dto = hotel_boardMapper.getHotel_board(String.valueOf(hotel_board_no));
		hotel_boardDTO dto2 = hotel_boardMapper.getHotel_board(String.valueOf(hotel_board_no));
		MemberDTO_sm mdto2=memberMapper.getMember2(String.valueOf(dto.getMember_no()));
		dto.setMember_no(mdto2.getName()); 
		int member_no=-1;
		if(session.getAttribute("MNUM")!=null){
			member_no=(Integer)session.getAttribute("MNUM");
		}
		
		int pageSize=5;
		String pageNum=req.getParameter("pageNum");
		if(pageNum==null){
			pageNum="1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = currentPage * pageSize - (pageSize-1);
		int endRow = currentPage * pageSize;
		int count = 0;
		count=hotel_boardMapper.hotel_board_count2(dto.getRe_group());
		if(endRow>count){
			endRow=count;
		}
		List<hotel_boardDTO> list = hotel_boardMapper.listHotel_board2(startRow, endRow, dto.getRe_group());
		List<hotel_boardDTO> list2 = hotel_boardMapper.listHotel_board2(startRow, endRow, dto.getRe_group());
		for(hotel_boardDTO dto3 :list) {
			MemberDTO_sm mdto=memberMapper.getMember2(String.valueOf(dto3.getMember_no()));
			dto3.setMember_no(mdto.getName()); 
		}
		hotelDTO gethotel=hotelMapper.getHotel(String.valueOf(dto.getHotel_no()));
		int hotel_member_no=gethotel.getMember_num();
		int startNum = count-((currentPage-1)*pageSize);
		int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
		int pageBlock = 5;
		int startPage = (currentPage-1)/pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1; 
		if (endPage>pageCount) endPage = pageCount;
		ModelAndView mav = new ModelAndView();
		List<upDTO> ulist=upMapper.up_list(member_no,hotel_board_no);
		List<downDTO> dlist=downMapper.down_list(member_no,hotel_board_no);
		List<upDTO> ulist2=upMapper.up_list2(member_no,hotel_board_no);
		List<downDTO> dlist2=downMapper.down_list2(member_no,hotel_board_no);
		boolean up=false;
		boolean down=false;
		if(ulist.size()==0){
			up=true;
		}
		if(dlist.size()==0){
			down=true;
		}
		mav.setViewName("hotel_board/content");
		mav.addObject("ulist",ulist2);
		mav.addObject("dlist",dlist2);
		mav.addObject("up",up);
		mav.addObject("down",down);
		mav.addObject("listBoard", list);
		mav.addObject("listBoard2", list2);
		mav.addObject("count",count);
		mav.addObject("startNum",startNum);
		mav.addObject("pageCount",pageCount);
		mav.addObject("pageBlock",pageBlock);
		mav.addObject("startPage",startPage);
		mav.addObject("endPage",endPage);
		mav.addObject("getBoard",dto);
		mav.addObject("getBoard2",dto2);
		mav.addObject("member",hotel_member_no);
		mav.addObject("gethotel",gethotel);
		
		
		return mav;
	}
	
	
	
	
	
	//======================================================================================
	
	@RequestMapping("/hotel_list.do")
	public ModelAndView hotel_list1(HttpServletRequest req,HttpSession session) {
		List<hotelDTO> list = hotelMapper.listHotel();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("hotel_board/hotel_list");
		mav.addObject("list", list);
		return mav;
	}
	
	
	
	
	@RequestMapping("/ADhotelAD.do")
	public String busAD() {
		return "ADhotel_list.do";
	}

	@RequestMapping("/ADhotel_list.do")
	public ModelAndView hotel_list(HttpServletRequest req,HttpSession session) {
		Integer MNUM=(Integer)session.getAttribute("MNUM");
		List<hotelDTO> list = hotelMapper.listHotel(String.valueOf(MNUM));
		ModelAndView mav = new ModelAndView();
		req.setAttribute("page_name", "Hotel List");
		mav.setViewName("hotelAD/hotel/hotel_list");
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("/ADhotel_show.do")
	public ModelAndView hotel_show(HttpServletRequest req,HttpSession session) {
		String hnum=req.getParameter("hnum"); 
		hotelDTO dto=hotelMapper.getHotel(req.getParameter("hnum"));
		ModelAndView mav = new ModelAndView();
		mav.setViewName("hotelAD/hotel/hotel_show");
		mav.addObject("dto", dto);
		return mav;
	}
	@RequestMapping("/hotel_show.do")
	public ModelAndView hotel_show2(HttpServletRequest req,HttpSession session) {
		String hnum=req.getParameter("hnum"); 
		hotelDTO dto=hotelMapper.getHotel(req.getParameter("hnum"));
		ModelAndView mav = new ModelAndView();
		mav.setViewName("hotelAD/hotel/hotel_show2");
		mav.addObject("dto", dto);
		return mav;
	}


	@RequestMapping(value = "/ADhotel_insert.do", method = RequestMethod.GET)
	public String hotel_insert(HttpServletRequest req) {
		req.setAttribute("page_name", "Hotel Insert");
		return "hotelAD/hotel/hotel_insert";
	}

	@RequestMapping(value = "/ADhotel_insert.do", method = RequestMethod.POST)//호텔
	public String hotel_insertOK(MultipartHttpServletRequest mtfRequest, HttpServletRequest req, @ModelAttribute hotelDTO dto, BindingResult result, HttpSession session) {
		Integer MNUM=(Integer)session.getAttribute("MNUM");
		dto.setMember_num(MNUM);
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		
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

		int res = hotelMapper.insertHotel(dto);
		String msg = null, url = null;
		if (res > 0) {
			msg = "호텔추가 성공";
			url = "ADhotel_list.do" + "?member_num=" + memNUM;
		} else {
			msg = "호텔추가 실패";
			url = "ADhotel_list.do" + "?member_num=" + memNUM;
		}
		req.setAttribute("page_name", "Hotel List");
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}

	@RequestMapping("ADhotel_delete.do")
	public String bus_delete(HttpServletRequest req) {
		int res = hotelMapper.deletetHotel(req.getParameter("hnum"));
		String msg = null, url = null;
		if (res > 0) {
			msg = "호텔삭제 성공";
			url = "ADhotel_list.do" + "?member_num=" + memNUM;
		} else {
			msg = "호텔삭제 실패";
			url = "ADhotel_list.do" + "?member_num=" + memNUM;
		}
		req.setAttribute("page_name", "Hotel List");
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}

	@RequestMapping(value = "/ADhotel_update.do", method = RequestMethod.GET)
	public ModelAndView bus_update(HttpServletRequest req) {
		hotelDTO dto = hotelMapper.getHotel(req.getParameter("hnum"));
		ModelAndView mav = new ModelAndView("hotelAD/hotel/hotel_update", "dto", dto);
		return mav;
	}

	@RequestMapping(value = "/ADhotel_update.do", method = RequestMethod.POST)
	public String bus_updateOK(MultipartHttpServletRequest mtfRequest,HttpServletRequest req, @ModelAttribute hotelDTO dto, BindingResult result) {
		String filename = "";
		int filesize = 0;
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		
		
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
		req.setAttribute("page_name", "Hotel List");
		int res = hotelMapper.updateHotel(dto);
		return "redirect:ADhotel_list.do" + "?member_num=" + memNUM;
	}

	// --------------------------------------------------------------------------
	// -----------------------방관련----------------------------------------
	// --------------------------------------------------------------------------

	private String hnum;

	@RequestMapping("/ADroom_list.do")
	public ModelAndView room_list(HttpServletRequest req, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (req.getParameter("hnum") != null) {
			hnum = req.getParameter("hnum");
			session.setAttribute("hnum", req.getParameter("hnum"));
		}
		hnum = (String) session.getAttribute("hnum");
		List<roomDTO> list = roomMapper.listRoom(Integer.parseInt(hnum));
		req.setAttribute("page_name", "Room List");
		mav.setViewName("hotelAD/room/room_list");
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping(value = "/ADroom_insert.do", method = RequestMethod.GET)
	public String room_insert(HttpServletRequest req) {
		req.setAttribute("page_name", "Room Insert");
		return "hotelAD/room/room_insert";
	}

	@RequestMapping(value = "/ADroom_insert.do", method = RequestMethod.POST)//룸
	public String room_insertOK(MultipartHttpServletRequest mtfRequest, HttpSession session, @ModelAttribute roomDTO dto,HttpServletRequest req) {
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		String hnum = (String) session.getAttribute("hnum");
		dto.setHotel_no(Integer.parseInt(hnum));
		roomMapper.seqUP();
		String seq = String.valueOf(roomMapper.seqGET());

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
			dto.setHotel_no(Integer.parseInt(hnum));
			System.out.println(dto.getGrade());
			int res = roomMapper.insertRoom(dto);
		}
		
		return "redirect:ADroom_list.do?hnum=" + hnum;
	}

	@RequestMapping("ADroom_delete.do")
	public String room_delete(HttpServletRequest req) {
		int res = roomMapper.deletetRoom(req.getParameter("no"));
		String msg = null, url = null;
		if (res > 0) {
			msg = "호텔삭제 성공";
			url = "ADroom_list.do";
		} else {
			msg = "호텔삭제 실패";
			url = "ADroom_list.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		req.setAttribute("page_name", "Room List");
		return "message";
	}

	@RequestMapping("ADroom_alldelete.do")
	public String room_alldelete(HttpServletRequest req) {
		int res = roomMapper.deletetallRoom(req.getParameter("no")+"%");
		String msg = null, url = null;
		if (res > 0) {
			msg = "호텔삭제 성공";
			url = "ADroom_list.do";
		} else {
			msg = "호텔삭제 실패";
			url = "ADroom_list.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		req.setAttribute("page_name", "Room List");
		return "message";
	}

	@RequestMapping(value = "/ADroom_update.do", method = RequestMethod.GET)
	public ModelAndView room_update(HttpServletRequest req) {
		roomDTO dto = roomMapper.getRoom(req.getParameter("no"));
		ModelAndView mav = new ModelAndView("hotelAD/room/room_update", "dto", dto);
		req.setAttribute("page_name", "Room Update");
		return mav;
	}

	@RequestMapping(value = "/ADroom_update.do", method = RequestMethod.POST)
	public String room_updateOK(MultipartHttpServletRequest mtfRequest, HttpSession session, HttpServletRequest req,
			@ModelAttribute roomDTO dto) {
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		String hnum = (String) session.getAttribute("hnum");
		roomMapper.seqUP();
		String seq = String.valueOf(roomMapper.seqGET());

		String filename = "";
		int filesize = 0;
		for (MultipartFile mf : fileList) {
			String tempname = mf.getOriginalFilename();
			long tempsize = mf.getSize();
			try {
				mf.transferTo(new File(upLoadPath, mf.getOriginalFilename()));
				filename += tempname + "/";
				filesize += tempsize;
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		dto.setFilename(filename);
		dto.setFilesize(filesize);
		int res = roomMapper.updateRoom(dto);
		req.setAttribute("page_name", "Room List");

		return "redirect:ADroom_list.do";
	}
	
	@RequestMapping(value = "/ADroom_show.do", method = RequestMethod.GET)
	public ModelAndView room_show(HttpServletRequest req) {
		roomDTO dto = roomMapper.getRoom(req.getParameter("no"));
		ModelAndView mav = new ModelAndView("hotelAD/room/room_show", "dto", dto);
		req.setAttribute("page_name", "Room Show");
		return mav;
	}

	// --------------------------------------------------------------------------
	// -----------------------예약--------------------------------
	// --------------------------------------------------------------------------

	@RequestMapping("/ADresv_list.do")
	public ModelAndView resv_list(HttpServletRequest req) {
		int day=0;
		ModelAndView mav = new ModelAndView();
		if (req.getParameter("hnum") != null) {
			hnum = req.getParameter("hnum");
		}

		List<resvDTO> resvlist = resvMapper.listResv(Integer.parseInt(hnum));
		List<roomDTO> roomlist = roomMapper.listRoom(Integer.parseInt(hnum));
		List<resvDTO> list = new ArrayList<resvDTO>();
		for (resvDTO dto : resvlist) {
			String[] startArr = dto.getStart_resv_date().split("-");
			String start = "";
			for(String i : startArr) start+=i;
			int startInt = Integer.parseInt(start);
			String[] endArr = dto.getEnd_resv_date().split("-");
			String end = "";
			for(String i : endArr) end+=i;
			int endInt = Integer.parseInt(end);
			day=endInt-startInt;
			String no[]=dto.getRoom_no().split("/");
			for (int i = 0; i < day; i++) {
				for(int l=0;l<no.length;l++){
					resvDTO Tdto = new resvDTO();
					Tdto.setMember_no(dto.getMember_no());
					Tdto.setEnd_resv_date(dto.getEnd_resv_date());
					Tdto.setHotel_no(dto.getHotel_no());
					Tdto.setHotel_resv_no(dto.getHotel_resv_no());
					Tdto.setMember_no(dto.getMember_no());
					Tdto.setRoom_no(no[l]);
					Tdto.setSave_point(dto.getSave_point());
					Tdto.setUse_point(dto.getUse_point());
	
					Tdto.setStart_resv_date(resv_petch(startInt, i));
					list.add(Tdto);
				}
			}
		}

		for (resvDTO dto : list) {
			resvlist.add(dto);
		}

		mav.setViewName("hotelAD/hotel_resv/resv_list");

		if (roomlist != null) {
			mav.addObject("resvlist", resvlist);
			mav.addObject("roomlist", roomlist);
			mav.addObject("hnum", hnum);
			mav.addObject("day", day);
		}
		return mav;
	}

	public String resv_petch(int resv, int i) {
		Calendar cal = Calendar.getInstance();
		String re;
		int month = resv % 10000;
		int year = cal.get(Calendar.YEAR);
		month /= 100;
		cal.set(year, month - 1, 1);
		int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);

		int sum = resv + i;
		sum %= 100;
		if (sum > endDay) {
			re = "2020";
			int re1 = month + 1;
			if (re1 > 9)
				re += "1";
			else
				re += "0";
			sum -= endDay;
			sum += re1 * 100;
			re += sum;
		} else {
			int temp = resv + i;
			re = String.valueOf(temp);
		}
		StringBuffer origin = new StringBuffer(re);
		origin.insert(6, "-");
		origin.insert(4, "-");
		re=origin.toString();
		return re;
	}

	@RequestMapping("/ADresv_show.do")
	public ModelAndView resv_show(HttpServletRequest req) {

		ModelAndView mav = new ModelAndView();
		resvDTO dto = resvMapper.getResv(req.getParameter("hotel_resv_no"));
		int HNO = dto.getHotel_no();
		int MNO = dto.getMember_no();
		String RNO = dto.getRoom_no();

		MemberDTO_sm MDTO = memberMapper.getMember2(String.valueOf(MNO));
		hotelDTO HDTO = hotelMapper.getHotel(String.valueOf(HNO));
		roomDTO RDTO = roomMapper.getRoom(RNO);

		mav.setViewName("hotelAD/hotel_resv/resv_show");
		mav.addObject("dto", dto);
		mav.addObject("MDTO", MDTO);
		mav.addObject("HDTO", HDTO);
		mav.addObject("RDTO", RDTO);
		req.setAttribute("page_name", "Hotel Resv Show");
		return mav;
	}
}
