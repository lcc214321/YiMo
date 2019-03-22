package top.yimo.sys.service.impl;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.session.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import top.yimo.common.constant.WebConstant;
import top.yimo.common.shiro.session.OnlineSessionDao;
import top.yimo.common.util.DateUtils;
import top.yimo.sys.dao.UserOnlineDao;
import top.yimo.sys.domain.UserOnlineDO;
import top.yimo.sys.service.UserOnlineService;

@Service
@Transactional(rollbackFor = Exception.class)
public class UserOnlineServiceImpl implements UserOnlineService {
	private static final Logger LOGGER = LoggerFactory.getLogger(UserOnlineServiceImpl.class);

	@Autowired
	private UserOnlineDao userOnlineDao;
	@Autowired
	private OnlineSessionDao onlineSessionDao;

	@Override
	public UserOnlineDO get(String sessionid) {
		return userOnlineDao.get(sessionid);
	}

	@Override
	public List<UserOnlineDO> listByPage(Map<String, Object> map) {
		return userOnlineDao.listByPage(map);
	}

	@Override
	public int count(Map<String, Object> map) {
		return userOnlineDao.count(map);
	}

	/**
	 * 更新会话；如更新会话最后访问时间/停止会话/设置超时时间/设置移除属性等会调用
	 */
	@Override
	public int save(UserOnlineDO userOnline) {
		return userOnlineDao.save(userOnline);
	}

	/**
	 * 踢出session
	 */
	@Override
	public int kickout(String sessionId) {
		Session doReadSession = onlineSessionDao.doReadSession(sessionId);
		if (doReadSession != null) {
			onlineSessionDao.delete(doReadSession);
		}
		return 1;
	}

	/**
	 * 定时同步DB中的在线用户状态
	 */
	@Scheduled(cron = "0/5 * * * * ? ")
	public void syncStatu() {
		// 获取数据库中在线的用户
		List<UserOnlineDO> actives = userOnlineDao.getActives();
		Collection<Session> activeSessions = onlineSessionDao.getActiveSessions();
		LOGGER.debug("同步在线用户状态... 当前数据库在线用户个数：{},缓存中在线用户个数：{}", actives.size(), activeSessions.size());
		if (actives.size() != activeSessions.size()) {
			for (UserOnlineDO userOnline : actives) {
				String sessionId = userOnline.getSessionId();
				Session doReadSession = onlineSessionDao.readSession(sessionId);
				if (doReadSession == null) {// 用户不存在session
					userOnline.setStatus(WebConstant.ONLINE_SESSION_OFF);
					if (userOnline.getEndTime() == null || StringUtils.isBlank(userOnline.getEndTime())) {
						userOnline.setEndTime(DateUtils.getNow());
					}
					save(userOnline);
				}
			}
		}

	}
}
