package top.yimo.sys.domain;

import java.util.List;

import top.yimo.common.annotation.Excel;
import top.yimo.common.annotation.Excel.Type;
import top.yimo.common.domain.BaseDO;

/**
 * 表sys_user
 * 
 * @author imTayle
 * @date 2019年41月16日 17:41:03
 */
public class UserDO extends BaseDO {

	/**
	 * @Fields serialVersionUID
	 */
	private static final long serialVersionUID = -8804501556325725950L;
	//
	private Long userId;
	// 用户名
	private String userName;
	// 昵称
	@Excel(name = "注: 姓名", orderNum = "0", type = Type.ALL)
	private String name;
	// 密码
	private String password;
	// 部门ID
	private Long deptId;
	// 部门Name
	private String deptName;
	// 邮箱
	@Excel(name = "邮箱", orderNum = "1", type = Type.ALL)
	private String email;
	// 手机号
	@Excel(name = "手机号", orderNum = "2")
	private String mobile;
	// 状态 0:禁用，1:正常
	@Excel(name = "状态", orderNum = "9", convertExp = "Status", prompt = "批注提示信息")
	private Integer status;

	// 性别
	@Excel(name = "性别", convertExp = "Sex", orderNum = "4")
	private Long sex;
	// 出身日期
	@Excel(name = "生日", orderNum = "5", dateFormat = "yyyy-MM-dd")
	private String birth;
	// 头像
	private Long picId;
	// 现居住地
	@Excel(name = "现居住地", orderNum = "6")
	private String address;
	// 爱好
	@Excel(name = "爱好", orderNum = "7")
	private String hobby;
	// 省份
	private String province;
	// 所在城市
	private String city;
	// 所在地区
	private String district;

	// 用户所拥有的角色
	private List<Long> roleIds;

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Long getDeptId() {
		return deptId;
	}

	public void setDeptId(Long deptId) {
		this.deptId = deptId;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Long getSex() {
		return sex;
	}

	public void setSex(Long sex) {
		this.sex = sex;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public Long getPicId() {
		return picId;
	}

	public void setPicId(Long picId) {
		this.picId = picId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public List<Long> getRoleIds() {
		return roleIds;
	}

	public void setRoleIds(List<Long> roleIds) {
		this.roleIds = roleIds;
	}

	@Override
	public String toString() {
		return "UserDO [userId=" + userId + ", userName=" + userName + ", name=" + name + ", password=" + password
				+ ", deptId=" + deptId + ", deptName=" + deptName + ", email=" + email + ", mobile=" + mobile
				+ ", status=" + status + ", sex=" + sex + ", birth=" + birth + ", picId=" + picId + ", address="
				+ address + ", hobby=" + hobby + ", province=" + province + ", city=" + city + ", district=" + district
				+ ", roleIds=" + roleIds + "]";
	}

}
