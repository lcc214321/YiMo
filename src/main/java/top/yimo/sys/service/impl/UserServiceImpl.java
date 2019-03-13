package top.yimo.sys.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import top.yimo.common.constant.WebConstant;
import top.yimo.common.util.DateUtils;
import top.yimo.common.util.ShiroUtils;
import top.yimo.common.util.YiMoUtils;
import top.yimo.sys.dao.DeptDao;
import top.yimo.sys.dao.UserDao;
import top.yimo.sys.dao.UserRoleDao;
import top.yimo.sys.domain.DeptDO;
import top.yimo.sys.domain.UserDO;
import top.yimo.sys.domain.UserRoleDO;
import top.yimo.sys.service.UserService;

@Service
@Transactional(rollbackFor = Exception.class)
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;
	@Autowired
	private UserRoleDao uerRoleDao;
	@Autowired
	private DeptDao deptDao;

	@Override
	public UserDO get(Long userId) {
		return userDao.get(userId);
	}

	@Override
	public UserDO findByUserName(String userName) {
		UserDO user = userDao.findByUserName(userName);
		Long deptId = user.getDeptId();
		DeptDO dept = deptDao.get(deptId);
		user.setDeptName(dept.getDeptName());
		return user;
	}

	@Override
	public List<UserDO> listByPage(Map<String, Object> map) {
		return userDao.listByPage(map);
	}

	@Override
	public int count(Map<String, Object> map) {
		return userDao.count(map);
	}

	@Override
	public int save(UserDO user) {
		user.setPassword(YiMoUtils.encrypt(user.getUserName(), user.getPassword()));
		user.setCreateTime(DateUtils.getNow());
		user.setCreateUserId(ShiroUtils.getUserId());
		user.setStatus(1);
		return userDao.save(user);
	}

	@Override
	public int update(UserDO user) {
		user.setUpdateTime(DateUtils.getNow());
		Long userId = user.getUserId();
		// 更新用户角色信息
		uerRoleDao.batchRemoveByUserID(userId);
		List<Long> roles = user.getRoleIds();
		if (roles.size() > 0) {
			for (Long roleId : roles) {
				UserRoleDO userRoleDO = new UserRoleDO();
				userRoleDO.setRoleId(roleId);
				userRoleDO.setUserId(userId);
				uerRoleDao.save(userRoleDO);
			}
		}
		return userDao.update(user);
	}

	@Override
	public int remove(Long userId) {
		return userDao.remove(userId);
	}

	@Override
	public int batchRemove(Long[] userIds) {
		return userDao.batchRemove(userIds);
	}

	@Override
	public int resetPwd(Long userId) {
		UserDO user = get(userId);
		user.setPassword(YiMoUtils.encrypt(user.getUserName(), WebConstant.DEAFULT_PWD));
		return userDao.update(user);
	}

	@Override
	public boolean checkUserNameUnique(String userName) {
		UserDO user = userDao.findByUserName(userName);
		return user == null;
	}

}
