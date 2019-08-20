package cn.tayle.sys.domain;

import org.apache.shiro.session.mgt.SimpleSession;
/**
 * 对simpleSession进行扩展便于记录客户端相关信息
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年3月18日 下午5:22:55
 */
public class OnlineSession extends SimpleSession {

	/**   
	* @Fields serialVersionUID 
	*/
	private static final long serialVersionUID = 7847268259643601963L;
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
	// 是否有变化需要更新
	private boolean isChange = false;

	public boolean isChange() {
		return isChange;
	}
	public void setChange(boolean isChange) {
		this.isChange = isChange;
	}
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
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getLoginLocation() {
		return loginLocation;
	}
	public void setLoginLocation(String loginLocation) {
		this.loginLocation = loginLocation;
	}
	public String getBrowser() {
		return browser;
	}
	public void setBrowser(String browser) {
		this.browser = browser;
	}
	public String getOs() {
		return os;
	}
	public void setOs(String os) {
		this.os = os;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}
	@Override
	public String toString() {
		return "OnlineSession [id=" + getId() + ", userId=" + userId + ", userName=" + userName + ", deptId=" + deptId + ", deptName=" + deptName + ", ip=" + ip
		        + ", loginLocation=" + loginLocation + ", browser=" + browser + ", os=" + os + ", status=" + status + ", beginTime=" + beginTime + ", isChange="
		        + isChange + "]";
	}

}
