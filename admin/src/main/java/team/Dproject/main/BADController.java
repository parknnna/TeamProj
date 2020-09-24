package team.Dproject.main;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import team.Dproject.main.model.BusDTO;
import team.Dproject.main.model.bus_loadDTO;
import team.Dproject.main.model.bus_resvDTO;
import team.Dproject.main.model.bus_stationDTO;
import team.Dproject.main.model.MemberDTO;
import team.Dproject.main.service.BusMapper;
import team.Dproject.main.service.Bus_loadMapper;
import team.Dproject.main.service.Bus_resvMapper;
import team.Dproject.main.service.Bus_stationMapper;
import team.Dproject.main.service.MemberMapper;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BADController {
	
	private static final Logger logger = LoggerFactory.getLogger(BADController.class);
	@Autowired
	private BusMapper busMapper;
	@Autowired
	private Bus_stationMapper bus_stationMapper;
	@Autowired
	private Bus_loadMapper bus_loadMapper;
	@Autowired
	private Bus_resvMapper bus_resvMapper;
	@Autowired
	private MemberMapper memberMapper;
	
	@Resource(name = "upLoadPath")
	private String upLoadPath;
	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Locale locale, Model model, HttpSession session) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		return "home";
//	}
	

	
	//버스관련---------------------------------------------------------------

	
	//버스---------------------------------------------------------------
	@RequestMapping(value="/ADbus_list.do" )
	public ModelAndView bus_list(HttpServletRequest req) {
		List<BusDTO> list = busMapper.listBus();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("busAD/bus/bus_list");
		mav.addObject("bus_list", list);
		req.setAttribute("page_name", "Bus List");
		return mav;
	}
	@RequestMapping(value="/ADbus_insert.do",method = RequestMethod.GET)
	public String bus_insert(HttpServletRequest req) {
		return "busAD/bus/bus_insert";
	}
	@RequestMapping(value="/ADbus_insert.do",method = RequestMethod.POST)
	public String bus_insertOK(HttpServletRequest req, BusDTO dto)  {
		int res=busMapper.insertBus(dto);
		String msg = null, url = null;
		if (res > 0) {
			msg = "버스등록 성공";
			url = "ADbus_list.do";
		} else {
			msg = "버스등록 실패";
			url = "ADbus_list.do";
		}
		req.setAttribute("page_name", "Bus List");
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	@RequestMapping("ADbus_delete.do")
	public String bus_delete(HttpServletRequest req) {
		int res=busMapper.deletetBus(Integer.parseInt(req.getParameter("no")));
		String msg = null, url = null;
		if (res > 0) {
			msg = "버스삭제 성공";
			url = "ADbus_list.do";
		} else {
			msg = "버스삭제 실패";
			url = "ADbus_list.do";
		}
		req.setAttribute("page_name", "Bus List");
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	@RequestMapping(value="/ADbus_update.do",method = RequestMethod.GET)
	public ModelAndView bus_update(HttpServletRequest req) {
		BusDTO dto = busMapper.getBus(Integer.parseInt(req.getParameter("no")));
		ModelAndView mav = new ModelAndView("busAD/bus/bus_update", "bus", dto);
		req.setAttribute("page_name", "Bus Update");
		return mav;
	}
	@RequestMapping(value="/ADbus_update.do",method = RequestMethod.POST)
	public String bus_updateOK(HttpServletRequest req, BusDTO dto)  {
		int res=busMapper.updateBus(dto); 
		String msg = null, url = null;
		if (res > 0) {
			msg = "버스수정 성공";
			url = "ADbus_list.do";
		} else {
			msg = "버스수정 실패";
			url = "ADbus_list.do";
		}
		req.setAttribute("page_name", "Bus List");
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	
	//터미널---------------------------------------------------------------
	@RequestMapping("/ADbus_station_list.do")
	public ModelAndView bus_station_list(HttpServletRequest req) {
		List<bus_stationDTO> list = bus_stationMapper.listBus_station();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("busAD/bus_station/bus_station_list");
		mav.addObject("bus_station_list", list); 
		req.setAttribute("page_name", "Bus Station List");
		return mav; 
	}
	@RequestMapping(value="/ADbus_station_insert.do",method = RequestMethod.GET)
	public String bus_station_insert(HttpServletRequest req) {
		req.setAttribute("page_name", "Bus Station Insert");
		return "busAD/bus_station/bus_station_insert";
	}
	
	
	@RequestMapping(value="/ADbus_station_insert.do",method = RequestMethod.POST)
	public String hotel_insertOK(HttpServletRequest req, @ModelAttribute bus_stationDTO dto, BindingResult result, HttpSession session) {
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

		int res = bus_stationMapper.insertBus_station(dto);
		String msg = null, url = null;
		if (res > 0) {
			msg = "터미널추가 성공";
			url = "ADbus_station_list.do";
		} else {
			msg = "터미널추가 실패";
			url = "ADbus_station_list.do";
		}
		req.setAttribute("page_name", "Bus Station List");
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	
	@RequestMapping("ADbus_station_delete.do")
	public String bus_station_delete(HttpServletRequest req) {
		int res=bus_stationMapper.deletetBus_station(req.getParameter("no"));
		String msg = null, url = null;
		if (res > 0) {
			msg = "터미널삭제 성공";
			url = "ADbus_station_list.do";
		} else {
			msg = "터미널삭제 실패";
			url = "ADbus_station_list.do";
		}
		req.setAttribute("page_name", "Bus Station List");
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	@RequestMapping(value="/ADbus_station_update.do",method = RequestMethod.GET)
	public ModelAndView bus_station_update(HttpServletRequest req) {
		bus_stationDTO dto = bus_stationMapper.getBus_station(req.getParameter("no"));
		ModelAndView mav = new ModelAndView("busAD/bus_station/bus_station_update", "station", dto);
		return mav;
	}
	@RequestMapping(value="/ADbus_station_update.do",method = RequestMethod.POST)
	public String bus_station_updateOK(HttpServletRequest req, bus_stationDTO dto)  {
		String filename = "";
		int filesize = 0;
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		MultipartFile file = mr.getFile("file");
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
		int res=bus_stationMapper.updateBus_station(dto); 
		String msg = null, url = null;
		if (res > 0) {
			msg = "터미널수정 성공";
			url = "ADbus_station_list.do";
		} else {
			msg = "터미널수정 실패";
			url = "ADbus_station_list.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	
	//노선---------------------------------------------------------------
	@RequestMapping(value="/ADbus_load_list.do" )
	public ModelAndView bus_load_list(HttpServletRequest req) {
		List<bus_loadDTO> list = bus_loadMapper.listBus_load();
		for(bus_loadDTO LDTO : list){
			LDTO.setArrival(bus_stationMapper.getBus_station(LDTO.getArrival()).getStation_name());
			LDTO.setDeparture(bus_stationMapper.getBus_station(LDTO.getDeparture()).getStation_name());
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("busAD/bus_load/bus_load_list");
		mav.addObject("bus_load_list", list);
		return mav;
	}
	@RequestMapping(value="/ADbus_load_insert.do",method = RequestMethod.GET)
	public ModelAndView bus_load_insert(HttpServletRequest req) {
		List<bus_loadDTO> llist = bus_loadMapper.listBus_load();
		List<BusDTO> list = busMapper.listBus();
		List<bus_stationDTO> list2 = bus_stationMapper.listBus_station();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("busAD/bus_load/bus_load_insert");
		mav.addObject("bus_list", list);
		mav.addObject("bus_station_list", list2);
		mav.addObject("llist", llist);
		List<bus_loadDTO> list3 = bus_loadMapper.listBus_load();
		mav.addObject("bus_lord_list", list3);
		return mav;
	}
	@RequestMapping(value="/ADbus_load_insert.do",method = RequestMethod.POST)
	public String bus_load_insertOK(HttpServletRequest req, bus_loadDTO dto,HttpSession session)  {
		int MNUM=(int)session.getAttribute("MNUM");
		dto.setMember_no(MNUM);
		int res=bus_loadMapper.insertBus_load(dto);
		String msg = null, url = null;
		if (res > 0) {
			msg = "노선등록 성공";
			url = "ADbus_load_list.do";
		} else {
			msg = "노선등록 실패";
			url = "ADbus_load_list.do";
		}
		req.setAttribute("page_name", "Bus Road List");

		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	@RequestMapping("ADbus_load_delete.do")
	public String bus_load_delete(HttpServletRequest req) {
		int res=bus_loadMapper.deletetBus_load(req.getParameter("no"));
		String msg = null, url = null;
		if (res > 0) {
			msg = "노선삭제 성공";
			url = "ADbus_load_list.do";
		} else {
			msg = "노선삭제 실패";
			url = "ADbus_load_list.do";
		}req.setAttribute("page_name", "Bus Road List");

		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	@RequestMapping(value="/ADbus_load_update.do",method = RequestMethod.GET)
	public ModelAndView bus_load_update(HttpServletRequest req) {
		List<bus_loadDTO> list3 = bus_loadMapper.listBus_load();
		bus_loadDTO dto = bus_loadMapper.getBus_load(req.getParameter("no"));
		ModelAndView mav = new ModelAndView("busAD/bus_load/bus_load_update", "bus", dto);
		List<BusDTO> list = busMapper.listBus();
		List<bus_stationDTO> list2 = bus_stationMapper.listBus_station();
		mav.addObject("bus_list", list);
		mav.addObject("bus_station_list", list2);
		mav.addObject("bus_lord_list", list3);
		mav.addObject("LDTO", dto);
		return mav;
	}
	@RequestMapping(value="/ADbus_load_update.do",method = RequestMethod.POST)
	public String bus_load_updateOK(HttpServletRequest req, bus_loadDTO dto,HttpSession session)  {
		int MNUM=(int)session.getAttribute("MNUM");
		dto.setMember_no(MNUM);
		int res=bus_loadMapper.updateBus_load(dto); 
		String msg = null, url = null;
		if (res > 0) {
			msg = "노선수정 성공";
			url = "ADbus_load_list.do";
		} else {
			msg = "노선수정 실패";
			url = "ADbus_load_list.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		req.setAttribute("page_name", "Bus Road List");
		return "message";
	}
		
		
	
	//예약---------------------------------------------------------------
	@RequestMapping(value="/ADbus_resv_list.do" )
	public ModelAndView bus_resv_list(HttpServletRequest req) {
		List<bus_resvDTO> list = bus_resvMapper.listBus_resv();
		List<bus_loadDTO> llist = new ArrayList();
		for(bus_resvDTO dto : list){
			bus_loadDTO LDTO=bus_loadMapper.getBus_load(String.valueOf(dto.getRoad_no()));
			LDTO.setArrival(bus_stationMapper.getBus_station(LDTO.getArrival()).getStation_name());
			LDTO.setDeparture(bus_stationMapper.getBus_station(LDTO.getDeparture()).getStation_name());
			llist.add(LDTO);
			
			bus_loadDTO price=bus_loadMapper.getBus_load(String.valueOf(dto.getRoad_no()));
			dto.setPrice(price.getPrice());
		}
		req.setAttribute("page_name", "Bus Resv List");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("busAD/bus_resv/bus_resv_list");
		mav.addObject("list", list);
		mav.addObject("llist",llist);
		return mav;
	}
	@RequestMapping(value="/ADbus_resv_insert.do",method = RequestMethod.GET)
	public ModelAndView bus_resv_insert(HttpServletRequest req) {
		bus_loadDTO dto=bus_loadMapper.getBus_load(req.getParameter("no"));
		List<MemberDTO> mlist=memberMapper.memberList();
		
		String a=dto.getArrival();
		String b=dto.getDeparture();
		bus_stationDTO c=bus_stationMapper.getBus_station(a);
		String temp=c.getStation_name();
		dto.setArrival(temp);
		c=bus_stationMapper.getBus_station(b);
		temp=c.getStation_name(); 
		dto.setDeparture(temp);
		req.setAttribute("page_name", "Bus Resv Insert");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("busAD/bus_resv/bus_resv_insert");
		mav.addObject("dto", dto);
		mav.addObject("mlist", mlist);
		return mav;
	}
	@RequestMapping(value="/ADbus_resv_insert.do",method = RequestMethod.POST)
	public String bus_resv_insertOK(HttpServletRequest req, bus_resvDTO dto, HttpSession session)  {
		int res=bus_resvMapper.insertBus_resv(dto);
		String msg = null, url = null;
		if (res > 0) {
			msg = "예약등록 성공";
			url = "ADbus_resv_list.do";
		} else {
			msg = "예약등록 실패";
			url = "ADbus_resv_list.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		req.setAttribute("page_name", "Bus Resv List");
		return "message";
	}
	@RequestMapping("ADbus_resv_delete.do")
	public String bus_resv_delete(HttpServletRequest req) {
		int res=bus_resvMapper.deletetBus_resv(req.getParameter("no"));
		String msg = null, url = null;
		if (res > 0) {
			msg = "예약삭제 성공";
			url = "ADbus_resv_list.do";
		} else {
			msg = "예약삭제 실패";
			url = "ADbus_resv_list.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		req.setAttribute("page_name", "Bus Resv List");
		return "message";
	}
	@RequestMapping(value="/ADbus_resv_update.do",method = RequestMethod.GET)
	public ModelAndView bus_resv_update(HttpServletRequest req) {
		bus_resvDTO dto = bus_resvMapper.getBus_resv(req.getParameter("no"));
		List<MemberDTO> mlist=memberMapper.memberList();
		List<bus_loadDTO> llist = bus_loadMapper.listBus_load();
		for(bus_loadDTO LDTO : llist){
			LDTO.setArrival(bus_stationMapper.getBus_station(String.valueOf(LDTO.getArrival())).getStation_name());
			LDTO.setDeparture(bus_stationMapper.getBus_station(String.valueOf(LDTO.getDeparture())).getStation_name());
		}
		ModelAndView mav = new ModelAndView("busAD/bus_resv/bus_resv_update", "rdto", dto);
		mav.addObject("mlist", mlist);
		mav.addObject("llist", llist);
		req.setAttribute("page_name", "Bus Resv Update");
		return mav;
	}
	@RequestMapping(value="/ADbus_resv_update.do",method = RequestMethod.POST)
	public String bus_resv_updateOK(HttpServletRequest req, bus_resvDTO dto)  {
		int res=bus_resvMapper.updateBus_resv(dto); 
		String msg = null, url = null;
		if (res > 0) {
			msg = "예약수정 성공";
			url = "ADbus_resv_list.do";
		} else {
			msg = "예약수정 실패";
			url = "ADbus_resv_list.do";
		}
		req.setAttribute("page_name", "Bus Resv List");
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	
}
