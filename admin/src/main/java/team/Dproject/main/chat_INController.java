package team.Dproject.main;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Controller
public class chat_INController {
	private static final Logger logger = LoggerFactory.getLogger(chat_INController.class);
	@Resource(name = "upLoadPath")
	private String upLoadPath;
	@RequestMapping(value = "/loginProcess.do", method = RequestMethod.GET)
	public String loginProcess( HttpServletRequest request , HttpSession session) {
		int memberNO=(Integer)session.getAttribute("MNUM");
		session.setAttribute("post", request.getParameter("post"));
		logger.info("Welcome " + memberNO);
		
		session.setAttribute("id", memberNO);
		return "chat";
	}
	
	@RequestMapping(value = "/chatfile.do", method = RequestMethod.GET)
	public String chatfile() {
		
		return "chatfile";
	}
	@RequestMapping(value = "/fileup.do", method = RequestMethod.POST)
	public String chatfile2( HttpServletRequest req) {
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
		req.setAttribute("filename", filename);
		return "tempfile";
	}
}
