package cn.tayle.common.shiro.session;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.session.ExpiredSessionException;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.DefaultSessionKey;
import org.apache.shiro.session.mgt.SessionKey;
import org.apache.shiro.session.mgt.SimpleSession;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.tayle.common.util.SpringUtil;
import cn.tayle.sys.service.UserOnlineService;

/**
 * 处理异常session
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年3月19日 下午5:43:34
 */
public class OnlineSessionManager extends DefaultWebSessionManager {

	private static final Logger logger = LoggerFactory.getLogger(OnlineSessionManager.class);
	private CacheManager cacheManager;

	@Override
	public void validateSessions() {
		if (logger.isInfoEnabled()) {
			logger.info("Validating all active sessions...");
		}
		int invalidCount = 0;
		List<String> needOfflineIdList = new ArrayList<String>();// 需要更新踢出的session
		Collection<?> activeSessions = getActiveSessions();
		if (activeSessions != null && !activeSessions.isEmpty()) {
			for (Iterator<?> i$ = activeSessions.iterator(); i$.hasNext();) {
				Session session = (Session) i$.next();
				try {
					SessionKey key = new DefaultSessionKey(session.getId());
					validate(session, key);
					if ((Boolean) session.getAttribute("kickout") != null && (Boolean) session.getAttribute("kickout") == true) {// 被强制踢出的session
						logger.debug("被强制踢出OnlineSessionManager");
						throw new InvalidSessionException();
					}

				} catch (InvalidSessionException e) {
					if (cacheManager != null) {
						SimpleSession s = (SimpleSession) session;
						if (s.getAttribute("portal.session.id") != null) {
							cacheManager.getCache(null).remove(s.getAttribute("portal.session.id"));
						}
						needOfflineIdList.add(s.getId().toString());
					}
					if (logger.isDebugEnabled()) {
						boolean expired = e instanceof ExpiredSessionException;
						String msg = (new StringBuilder()).append("Invalidated session with id [").append(session.getId()).append("]")
						        .append(expired ? " (expired)" : " (stopped)").toString();
						logger.debug(msg);
					}
					invalidCount++;
				}
			}
		}
		for (String sessionId : needOfflineIdList) {
			UserOnlineService userOnlineService = SpringUtil.getBean(UserOnlineService.class);
			userOnlineService.kickout(sessionId);
		}

		if (logger.isInfoEnabled()) {
			String msg = "Finished session validation.";
			if (invalidCount > 0) {
				msg = (new StringBuilder()).append(msg).append("[").append(invalidCount).append("] sessions were stopped.").toString();
			} else {
				msg = (new StringBuilder()).append(msg).append("No sessions were stopped.").toString();
			}
			logger.info(msg);
		}
	}

	public void setCacheManager(CacheManager cacheManager) {
		this.cacheManager = cacheManager;
	}

}
