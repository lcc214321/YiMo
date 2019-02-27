package top.yimo.sys.domain;

import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import top.yimo.common.domain.BaseDo;

/**
 * 表sys_user
 * 
 * @author imTayle
 * @date 2019年41月16日 17:41:03
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class UserDO extends BaseDo {
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

	// 用户所拥有的角色
	private List<Long> roleIds;
}
