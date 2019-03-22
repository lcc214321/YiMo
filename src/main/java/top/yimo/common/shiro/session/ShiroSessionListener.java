package top.yimo.common.shiro.session;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.SessionListenerAdapter;

import top.yimo.common.util.SpringUtil;
import top.yimo.sys.service.UserOnlineService;
/**
 * 扩展session过期操作
 * 		增加同步db中的在线用户状态
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年3月22日 下午3:07:51
 */
public class ShiroSessionListener extends SessionListenerAdapter {

	// 会话过期时触发
	@Override
	public void onExpiration(Session session) {
		String sessionId = session.getId().toString();
		UserOnlineService userOnlineService = SpringUtil.getBean(UserOnlineService.class);
		userOnlineService.kickout(sessionId);
	}

}
