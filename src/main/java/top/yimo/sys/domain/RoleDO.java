package top.yimo.sys.domain;

import java.io.Serializable;
import java.util.List;

import lombok.Data;

/**
 * 角色 表sys_role
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年22月24日 17:22:00
 */
@Data
public class RoleDO implements Serializable {
	private static final long serialVersionUID = 1L;

	// 角色ID
	private Long roleId;
	// 角色名称
	private String roleName;
	// 角色标识
	private String roleSign;
	// 备注
	private String remark;
	// 创建用户id
	private Long createUserId;
	// 创建时间
	private String createTime;
	// 更新时间
	private String updateTime;
	// 标识用户是否含有该角色
	private boolean hasRole = false;
	// 角色是否有效
	private String status;

	// 角色拥有的菜单
	private List<Long> menuIds;

}
