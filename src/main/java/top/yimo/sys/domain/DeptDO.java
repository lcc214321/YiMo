package top.yimo.sys.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import top.yimo.common.domain.BaseDo;

/**
 * 部门管理 表sys_dept
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年22月24日 17:22:00
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class DeptDO extends BaseDo {
	private static final long serialVersionUID = 1L;

	// 部门ID
	private Long deptId;
	// 上级部门ID，一级部门为0
	private Long parentId;
	// 上级部门名称
	private String pDeptName;
	// 部门名称
	private String deptName;
	// 排序
	private Integer orderNo;
	// 状态
	private String status;
}
