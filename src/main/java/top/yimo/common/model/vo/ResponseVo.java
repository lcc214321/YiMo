package top.yimo.common.model.vo;

import java.io.PrintWriter;

import javax.servlet.ServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.Data;

/**
 * 默认ajax返回结果对象
 * 
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

	/**
	 * 返回一个异常消息
	 */
	public static ResponseVo exception(String msg) {
		return new ResponseVo(false, msg, 9999);
	}

	/**
	 * 返回一个默认成功消息
	 */
	public static ResponseVo ok() {
		return new ResponseVo(true, "操作成功", 0);
	}

	public static ResponseVo ok(int code) {
		return new ResponseVo(true, "操作成功", code);
	}

	public static ResponseVo ok(String msg) {
		return new ResponseVo(true, msg, 0);
	}

	public static ResponseVo ok(int code, String msg) {
		return new ResponseVo(true, msg, code);
	}

	public static ResponseVo fail() {
		return new ResponseVo(false, "操作失败", -1);
	}

	public static ResponseVo fail(int code, String msg) {
		return new ResponseVo(false, msg, code);
	}

	public static ResponseVo fail(int code) {
		return new ResponseVo(false, "操作失败", code);
	}

	/**
	 * 仅返回状态，code默认为0
	 */
	public static ResponseVo response(boolean isOK) {
		return new ResponseVo(isOK, "", 0);
	}

	/**
	 * 返回一个错误的消息
	 */
	public static ResponseVo fail(String msg) {
		return new ResponseVo(false, msg, -1);
	}

	/**
	 * 返回一个session超时的消息
	 */
	public static ResponseVo timeout(String msg) {
		return new ResponseVo(false, msg, 403);
	}

	public ResponseVo(boolean success, String msg, int code, long timestamp) {
		this.success = success;
		this.msg = msg;
		this.code = code;
		this.timestamp = timestamp;
	}

	public ResponseVo(boolean success, String msg, int code) {
		this.success = success;
		this.msg = msg;
		this.code = code;
		this.timestamp = System.currentTimeMillis() / 1000;
	}

	/**
	 * response输出json
	 */
	public static void out(ServletResponse response, ResponseVo result) {
		PrintWriter out = null;
		try {
			response.setCharacterEncoding("UTF-8");// 设置编码
			response.setContentType("application/json");// 设置返回类型
			out = response.getWriter();
			ObjectMapper objectMapper = new ObjectMapper();
			out.println(objectMapper.writeValueAsString(result));// 输出
		} catch (Exception e) {
		} finally {
			if (null != out) {
				out.flush();
				out.close();
			}
		}
	}
}