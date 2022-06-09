package web.ws;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

//@EnableWebSocket // 웹소켓 활성화
@Configuration // 빈 설정 클래스가 되도록 만드는 어노테이션
@EnableWebSocketMessageBroker
public class StompWebSocketConfig implements WebSocketMessageBrokerConfigurer{

	private final Logger logger = LoggerFactory.getLogger(StompWebSocketConfig.class);
	
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		registry.addEndpoint("/chat")
//				.setAllowedOriginPatterns("*")
				.withSockJS();		
		registry.addEndpoint("/notice")
//		.setAllowedOriginPatterns("*")
		.withSockJS();	
		registry.addEndpoint("/chkCarts")
		.withSockJS();	
		registry.addEndpoint("/chkOrders")
		.withSockJS();	
	}
	
	public void configureMessageBroker(MessageBrokerRegistry registry) {
		registry.enableSimpleBroker("/sub"); // simplebroker 시작용 prefux
		registry.setApplicationDestinationPrefixes("/pub"); // destination 설정용 prefux
	}
	
} 
