package top.yimo.sys.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import top.yimo.common.YiMoConfig;
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
		UserDO user = userDao.get(userId);
		getDeptName(user);
		return user;
	}

	public void getDeptName(UserDO user) {
		Long deptId = user.getDeptId();
		DeptDO dept = deptDao.get(deptId);
		user.setDeptName(dept.getDeptName());
	}

	@Override
	public UserDO findByUserName(String userName) {
		UserDO user = userDao.findByUserName(userName);
		getDeptName(user);
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

		Long deptId = user.getDeptId();
		if (deptId == null) {// 新增无部门时默认一个
			deptId = 1l;
			user.setDeptId(deptId);
		}
		List<Long> roleIds = user.getRoleIds();
		if (roleIds == null || roleIds.size() == 0) {
			roleIds = new ArrayList<Long>();
			roleIds.add(0l);// 默认一个角色
			user.setRoleIds(roleIds);
		}

		return userDao.save(user);
	}

	@Override
	public int update(UserDO user) {
		user.setUpdateTime(DateUtils.getNow());
		Long userId = user.getUserId();
		// 更新用户角色信息
		List<Long> roles = user.getRoleIds();
		if (roles != null && roles.size() > 0) {
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
			ShiroUtils.updateUser(currUser);
			log.info("当前用户同步session以及shiro完成");
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
	public int updatePwd(UserDO user, String pwd) {
		user.setPassword(YiMoUtils.encrypt(user.getUserName(), pwd));
		return update(user);
	}

	@Override
	public boolean checkPwd(String pwd, UserDO user) {
		String encrypt = YiMoUtils.encrypt(user.getUserName(), pwd);
		return encrypt.equals(user.getPassword());
	}

	@Override
	public boolean checkUserUnique(UserDO user) {
		UserDO userdb = userDao.checkUserUnique(user);
		return userdb == null;
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
		// long operuserId = ShiroUtils.getUserId();
		long operuserId = 1l;

		String password = WebConstant.DEAFULT_PWD;
		for (UserDO user : userList) {
			System.out.println("导入数据信息" + user.toString());
			try {
				// 验证是否存在这个用户 通过用户名来判断
				UserDO userdb = userDao.findByUserName(user.getUserName());
				if (userdb == null) {// 不存在新增
					user.setPassword(password);
					user.setCreateUserId(operuserId);
					this.save(user);
					successNum++;
					successMsg.append("<br/>" + successNum + "、账号 " + user.getName() + " 导入成功");
				} else if (isCover) {// 覆盖
					user.setCreateUserId(operuserId);
					user.setUserId(userdb.getUserId());
					user.setRoleIds(userdb.getRoleIds());
					user.setDeptId(userdb.getDeptId());

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

	@Override
	public String uploadImg(String avatar_data, Long userId) throws IOException {
		String uploadPath = YiMoConfig.getUploadPath();
		StringBuffer file = new StringBuffer();
		String imgPath = file.append(DateUtils.getNowDate("yyyy/MM/dd")).append((File.separator))
				.append(UUID.randomUUID()).append(".png").toString();
		decodeBase64DataURLToImage(avatar_data, uploadPath + imgPath);

		// 更新当前用户头像信息
		UserDO user = get(userId);
		user.setPicId("/files/" + imgPath);
		update(user);
		return "/files/" + imgPath;
	}

	/**
	 * 将Base64位编码的图片进行解码，并保存到指定目录
	 */
	private static void decodeBase64DataURLToImage(String dataURL, String imgPath) throws IOException {
		log.debug("文件路径{}", imgPath);
		// 将dataURL开头的非base64字符删除
		String base64 = dataURL.substring(dataURL.indexOf(",") + 1);
		File file = new File(imgPath);
		if (!file.exists()) {
			file.getParentFile().mkdirs();
		}
		FileOutputStream write = new FileOutputStream(file);
		byte[] decoderBytes = Base64.getDecoder().decode(base64);
		write.write(decoderBytes);
		write.close();
	}
}
