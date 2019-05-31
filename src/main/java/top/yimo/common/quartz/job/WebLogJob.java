package top.yimo.common.quartz.job;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.quartz.QuartzJobBean;

import top.yimo.common.model.vo.WebLogVo;
import top.yimo.common.util.DateUtils;

/**
 * 推送服务端日志信息到前端
 * 
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年4月16日 上午10:29:03
 */
public class WebLogJob extends QuartzJobBean {
	@Autowired
	SimpMessagingTemplate message;
	static long lastTimeFileSize;// 设置成静态方便存储启动时的长度

	@Value("${logging.path}")
	String logPath;

	@Override
	protected void executeInternal(JobExecutionContext context) throws JobExecutionException {

		// 指定文件可读可写
		String logFile = (new StringBuffer()).append(logPath).append("/").append(DateUtils.getNowDate()).append("/")
				.append(DateUtils.getNowDate()).append(".log").toString();
		RandomAccessFile randomFile;
		try {
			randomFile = new RandomAccessFile(logFile, "rw");
			// 获得变化部分的
			randomFile.seek(lastTimeFileSize);
			String tmp = "";
			while ((tmp = randomFile.readLine()) != null) {
				String text = new String(tmp.getBytes("ISO8859-1"));
//				log.info("查询服务器日志{}",text);
				message.convertAndSend("/topic/webLogJob", WebLogVo.log(text));
			}
			lastTimeFileSize = randomFile.length();
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
