package web.ws;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.BinaryWebSocketHandler;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

@Component
public class SocketHandler extends BinaryWebSocketHandler {
	
	List<HashMap<String, WebSocketSession>> sessions = new ArrayList<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("afterConnectionEstablished: "+ session);
		
		System.out.println(session.getAttributes());
		
		System.out.println((String)session.getAttributes().get("id"));
		
		HashMap<String, WebSocketSession> sessionMap = new HashMap<>();
		
		sessionMap.put((String)session.getAttributes().get("id"), session);
		
		System.out.println(sessionMap);
		sessions.add(sessionMap);
		
		System.out.println(sessions);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) {
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = null;
		try {
			jsonObject = (JSONObject) jsonParser.parse((String) message.getPayload());
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		
		System.out.println(jsonObject.get("receiverId"));
		String receiverUser = (String)jsonObject.get("receiverId");
		
		System.out.println(message.getPayload());
		
		System.out.println(receiverUser);
		
		//상대방 유저 로그인 확인용==========================
		boolean isLogin = false;
		
		for(int i=0; i<sessions.size(); i++) {
			HashMap<String, WebSocketSession> map = sessions.get(i);
			for(String key : map.keySet()) {
				
				if(receiverUser.equals(key)) {
					isLogin = true;
				}
			}
		}
		
		if(isLogin!=true) {
			try {
				
				Gson gson = new Gson();
				JsonObject jsObject = new JsonObject();
				jsObject.addProperty("type", "noLogin");
				// JsonObject를 Json 문자열로 변환
				String jsonStr = gson.toJson(jsObject);
				
				System.out.println(jsonStr);
				
		        byte[] bytes = jsonStr.getBytes();
		        TextMessage noMessage = new TextMessage(jsonStr);
		        System.out.println(noMessage);
				session.sendMessage(noMessage);
				return;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		//상대방 유저 로그인 확인용==========================
		System.out.println("뿌리기");
		for(int i=0; i<sessions.size(); i++) {
			HashMap<String, WebSocketSession> map = sessions.get(i);
			for(String key : map.keySet()) {
				
				try {
					if(receiverUser.equals(key)) {
						System.out.println(key);
						System.out.println(map.get(key));
						map.get(key).sendMessage(message);
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		System.out.println("=============================================");
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed");
		
		System.out.println("세션 삭제 전");
		System.out.println(sessions.size());
		
		int removeIndex = 0;
		for(int i=0; i<sessions.size(); i++) {
			HashMap<String, WebSocketSession> map = sessions.get(i);
			for(String key : map.keySet()) {
				if(map.get(key).equals(session)) {
					removeIndex = i;
				}
			}
		}
		
		sessions.remove(removeIndex);
		
		System.out.println("세션 삭제 후");
		System.out.println(sessions.size());
	}
}