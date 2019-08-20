package cn.tayle.sys.dao;

import cn.tayle.sys.domain.RoleDO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

/**
 * 角色
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年05月28日 22:08:56
 */
@Mapper
public interface RoleDao {

	RoleDO get(Long roleId);
	
	List<RoleDO> listByPage(Map<String,Object> map);
	
	int count(Map<String,Object> map);
	
	int save(RoleDO role);
	
	int update(RoleDO role);
	
	int remove(Long role_id);
	
	int batchRemove(Long[] roleIds);
	
	List<RoleDO> exportData(RoleDO role);
	
	/**
	 * 根据用户id获取其拥有的角色信息
	 */
	List<RoleDO> getRolesByUserId(Long userId);
	/**
	 * 获取所有有效的角色信息
	 */
	List<RoleDO> getAllRoles();
}
