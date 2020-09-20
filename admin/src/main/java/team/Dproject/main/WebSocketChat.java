package team.Dproject.main;
 
import java.util.ArrayList;
import java.util.List; 
import javax.websocket.OnClose;
import javax.websocket.OnError; 
import javax.websocket.OnMessage; 
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session; 
import javax.websocket.server.ServerEndpoint;
import org.slf4j.Logger; 
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller; 


@Controller @ServerEndpoint(value="/echo.do") 
public class WebSocketChat { 
	private static final List<Session> sessionList=new ArrayList<Session>();;
	private static final Logger logger = LoggerFactory.getLogger(WebSocketChat.class); 
	
	public WebSocketChat() { 
		 System.out.println("웹소켓(서버) 객체생성");
	} 
	
	@OnOpen 
	public void onOpen(Session session) {
		logger.info("Open session id:"+session.getId()); 
		try { 
			final Basic basic=session.getBasicRemote();
			basic.sendText("대화방에 연결 되었습니다.");
		}catch (Exception e) { 
			System.out.println(e.getMessage()); 
		}
		sessionList.add(session); 
	} 
	private void sendAllSessionToMessage(Session self, String sender, String message) {
		try {
			for(Session session : WebSocketChat.sessionList) {
				if(!self.getId().equals(session.getId())) {
					session.getBasicRemote().sendText("<div align='left' width='100%'>"+sender+" : "+message+"</div>"); 
				} 
			} 
		}catch (Exception e) { 
			System.out.println(e.getMessage()); 
		} 
	} 
	
	private void sendAllSessionToMessage2(Session self, String sender, String message,String a) {
		try {
			for(Session session : WebSocketChat.sessionList) {
				if(!self.getId().equals(session.getId())) {
					session.getBasicRemote().sendText("<div align='left' width='100%'>"+sender+" : "+"<img src='"+a+message+"'><br><a href='"+a+message+"' download>다운로드</a></div>"); 
				} 
			} 
		}catch (Exception e) { 
			System.out.println(e.getMessage()); 
		} 
	} 
	
	
	@OnMessage public void onMessage(String message,Session session) {
		String temp[]=message.split(",");
		
		if(temp.length<3){
			String sender = message.split(",")[1];
			message = message.split(",")[0];
			logger.info("Message From "+sender + ": "+message);
			try {
				final Basic basic=session.getBasicRemote(); basic.sendText("<div align='right' width='100%'>"+message+" : 나 </div>");
			}catch (Exception e) { 
				System.out.println(e.getMessage()); 
			} sendAllSessionToMessage(session, sender, message); 
		}else if(temp.length>=3){
			String a=message.split(",")[3];
			String sender = message.split(",")[1];
			message = message.split(",")[2];
			logger.info("Message From "+sender + ": "+message);
			try {
				final Basic basic=session.getBasicRemote(); basic.sendText("<div align='right' width='100%'><img src='"+a+message+"' ><br><a href='"+a+message+"' download>다운로드</a></div>");
				
			}catch (Exception e) { 
				System.out.println(e.getMessage()); 
			} sendAllSessionToMessage2(session, sender, message ,a); 
		}
	} 
	
	@OnError 
	public void onError(Throwable e,Session session) { }
	
	@OnClose 
	public void onClose(Session session) { 
		logger.info("Session "+session.getId()+" has ended"); sessionList.remove(session);
	} 
}
		
	
		
				
			
		
	
		
		
	
	


