package top.yimo.common.websocket;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

import lombok.extern.slf4j.Slf4j;

/**
 * STOMP配置类 
 * 		<li>配置webSocket消息代理
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年4月2日 上午11:39:18
 */
@Configuration
@EnableWebSocketMessageBroker
@Slf4j
public class WebSocketStompConfig implements WebSocketMessageBrokerConfigurer{

	/**
	 * 注册Stomp端点
	 */
	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		 registry.addEndpoint("/websocket").withSockJS();
		 log.info("Stomp端点注册成功");
	}

	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
		registry.enableSimpleBroker("/queue","/topic");//允许点对点 与广播
	}
	
	
}
