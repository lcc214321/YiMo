package top.yimo.sys.domain;

import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import top.yimo.common.annotation.Excel;
import top.yimo.common.domain.BaseDO;

/**
 * 角色 表sys_role
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年22月24日 17:22:00
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class RoleDO extends BaseDO {
	private static final long serialVersionUID = 1L;

	// 角色ID
	private Long roleId;
	// 角色名称
	@Excel(name = "角色名称", orderNum = 1)
	private String roleName;
	// 角色标识
	@Excel(name = "角色标识", orderNum = 2)
	private String roleSign;
	// 备注
	@Excel(name = "备注", orderNum = 3)
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
	@Excel(name = "状态", convertExp = "Status", orderNum = 3)
	private String status;

	// 角色拥有的菜单
	private List<Long> menuIds;

}
