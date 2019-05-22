package top.yimo.sys.service;

import java.util.List;
import java.util.Map;

import top.yimo.sys.domain.RoleDO;

/**
 * 角色
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年22月24日 17:22:00
 */
public interface RoleService {

	RoleDO get(Long roleId);

	List<RoleDO> listByPage(Map<String, Object> map);

	int count(Map<String, Object> map);

	int save(RoleDO role);

	int update(RoleDO role);

	int remove(Long roleId);

	int batchRemove(Long[] roleIds);

	/**
	 * 根据用户id获取其拥有的角色信息
	 */
	List<RoleDO> getRolesByUserId(Long userId);

	List<RoleDO> exportData(RoleDO role);
}
