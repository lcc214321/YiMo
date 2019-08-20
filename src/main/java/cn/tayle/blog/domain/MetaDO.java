package cn.tayle.blog.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import cn.tayle.common.annotation.Excel;
import cn.tayle.common.domain.BaseDO;


/**
 * 项目  - b_meta
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年06月20日 15:56:27
 */
 @Data
 @EqualsAndHashCode(callSuper = false)
public class MetaDO extends BaseDO {
	private static final long serialVersionUID = 1L;
	
	//项目主键
	@Excel(name = "项目主键", orderNum = 1)
	private Integer mid;
		//名称
	@Excel(name = "名称", orderNum = 2)
	private String name;
		//项目缩略名
	@Excel(name = "项目缩略名", orderNum = 3)
	private String slug;
		//项目类型
	@Excel(name = "项目类型", orderNum = 4)
	private String type;
		//选项描述
	@Excel(name = "选项描述", orderNum = 5)
	private String description;
		//项目排序
	@Excel(name = "项目排序", orderNum = 6)
	private Integer sort;
		//
	@Excel(name = "", orderNum = 7)
	private Integer parent;
	}
