package team.Dproject.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.mapper.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import team.Dproject.main.model.BoardDTO;
import team.Dproject.main.model.CommentDTO;
import team.Dproject.main.model.MemberDTO;
import team.Dproject.main.service.BoardMapper;
import team.Dproject.main.service.CommentMapper;
import team.Dproject.main.service.MemberMapper;

@Controller
public class CommentController {
	
	@Autowired
	private CommentMapper commentMapper;
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@RequestMapping(value = "/comment_list.do")
	public ModelAndView commentList(HttpServletRequest req) {
		BoardDTO dto = boardMapper.getBoard(Integer.parseInt(req.getParameter("main_board_no")));
		MemberDTO mdto = memberMapper.getMember2(dto.getMember_no());
		dto.setMember_no(mdto.getId());
		ModelAndView mav = new ModelAndView("Forum/content", "getBoard", dto);
		List<CommentDTO> list = commentMapper.commentList(Integer.parseInt(req.getParameter("main_board_no")));
		List<CommentDTO> list2 = commentMapper.commentList(Integer.parseInt(req.getParameter("main_board_no")));
		for(CommentDTO a : list) {
			MemberDTO mdto2 = memberMapper.getMember2(a.getWriter());
			a.setWriter(mdto2.getId());
		}
		req.setAttribute("commentList", list);
		req.setAttribute("commentList2", list2);
		
		return mav;
	}
	
	@RequestMapping(value="/comment_write.do", method=RequestMethod.POST)
	public String commentInsert(HttpServletRequest req, CommentDTO dto) {
		int res = commentMapper.commentInsert(dto);
		String msg = null, url = null;
		if(res>0) {
			msg = "댓글 작성 완료!";
			url = "comment_list.do?main_board_no="+dto.getBno();
		}else {
			msg = "댓글 작성 오류!";
			url = "comment_list.do?main_board_no="+dto.getBno();
		}

		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	@RequestMapping(value="/comment_delete.do")
	public ModelAndView commentDelete(@RequestParam int cno,HttpServletRequest req) {
		int res = commentMapper.commentDelete(cno);
		String msg = null, url = null;
		if(res>0) {
			msg = "댓글 삭제 완료!";
			url = "comment_list.do?main_board_no="+req.getParameter("bno");
		}else {
			msg = "댓글 작성 오류!";
			url = "comment_list.do?main_board_no="+req.getParameter("bno");
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url",url);
		mav.setViewName("message");
		return mav;
	}
	
//	@RequestMapping(value="/comment_update.do")
//	public ModelAndView commentUpdate(CommentDTO dto, HttpServletRequest req) {
//		int res = commentMapper.commentInsert(dto);
//		String msg = null, url = null;
//		if(res>0) {
//			msg = "댓글 삭제 완료!";
//			url = "comment_list.do?main_board_no="+req.getParameter("bno");
//		}else {
//			msg = "댓글 작성 오류!";
//			url = "comment_list.do?main_board_no="+req.getParameter("bno");
//		}
//		
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("msg", msg);
//		mav.addObject("url",url);
//		mav.setViewName("message");
//		return mav;
//		
//	}

}
















