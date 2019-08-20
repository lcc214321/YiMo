package cn.tayle.sys.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import cn.tayle.common.annotation.Excel;
import cn.tayle.common.domain.BaseDO;

/**
 * 系统日志 - sys_log
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年05月28日 23:04:24
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class LogDO extends BaseDO {
	private static final long serialVersionUID = 1L;

	//
	private Long id;
	// 用户id
	@Excel(name = "用户id", orderNum = 2)
	private Long userId;
	// 用户名
	@Excel(name = "用户名", orderNum = 3)
	private String userName;
	// 用户操作类型
	@Excel(name = "用户操作类型", orderNum = 4)
	private String operationType;
	// 响应时间
	@Excel(name = "响应时间", orderNum = 5)
	private Long time;
	// 请求方法
	@Excel(name = "请求方法", orderNum = 6)
	private String method;
	// 请求参数
	@Excel(name = "请求参数", orderNum = 7)
	private String params;
	// IP地址
	@Excel(name = "IP地址", orderNum = 8)
	private String ip;
	// 创建时间
	@Excel(name = "创建时间", orderNum = 9)
	private String createTime;
	// 操作url
	@Excel(name = "操作url", orderNum = 10)
	private String url;
	// 日志描述
	@Excel(name = "日志描述", orderNum = 11)
	private String describe;
	// 标题
	@Excel(name = "标题", orderNum = 12)
	private String title;
}
