package cn.tayle.sys.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import cn.tayle.common.domain.BaseDO;

/**
 * 菜单管理 表sys_menu
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年22月24日 17:22:00
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class MenuDO extends BaseDO {
	private static final long serialVersionUID = 1L;

	//
	private Long menuId;
	// 父菜单ID，一级菜单为0
	private Long parentId;
	// 菜单名称
	private String name;
	// 菜单URL
	private String url;
	// 授权(多个用逗号分隔，如：user:list,user:create)
	private String perms;
	// 类型 0：目录 1：菜单 2：按钮 默认为目录
	private Integer type = 0;
	// 菜单图标
	private String icon;
	// 排序号
	private Integer orderNo;
	// 是否有效
	private String status;
}
