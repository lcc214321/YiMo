package top.yimo.sys.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import top.yimo.sys.dao.UserOnlineDao;
import top.yimo.sys.domain.UserOnlineDO;
import top.yimo.sys.service.UserOnlineService;

@Service
@Transactional(rollbackFor = Exception.class)
public class UserOnlineServiceImpl implements UserOnlineService {
	@Autowired
	private UserOnlineDao userOnlineDao;

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

	@Override
	public int save(UserOnlineDO userOnline) {
		return userOnlineDao.save(userOnline);
	}

	@Override
	public int update(UserOnlineDO userOnline) {
		return userOnlineDao.update(userOnline);
	}

	@Override
	public int remove(String sessionid) {
		return userOnlineDao.remove(sessionid);
	}

	@Override
	public int batchRemove(String[] sessionids) {
		return userOnlineDao.batchRemove(sessionids);
	}

	@Override
	public int kikcout(String sessionid) {
		UserOnlineDO userOnline = get(sessionid);
		userOnline.setStatus("off_line");
		return userOnlineDao.update(userOnline);
	}

}
