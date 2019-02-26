package top.yimo.sys.dao;

import top.yimo.sys.domain.MenuDO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

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
	
	List<MenuDO> list(Map<String,Object> map);
	
	int count(Map<String,Object> map);
	
	int save(MenuDO menu);
	
	int update(MenuDO menu);
	
	int remove(Long menu_id);
	
	int batchRemove(Long[] menuIds);
	@Select("select m.perms from sys_menu m,sys_user_role ur,sys_role_menu rm where ur.role_id=rm.role_id and rm.menu_id=m.menu_id and ur.user_id=#{id}" )
	List<String> listPermsByUserId(Long id);
	@Select("select m.* from sys_menu m,sys_user_role ur,sys_role_menu rm where ur.role_id=rm.role_id and rm.menu_id=m.menu_id and ur.user_id=#{id}" )
	List<MenuDO> getMenuByUserId(Long id);

}
