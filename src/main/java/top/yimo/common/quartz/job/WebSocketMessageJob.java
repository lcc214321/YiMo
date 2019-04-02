package top.yimo.common.quartz.job;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.quartz.QuartzJobBean;

import lombok.extern.slf4j.Slf4j;
import top.yimo.common.model.vo.WebSocketMessageVo;


@Slf4j
public class WebSocketMessageJob extends QuartzJobBean{
	@Autowired
	SimpMessagingTemplate message;
	
	@Override
	protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
		log.info("进入任务自动发送消息");
		message.convertAndSend("/topic/webSocketMessageJob", WebSocketMessageVo.message("这是一条由定时任务推送的WebSocket消息!"));
	}
}
