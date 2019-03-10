package top.yimo.common.domain;

import java.io.Serializable;

public class BaseDo implements Serializable {
	/**
	 * @Fields serialVersionUID
	 */
	private static final long serialVersionUID = -1495715633723805774L;
	// 创建用户id
	private Long createUserId;
	// 创建时间
	private String createTime;
	// 修改时间
	private String updateTime;

	public Long getCreateUserId() {
		return createUserId;
	}
	public void setCreateUserId(Long createUserId) {
		this.createUserId = createUserId;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

}
