package top.yimo.sys.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public RoleDO get(Long roleId) {
		return roleDao.get(roleId);
	}

	@Override
	public List<RoleDO> listByPage(Map<String, Object> map) {
		return roleDao.listByPage(map);
	}

	@Override
	public int count(Map<String, Object> map) {
		return roleDao.count(map);
	}

	@Override
	public int save(RoleDO role) {
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
	public int remove(Long roleId) {
		return roleDao.remove(roleId);
	}

	@Override
	public int batchRemove(Long[] roleIds) {
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
}
