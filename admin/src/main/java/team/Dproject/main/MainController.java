package team.Dproject.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import team.Dproject.main.model.BoardDTO;
import team.Dproject.main.model.MemberDTO;
import team.Dproject.main.service.BoardMapper;

@Controller
public class MainController {
	
	@Autowired
	private BoardMapper boardMapper;
	
	@RequestMapping(value = "/")
	public String home(HttpSession session) {
		session.setAttribute("member_no", 1);
		return "index";
	}
	
	@RequestMapping(value = "/index")
	public String home2() {
		return "index";
	}
	
	@RequestMapping(value="/hotel")
	public String hotel() {
		return "hotel";
	}
	
	@RequestMapping(value="/board_list.do")
	public String listBoard(HttpServletRequest req) {
		List<BoardDTO> list = boardMapper.board_list();
		for(BoardDTO dto :list) {
			MemberDTO mdto=boardMapper.getUser(Integer.parseInt(dto.getMember_no()));
			dto.setMember_no(mdto.getId());
		}
		req.setAttribute("listBoard", list);
		return "Forum/list";

	}
	
	@RequestMapping(value="/board_write.do", method=RequestMethod.GET)
	public String writeForm() {
		return "Forum/writeForm";
	}
	
	@RequestMapping(value="/board_write.do", method=RequestMethod.POST)
	public String insertBoard(HttpServletRequest req, BoardDTO dto,HttpSession session) {
		dto.setIp(req.getRemoteAddr());
		int member_no=(Integer)session.getAttribute("member_no");
		dto.setMember_no(String.valueOf(member_no));
		int res = boardMapper.board_insert(dto);
		String msg = null, url = null;
		if(res>0) {
			msg = "새 글 작성이 완료되었습니다. 게시글 목록으로 이동합니다.";
			url = "board_list.do";
		}else {
			msg = "새 글 작성이 완료되지 않았습니다. 다시 작성해주세요.";
			url = "board_list.do";
		}
		
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	@RequestMapping(value="/board_content.do")
	public ModelAndView getBoard(@RequestParam int main_board_no) {
		BoardDTO dto = boardMapper.getBoard(main_board_no);
		ModelAndView mav = new ModelAndView("Forum/content", "getBoard", dto);
		return mav;
	}
	
	
	@RequestMapping(value="/search.do")
	public String search() {
		return "search";
	}
	
}
