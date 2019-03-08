package top.yimo.sys.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import top.yimo.common.model.vo.TreeVo;
import top.yimo.sys.domain.MenuDO;

/**
 * 菜单管理
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年22月24日 17:22:00
 */
public interface MenuService {

	MenuDO get(Long menuId);

	List<MenuDO> list(Map<String, Object> map);

	int count(Map<String, Object> map);

	int save(MenuDO menu);

	int update(MenuDO menu);

	int remove(Long menuId);

	int batchRemove(Long[] menuIds);
	/**
	 * 通过用户ID查询对应权限
	 */
	Set<String> listPermsByUserId(Long id);

	/**
	 * 获取所有权限
	 */
	Set<String> listAllPerms();
	/**
	 * 通过用户ID查询对应有效的菜单
	 */
	List<TreeVo<MenuDO>> getMenusByUser(Long userId);

	/**
	 * 通过角色ID查询对应所有菜单
	 */
	List<TreeVo<MenuDO>> getMenuTreeByRole(Long roleId);

}
