package top.yimo.sys.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import top.yimo.sys.dao.RoleDao;
import top.yimo.sys.domain.RoleDO;
import top.yimo.sys.service.RoleService;



@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleDao roleDao;
	
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
	public int update(RoleDO role){
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
				if(allRole.getRoleId().equals(hasRole.getRoleId())) {
					allRole.setHasRole(true);
					break;
				}
			}
		}
		return allRoles;
	}
	
}
