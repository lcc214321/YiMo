package cn.tayle.sys.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import cn.tayle.common.annotation.Excel;
import cn.tayle.common.domain.BaseDO;


/**
 * 系统模型库  - sys_model_libaray
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年06月08日 13:27:18
 */
 @Data
 @EqualsAndHashCode(callSuper = false)
public class ModelLibarayDO extends BaseDO {
	private static final long serialVersionUID = 1L;
	
	//
	@Excel(name = "", orderNum = 1)
	private Long id;
		//模板编号
	@Excel(name = "模板编号", orderNum = 2)
	private String modelNo;
		//编号
	@Excel(name = "编号", orderNum = 3)
	private String colIndex;
		//字段
	@Excel(name = "字段", orderNum = 4)
	private String colField;
		//列头
	@Excel(name = "列头", orderNum = 5)
	private String colTitle;
		//提示文本，支持HTML 属性
	@Excel(name = "提示文本，支持HTML 属性", orderNum = 6)
	private String colTollTip;
		//列头布局
	@Excel(name = "列头布局", orderNum = 7)
	private String colHalign;
		//数据布局
	@Excel(name = "数据布局", orderNum = 8)
	private String colAlign;
		//是否显示
	@Excel(name = "是否显示", orderNum = 9)
	private String colVisible;
		//数据的格式
	@Excel(name = "数据的格式", orderNum = 10)
	private String colFormatter;
		//是否更新
	@Excel(name = "是否更新", orderNum = 11)
	private String colUpdate;
		//是否排序
	@Excel(name = "是否排序", orderNum = 12)
	private String colSortable;
		//按钮组
	@Excel(name = "按钮组", orderNum = 13)
	private String colButton;
		//状态
	@Excel(name = "状态", orderNum = 14)
	private String status;
		//备注
	@Excel(name = "备注", orderNum = 15)
	private String remark;
		//创建用户id
	@Excel(name = "创建用户id", orderNum = 16)
	private Long createUserId;
		//创建时间
	@Excel(name = "创建时间", orderNum = 17)
	private String createTime;
		//更新时间
	@Excel(name = "更新时间", orderNum = 18)
	private String updateTime;
	}
