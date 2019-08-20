package cn.tayle.sys.domain;

import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import cn.tayle.common.annotation.Excel;
import cn.tayle.common.domain.BaseDO;

/**
 * 角色 - sys_role
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年05月28日 22:08:56
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class RoleDO extends BaseDO {
	private static final long serialVersionUID = 1L;

	//
	private Long roleId;
	// 角色名称
	@Excel(name = "角色名称", orderNum = 2)
	private String roleName;
	// 角色标识
	@Excel(name = "角色标识", orderNum = 3)
	private String roleSign;
	// 备注
	@Excel(name = "备注", orderNum = 4)
	private String remark;
	// 创建用户id
	@Excel(name = "创建用户id", orderNum = 5)
	private Long createUserId;
	// 创建时间
	@Excel(name = "创建时间", orderNum = 6)
	private String createTime;
	// 更新时间
	@Excel(name = "更新时间", orderNum = 7)
	private String updateTime;

	// 角色是否有效
	@Excel(name = "状态", convertExp = "Status", orderNum = 3)
	private String status;

	// 角色拥有的菜单
	private List<Long> menuIds;
	// 标识用户是否含有该角色
	private boolean hasRole = false;
}
