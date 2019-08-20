package cn.tayle.common.shiro.session;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.SessionListenerAdapter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.tayle.common.util.SpringUtil;
import cn.tayle.sys.service.UserOnlineService;
/**
 * 扩展session过期操作
 * 		增加同步db中的在线用户状态
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年3月22日 下午3:07:51
 */
public class ShiroSessionListener extends SessionListenerAdapter {
	private static final Logger LOGGER = LoggerFactory.getLogger(ShiroSessionListener.class);

	// 会话过期时触发
	@Override
	public void onExpiration(Session session) {
		String sessionId = session.getId().toString();
		UserOnlineService userOnlineService = SpringUtil.getBean(UserOnlineService.class);
		userOnlineService.kickout(sessionId);
		LOGGER.debug("会话过期同步在线用户状态{}", sessionId);
	}

}
