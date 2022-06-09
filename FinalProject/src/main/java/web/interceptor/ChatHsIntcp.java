package web.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.server.HandshakeInterceptor;

//웹소켓 인터셉터 클래스 
public class ChatHsIntcp implements HandshakeInterceptor{

	private final Logger logger = LoggerFactory.getLogger(ChatHsIntcp.class);
	
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		
		//서블릿과 톰캣 간 기반 설정 차이 - 일치시키기 위한 파라미터 형변환 과정 
		ServletServerHttpRequest ssreq = (ServletServerHttpRequest)request;
		HttpServletRequest req = ssreq.getServletRequest();
		
		HttpSession session = req.getSession();
		
		String userid = (String) session.getAttribute("id");
		attributes.put("HttpSession", session);
		
		logger.info("HandshakeInterceptor end");
		return true;
	}

	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception exception) {
		// TODO Auto-generated method stub
		
		
	}

}
