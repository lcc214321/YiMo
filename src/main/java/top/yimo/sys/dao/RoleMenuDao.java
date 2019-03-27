package top.yimo.sys.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import top.yimo.sys.domain.RoleMenuDO;

/**
 * 角色与菜单对应关系
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年06月26日 17:06:53
 */
@Mapper
public interface RoleMenuDao {

	RoleMenuDO get(Long id);

	List<RoleMenuDO> listByPage(Map<String, Object> map);

	int count(Map<String, Object> map);

	int save(RoleMenuDO roleMenu);

	int update(RoleMenuDO roleMenu);

	int remove(Long id);

	int batchRemove(Long[] ids);

	@Select("select menu_id from sys_role_menu where role_id=#{id}")
	List<Long> getMenuIdByRoleId(Long id);
	@Delete("delete from sys_role_menu where role_id=#{id}")
	int batchRemoveByRoleID(Long id);
	@Delete("delete from sys_role_menu where menu_id=#{menuId}")
	int batchRemoveByMenuID(Long menuId);
}
