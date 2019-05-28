package top.yimo.sys.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

import top.yimo.common.exception.TipException;
import top.yimo.sys.dao.RoleDao;
import top.yimo.sys.dao.RoleMenuDao;
import top.yimo.sys.domain.RoleDO;
import top.yimo.sys.domain.RoleMenuDO;
import top.yimo.sys.service.RoleService;



@Service
@Transactional(rollbackFor = Exception.class)
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleDao roleDao;
	@Autowired
	private RoleMenuDao roleMenuDao;

	@Override
	public RoleDO get(Long roleId){
		return roleDao.get(roleId);
	}
	
	@Override
	public List<RoleDO> listByPage(Map<String, Object> map){
		return roleDao.listByPage(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return roleDao.count(map);
	}
	
	@Override
	public int save(RoleDO role){
		return roleDao.save(role);
	}
	
	@Override
	public int update(RoleDO role) {
		roleMenuDao.batchRemoveByRoleID(role.getRoleId());// 清空原有数据
		List<Long> menuIds = role.getMenuIds();
		if (menuIds.size() > 0) {
			for (Long menuId : menuIds) {
				RoleMenuDO roleRoleDO = new RoleMenuDO();
				roleRoleDO.setMenuId(menuId);
				roleRoleDO.setRoleId(role.getRoleId());
				roleMenuDao.save(roleRoleDO);
			}
		}
		return roleDao.update(role);
	}
	
	@Override
	public int remove(Long roleId){
		return roleDao.remove(roleId);
	}
	
	@Override
	public int batchRemove(Long[] roleIds){
		return roleDao.batchRemove(roleIds);
	}

	@Override
	public List<RoleDO> getRolesByUserId(Long userId) {
		List<RoleDO> hasRoles = roleDao.getRolesByUserId(userId);
		List<RoleDO> allRoles = roleDao.getAllRoles();
		for (RoleDO allRole : allRoles) {
			for (RoleDO hasRole : hasRoles) {
				if (allRole.getRoleId().equals(hasRole.getRoleId())) {
					allRole.setHasRole(true);
					break;
				}
			}
		}
		return allRoles;
	}

	@Override
	public List<RoleDO> exportData(RoleDO role) {
		List<RoleDO> exportData = roleDao.exportData(role);
		return exportData;
	}
	
	@Override
	public String importData(List<RoleDO> roleList, boolean isCover) {
		if (roleList == null || roleList.size() == 0) {
			throw new TipException("导入数据不能为空！");
		}
		int successNum = 0;
		int failureNum = 0;
		StringBuilder successMsg = new StringBuilder();
		StringBuilder failureMsg = new StringBuilder();

		for (RoleDO role : roleList) {
		//			try {
			// TODO 完成数据有效性校验与唯一性校验
			// 验证是否存在数据
//				UserDO userdb = userDao.findByUserName(user.getUserName()); 
//				if (userdb == null) {// 不存在新增 
//					user.setPassword(password); 
//					user.setCreateUserId(operuserId); 
//					this.save(user); 
//					successNum++; 
//					successMsg.append("<br/>" + successNum + "、账号 " + user.getName() + " 导入成功"); 
//				} else if (isCover) {// 覆盖 
//					
//					this.update(user); 
//					successNum++; 
//					successMsg.append("<br/>" + successNum + "、账号 " + user.getName() + " 更新成功"); 
//				} else { 
//					failureNum++; 
//					failureMsg.append("<br/>" + failureNum + "、账号 " + user.getName() + " 已存在"); 
//				} 
//			} catch (Exception e) { 
//				failureNum++; 
//				String msg = "<br/>" + failureNum + "、账号 " + user.getName() + " 导入失败："; 
//				failureMsg.append(msg + e.getMessage()); 
//				log.error(msg, e); 
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
