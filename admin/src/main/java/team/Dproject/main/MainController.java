package team.Dproject.main;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import team.Dproject.main.model.BoardDTO;
import team.Dproject.main.model.CommentDTO;
import team.Dproject.main.model.MemberDTO;
import team.Dproject.main.service.BoardMapper;
import team.Dproject.main.service.CommentMapper;
import team.Dproject.main.service.MemberMapper;

@Controller
public class MainController {
	
	@Autowired
	private CommentMapper commentMapper;

	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private MemberMapper memberMapper;
	
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
	
	@Resource(name="upLoadPath")
	private String upLoadPath;
	
	
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
	public String insertBoard(MultipartHttpServletRequest mtfRequest,HttpServletRequest req, BoardDTO dto,HttpSession session) {
		//다중파일 업로드니까 list 배열에 저장 
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		//IP주소 가져오기 
		dto.setIp(req.getRemoteAddr());
		//MemberController에서 dto.getMember_no 를 MNUM에 저장했기 때문.
		int member_no=(Integer)session.getAttribute("MNUM");
		dto.setMember_no(String.valueOf(member_no));
		
//		System.out.print(req.getParameter("filename"));
		String filename = "";
	      int filesize = 0;    
	      for (MultipartFile mf : fileList) {
	         String tempname = mf.getOriginalFilename();
	         long tempsize = mf.getSize();    
	         try {
	        	 //upLoadPath 에 설정해놓은 경로로 파일 업로드 
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
	    
	    //boardMapper.xml 에 있는 board_insert 쿼리 이용해서 DB에 데이터 저장 
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
	public ModelAndView getBoard(@RequestParam int main_board_no,HttpServletRequest req) {
		BoardDTO dto = boardMapper.getBoard(main_board_no);
		boardMapper.getCount(main_board_no);
		MemberDTO mdto = memberMapper.getMember2(dto.getMember_no());
		dto.setMember_no(mdto.getId());
		ModelAndView mav = new ModelAndView("Forum/content", "getBoard", dto);
		List<CommentDTO> list = commentMapper.commentList(dto.getMain_board_no());
		req.setAttribute("commentList", list);
		return mav;
	}
	
	
	@RequestMapping(value="/search.do")
	public String search() {
		return "search";
	}
	
}
