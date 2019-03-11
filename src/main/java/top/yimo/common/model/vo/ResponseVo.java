package top.yimo.common.model.vo;

import lombok.Data;

/**
 * 默认ajax返回结果对象
 * @author imTayle
 * @Email imTayle@126.com
 * @version 1.0 
 * @Time 2018-12-18 05:17:34
 */
@Data
public class ResponseVo {

	/**
	 * 请求是否成功
	 */
	private boolean success;

	/**
	 * 错误信息
	 */
	private String msg;

	/**
	 * 状态码
	 */
	private int code;

	/**
	 * 服务器响应时间
	 */
	private long timestamp;

	public static ResponseVo ok() {
		return new ResponseVo(true, "操作成功", 0, System.currentTimeMillis() / 1000);
	}

	public static ResponseVo ok(int code) {
		return new ResponseVo(true, "操作成功", code, System.currentTimeMillis() / 10000);
	}

	public static ResponseVo ok(String msg) {
		return new ResponseVo(true, msg, 0, System.currentTimeMillis() / 10000);
	}
	public static ResponseVo ok(int code, String msg) {
		return new ResponseVo(true, msg, code, System.currentTimeMillis() / 10000);
	}

	public static ResponseVo fail() {
		return new ResponseVo(false, "操作失败", -1, System.currentTimeMillis() / 1000);
	}

	public static ResponseVo fail(int code, String msg) {
		return new ResponseVo(false, msg, code, System.currentTimeMillis() / 1000);
	}

	public static ResponseVo fail(int code) {
		return new ResponseVo(false, "操作失败", code, System.currentTimeMillis() / 1000);
	}

	public static ResponseVo fail(String msg) {
		return new ResponseVo(false, msg, -1, System.currentTimeMillis() / 1000);
	}

	public static ResponseVo kickout(String msg) {
		return new ResponseVo(false, msg, 666, System.currentTimeMillis() / 1000);
	}
	public static ResponseVo timeout(String msg) {
		return new ResponseVo(false, msg, 999, System.currentTimeMillis() / 1000);
	}
	public ResponseVo(boolean success, String msg, int code, long timestamp) {
		this.success = success;
		this.msg = msg;
		this.code = code;
		this.timestamp = timestamp;
	}

}