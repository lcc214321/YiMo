package top.yimo.sys.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import top.yimo.common.shiro.session.OnlineSessionDao;
import top.yimo.sys.dao.UserOnlineDao;
import top.yimo.sys.domain.UserOnlineDO;
import top.yimo.sys.service.UserOnlineService;

@Service
@Transactional(rollbackFor = Exception.class)
public class UserOnlineServiceImpl implements UserOnlineService {
	@Autowired
	private UserOnlineDao userOnlineDao;

	private OnlineSessionDao sessionDao;

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
	 * 强制踢出用户
	 */
	@Override
	public int kickout(String sessionid) {
		Session session = sessionDao.readSession(sessionid);
		session.setAttribute("kickout", true);
		UserOnlineDO userOnline = get(sessionid);
		userOnline.setStatus("off_line");
		return userOnlineDao.update(userOnline);
	}

}
