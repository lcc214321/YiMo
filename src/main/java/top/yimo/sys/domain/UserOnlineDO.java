package top.yimo.sys.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import top.yimo.common.domain.BaseDO;

/**
 * 在线用户记录 sys_user_online 
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年03月12日 10:04:16
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class UserOnlineDO extends BaseDO {
	private static final long serialVersionUID = 1L;
	// 用户会话id
	private String sessionId;
	// 登录账号
	private Long userId;
	// 登录账号
	private String userName;
	// 部门名称
	private Long deptId;
	// 部门名称
	private String deptName;
	// 登录IP地址
	private String ip;
	// 登录地点
	private String loginLocation;
	// 浏览器类型
	private String browser;
	// 操作系统
	private String os;
	// 在线状态on_line在线off_line离线
	private String status;
	// session创建时间
	private String beginTime;
	// session最后访问时间
	private String endTime;
	// 超时时间，单位为分钟
	private Integer outTime;

	private OnlineSession session;
}
