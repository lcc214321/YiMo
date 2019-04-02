package top.yimo.common.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import lombok.extern.slf4j.Slf4j;
import top.yimo.common.model.vo.WebSocketMessageVo;

@Controller
@Slf4j
public class WebSocketController {

	@MessageMapping("/queue/sendTest") // 接收客户端发送的消息
	@SendTo("/topic/ReceiveTest")// 将接收到的消息广播出去
	public WebSocketMessageVo sendMessage(String message) {
		log.info("接收到消息{}", message);
		return WebSocketMessageVo.message("你发送的消息是：" + message);
	}
}
