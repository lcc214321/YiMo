package top.yimo.common.shiro.session;

import java.io.Serializable;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;
import org.apache.shiro.session.mgt.eis.RandomSessionIdGenerator;
import org.springframework.beans.factory.annotation.Autowired;

import top.yimo.sys.domain.UserOnlineDO;
import top.yimo.sys.service.UserOnlineService;
/**
 * 管理session的CRUD
 * 
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年3月15日 下午5:23:38
 */
public class UserOnlineSessionDao extends EnterpriseCacheSessionDAO {

	@Autowired
	UserOnlineService onlineSessionService;

	/**
	 * 创建session
	 */
	@Override
	protected Serializable doCreate(Session session) {
		setSessionIdGenerator(new RandomSessionIdGenerator());
		Serializable sessionId = super.doCreate(session);
		return sessionId;
	}

	/**
	 * 获取session
	 */
	@Override
	protected Session doReadSession(Serializable sessionId) {
		System.out.println("sessionid" + sessionId);
		UserOnlineDO userOnline = onlineSessionService.get(String.valueOf(sessionId));
		if (userOnline == null) {// 优先从数据库中获取session ，不存在时从缓存中获取
			// return super.readSession(sessionId);
			return null;
		}
		return userOnline;
	}

	@Override
	protected void doUpdate(Session session) {

		super.doUpdate(session);
	}

	/**
	 * 当会话过期/停止（如用户退出时）更新session记录为离线
	 */
	@Override
	public void doDelete(Session session) {
		if (null == session) {
			return;
		}
		UserOnlineDO userOnline = (UserOnlineDO) session;
		userOnline.setStatus("off_line");
		onlineSessionService.save(userOnline);
	}

	/**
	 * 更新会话；如更新会话最后访问时间/停止会话/设置超时时间/设置移除属性等会调用
	 */
	public void saveSession2DB(UserOnlineDO userOnline) {
		onlineSessionService.save(userOnline);
	}
}
