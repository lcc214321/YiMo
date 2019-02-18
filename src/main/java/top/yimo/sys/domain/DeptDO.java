package top.yimo.sys.domain;

import java.io.Serializable;

import lombok.Data;



/**
 * 部门管理 表sys_dept
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年22月24日 17:22:00
 */
 @Data
public class DeptDO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long deptId;
	//上级部门ID，一级部门为0
	private Long parentId;
	//部门名称
	private String deptName;
	//排序
	private Integer orderNum;
	//状态
	private String status;
}
