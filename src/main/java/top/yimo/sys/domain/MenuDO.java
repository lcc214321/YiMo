package top.yimo.sys.domain;

import java.io.Serializable;

import lombok.Data;



/**
 * 菜单管理 表sys_menu
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年22月24日 17:22:00
 */
 @Data
public class MenuDO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long menuId;
	//父菜单ID，一级菜单为0
	private Long parentId;
	//菜单名称
	private String name;
	//菜单URL
	private String url;
	//授权(多个用逗号分隔，如：user:list,user:create)
	private String perms;
	//类型   0：目录   1：菜单   2：按钮
	private Integer type;
	//菜单图标
	private String icon;
	//排序号
	private Integer orderNo;
	//创建时间
	private String createTime;
	//修改时间
	private String updateTime;
}
