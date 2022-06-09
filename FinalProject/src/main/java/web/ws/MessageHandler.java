package web.ws;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.PongMessage;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import web.dao.face.MessageDao;


@Component
public class MessageHandler extends TextWebSocketHandler {
	
	@Autowired MessageDao messageDao;
	
	private static final Logger logger = LoggerFactory.getLogger(MessageHandler.class);
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	//해당 IP포트로 클라이언트가 접속했을 때 실행되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		logger.info("Message : afterConnectionEstablished: {}", session);
		logger.info("Message : afterConnectionEstablished: {}", session.getAttributes());
		logger.info("Message : afterConnectionEstablished: {}", (String)session.getAttributes().get("id"));
		
		sessionList.add(session);
	}

	//클라이언트가 메세지를 보냈을 때, 나타나는 메소드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		System.out.println("핸들러텍스트메시지 진입");
		
		String id = searchUserName(session);
		
//		//브로드캐스팅 - 접속된 모든 이용자에게 메세지 날림
//		for(WebSocketSession sess: sessionList) {
//            sess.sendMessage(new TextMessage(id+": "+ message.getPayload()));
//        }
		
		byte[] countMs = messageDao.countMessageView(id).getBytes();
		
		logger.info("Message : countMs: {}", countMs);
		
		session.sendMessage(new TextMessage(countMs));
		
	}

	//연결이 끊어지면 실행되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		String user_name = searchUserName(session);
		System.out.println("연결 끊어짐");
		for (WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(user_name + "님의 연결이 끊어졌습니다."));
		}
		sessionList.remove(session);
	}

	// 세션 객체에 저장해둔 유저의 id 사용
	public String searchUserName(WebSocketSession session) throws Exception {
		String id = (String) session.getAttributes().get("id");
		// Map<String, Object> map;
		// map = session.getAttributes();
		// id = (String) map.get("id");
		return id;
	}

	
	
	
	
}
