package top.yimo.sys.domain;

import java.io.Serializable;

import lombok.Data;



/**
 * 用户与角色对应关系 表sys_user_role
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年59月25日 11:59:27
 */
 @Data
public class UserRoleDO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//用户ID
	private Long userId;
	//角色ID
	private Long roleId;
}
