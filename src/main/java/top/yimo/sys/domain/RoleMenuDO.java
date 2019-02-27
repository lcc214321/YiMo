package top.yimo.sys.domain;

import java.io.Serializable;

import lombok.Data;



/**
 * 角色与菜单对应关系 表sys_role_menu
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年06月26日 17:06:53
 */
 @Data
public class RoleMenuDO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//角色ID
	private Long roleId;
	//菜单ID
	private Long menuId;
}
