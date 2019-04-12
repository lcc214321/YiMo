package top.yimo.common.shiro.session;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import top.yimo.common.constant.WebConstant;
import top.yimo.common.util.DateUtils;
import top.yimo.common.util.SpringUtil;
import top.yimo.sys.domain.OnlineSession;
import top.yimo.sys.domain.UserOnlineDO;
import top.yimo.sys.service.UserOnlineService;
import top.yimo.sys.service.impl.UserOnlineServiceImpl;
/**
 * 管理session的CRUD
 * 
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年3月15日 下午5:23:38
 */
public class OnlineSessionDao extends EnterpriseCacheSessionDAO {

	@Autowired
	UserOnlineService onlineSessionService;

	/**
	 * 创建sessionId 同时将id与自定义的session对象关联起来
	 */
	@Override
	public Serializable create(Session session) {
		Serializable sessionId = super.create(session);
		((OnlineSession) session).setId(sessionId);
		return sessionId;
	}

	/**
	 * 根据ID 从缓存中获取session 
	 */
	@Override
	public Session doReadSession(Serializable sessionId) {
		OnlineSession session = (OnlineSession) getCachedSession(sessionId);
		return session;
	}

	/**
	 * 当会话过期/停止（如用户退出时）更新session记录为离线
	 */
	@Override
	public void doDelete(Session session) {
		if (null == session) {
			return;
		}
		OnlineSession onlineSession = (OnlineSession) session;
		onlineSession.setAttribute("kickout", true);
		onlineSession.setStatus(WebConstant.ONLINE_SESSION_OFF);
		onlineSession.setChange(true);
		save2DB(onlineSession);
	}

	/**
	 * 将session信息持久化到db
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 */
	public void save2DB(OnlineSession session) {
		if (session.isChange()) {// 发生变化才更新
			UserOnlineDO userOnline = new UserOnlineDO();
			BeanUtils.copyProperties(session, userOnline);
			userOnline.setSessionId(session.getId().toString());
			if (session.getStatus().equals(WebConstant.ONLINE_SESSION_OFF)) {
				userOnline.setEndTime(DateUtils.format(session.getStopTimestamp(),DateUtils.DATE_TIME_PATTERN));
			}
			userOnline.setSession(session);
			UserOnlineServiceImpl userOnlineService = SpringUtil.getBean(UserOnlineServiceImpl.class);
			userOnlineService.save(userOnline);
			session.setChange(false);
		}
	}

}
