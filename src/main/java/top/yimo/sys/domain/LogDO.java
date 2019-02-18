package top.yimo.sys.domain;

import java.io.Serializable;

import lombok.Data;



/**
 * 系统日志 表sys_log
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年22月24日 17:22:00
 */
 @Data
public class LogDO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//用户id
	private Long userId;
	//用户名
	private String userName;
	//用户操作
	private String operation;
	//响应时间
	private Integer time;
	//请求方法
	private String method;
	//请求参数
	private String params;
	//IP地址
	private String ip;
	//创建时间
	private String createTime;
}
