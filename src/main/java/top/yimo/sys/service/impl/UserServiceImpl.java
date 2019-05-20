package top.yimo.sys.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import top.yimo.common.constant.WebConstant;
import top.yimo.common.exception.TipException;
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
@Slf4j
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
		return userDao.save(user);
	}

	@Override
	public int update(UserDO user) {
		user.setUpdateTime(DateUtils.getNow());
		Long userId = user.getUserId();
		// 更新用户角色信息
		List<Long> roles = user.getRoleIds();
		if (roles.size() > 0) {
			uerRoleDao.batchRemoveByUserID(userId);
			for (Long roleId : roles) {
				UserRoleDO userRoleDO = new UserRoleDO();
				userRoleDO.setRoleId(roleId);
				userRoleDO.setUserId(userId);
				uerRoleDao.save(userRoleDO);
			}
		}
		// 如果修改的是当前用户对象 则更新shiro中的当前用户对象
		Long currUserId = ShiroUtils.getUserId();
		if (currUserId.equals(userId)) {
			UserDO currUser = ShiroUtils.getSysUser();
			BeanUtils.copyProperties(user, currUser);
			log.info("当前用户同步session完成");
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

	@Override
	public List<UserDO> exportData(UserDO user) {
		List<UserDO> exportData = userDao.exportData(user);
		return exportData;
	}

	@Override
	public String importData(List<UserDO> userList, boolean isCover) {
		if (userList == null || userList.size() == 0) {
			throw new TipException("导入用户数据不能为空！");
		}
		int successNum = 0;
		int failureNum = 0;
		StringBuilder successMsg = new StringBuilder();
		StringBuilder failureMsg = new StringBuilder();
//		long operuserId = ShiroUtils.getUserId();
		long operuserId = 1l;

		String password = WebConstant.DEAFULT_PWD;
		for (UserDO user : userList) {
			System.out.println("导入数据信息" + user.toString());
			try {
				// 验证是否存在这个用户
				UserDO userdb = userDao.findByUserName(user.getUserName());
				if (userdb == null) {// 不存在
					user.setPassword(password);
					user.setCreateUserId(operuserId);
					this.save(user);
					successNum++;
					successMsg.append("<br/>" + successNum + "、账号 " + user.getName() + " 导入成功");
				} else if (isCover) {// 覆盖
					user.setCreateUserId(operuserId);
					this.update(user);
					successNum++;
					successMsg.append("<br/>" + successNum + "、账号 " + user.getName() + " 更新成功");
				} else {
					failureNum++;
					failureMsg.append("<br/>" + failureNum + "、账号 " + user.getName() + " 已存在");
				}
			} catch (Exception e) {
				failureNum++;
				String msg = "<br/>" + failureNum + "、账号 " + user.getName() + " 导入失败：";
				failureMsg.append(msg + e.getMessage());
				log.error(msg, e);
			}
		}
		if (failureNum > 0) {
			failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
			throw new TipException(failureMsg.toString());
		} else {
			successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
		}
		return successMsg.toString();
	}

}
