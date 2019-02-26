package top.yimo.sys.dao;

import top.yimo.sys.domain.UserRoleDO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户与角色对应关系
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年59月25日 11:59:27
 */
@Mapper
public interface UserRoleDao {

	UserRoleDO get(Long id);
	
	List<UserRoleDO> listByPage(Map<String,Object> map);
	
	int count(Map<String,Object> map);
	
	int save(UserRoleDO userRole);
	
	int update(UserRoleDO userRole);
	
	int remove(Long id);
	
	int batchRemove(Long[] ids);
	@Delete("delete from sys_user_role where user_id=#{userId}")
	int batchRemoveByUserID(long userId);
	
	
}
