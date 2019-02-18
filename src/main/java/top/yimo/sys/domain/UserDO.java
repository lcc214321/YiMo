package top.yimo.sys.domain;

import java.io.Serializable;

import lombok.Data;

/**
 * 表sys_user
 * 
 * @author imTayle
 * @date 2019年41月16日 17:41:03
 */
@Data
public class UserDO implements Serializable {
	private static final long serialVersionUID = 1L;

	//
	private Long userId;
	// 用户名
	private String userName;
	// 昵称
	private String name;
	// 密码
	private String password;
	// 部门ID
	private Long deptId;
	// 邮箱
	private String email;
	// 手机号
	private String mobile;
	// 状态 0:禁用，1:正常
	private Integer status;
	// 创建用户id
	private Long createUserId;
	// 创建时间
	private String createTime;
	// 修改时间
	private String updateTime;
	// 性别
	private Long sex;
	// 出身日期
	private String birth;
	//
	private Long picId;
	// 现居住地
	private String address;
	// 爱好
	private String hobby;
	// 省份
	private String province;
	// 所在城市
	private String city;
	// 所在地区
	private String district;
}
