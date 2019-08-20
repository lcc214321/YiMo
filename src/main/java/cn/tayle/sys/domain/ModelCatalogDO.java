package cn.tayle.sys.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import cn.tayle.common.annotation.Excel;
import cn.tayle.common.domain.BaseDO;


/**
 * 系统模型目录  - sys_model_catalog
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年06月08日 13:27:18
 */
 @Data
 @EqualsAndHashCode(callSuper = false)
public class ModelCatalogDO extends BaseDO {
	private static final long serialVersionUID = 1L;
	
	//
	@Excel(name = "", orderNum = 1)
	private Long id;
		//模板编号
	@Excel(name = "模板编号", orderNum = 2)
	private String modelNo;
		//模板名称
	@Excel(name = "模板名称", orderNum = 3)
	private String modelName;
		//模板描述
	@Excel(name = "模板描述", orderNum = 4)
	private String modelDescribe;
		//模型类型List Or Info
	@Excel(name = "模型类型List Or Info", orderNum = 5)
	private String modelType;
		//数据来源
	@Excel(name = "数据来源", orderNum = 6)
	private String url;
		//模型版本
	@Excel(name = "模型版本", orderNum = 7)
	private String modelVersion;
		//备注
	@Excel(name = "备注", orderNum = 8)
	private String remark;
		//创建用户id
	@Excel(name = "创建用户id", orderNum = 9)
	private Long createUserId;
		//创建时间
	@Excel(name = "创建时间", orderNum = 10)
	private String createTime;
		//更新时间
	@Excel(name = "更新时间", orderNum = 11)
	private String updateTime;
		//状态
	@Excel(name = "状态", orderNum = 12)
	private String status;
	}
