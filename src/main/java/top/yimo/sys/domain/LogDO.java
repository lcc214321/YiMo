package top.yimo.sys.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import top.yimo.common.domain.BaseDo;


/**
 * 系统日志 表sys_log
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年03月11日 10:54:37
 */
 @Data
 @EqualsAndHashCode(callSuper = false)
public class LogDO extends BaseDo {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//用户id
	private Long userId;
	//用户名
	private String userName;
	//用户操作类型
	private String operationType;
	//响应时间
	private Long time;
	//请求方法
	private String method;
	//请求参数
	private String params;
	//IP地址
	private String ip;
	//创建时间
	private String createTime;
	//操作url
	private String url;
	//日志描述
	private String describe;
	//标题
	private String title;
}
