package top.yimo.sys.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import top.yimo.sys.domain.MenuDO;

/**
 * 菜单管理
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年22月24日 17:22:00
 */
@Mapper
public interface MenuDao {

	MenuDO get(Long menuId);

	List<MenuDO> list(Map<String, Object> map);

	int count(Map<String, Object> map);

	int save(MenuDO menu);

	int update(MenuDO menu);

	int remove(Long menu_id);

	int batchRemove(Long[] menuIds);
	@Select("select m.perms from sys_menu m,sys_user_role ur,sys_role_menu rm where ur.role_id=rm.role_id and rm.menu_id=m.menu_id and m.status='1'  and ur.user_id=#{id}")
	List<String> listPermsByUserId(Long id);
	@Select("select distinct m.* from sys_menu m,sys_user_role ur,sys_role_menu rm where ur.role_id=rm.role_id and rm.menu_id=m.menu_id and m.status='1'  and  ur.user_id=#{id}")
	List<MenuDO> getMenuByUserId(Long id);
	@Select("select distinct m.* from sys_menu m,sys_role_menu rm where  rm.menu_id=m.menu_id and rm.role_id=#{id} and m.status='1' ")
	List<MenuDO> getMenuByRoleId(Long id);
	@Select("select m.* from sys_menu m where  status='1' ")
	List<MenuDO> getAllMenu();

}
