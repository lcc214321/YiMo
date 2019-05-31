package top.yimo.common.util;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

import top.yimo.common.constant.WebConstant;

/**
 * 工具类
 * 
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年1月18日 下午6:10:58
 */

public class YiMoUtils {

	/**
	 * 对明文密码加密 加盐
	 * 
	 * @param pswd
	 * @return
	 * @return String
	 */
	public static String encrypt(String pswd) {
		String newPassword = new SimpleHash(WebConstant.ALGORITHM_NAME, pswd, ByteSource.Util.bytes(WebConstant.SALT),
				WebConstant.HASH_ITERATIONS).toHex();
		return newPassword;
	}

	/**
	 * 
	 * @param username 用户名
	 * @param pswd     明文密码
	 * @return String
	 */
	public static String encrypt(String username, String pswd) {
		String newPassword = new SimpleHash(WebConstant.ALGORITHM_NAME, pswd,
				ByteSource.Util.bytes(username + WebConstant.SALT), WebConstant.HASH_ITERATIONS).toHex();
		return newPassword;
	}

//	public static void main(String[] args) {
//		System.out.println(encrypt("admin", "000000"));
//	}

	/**
	 * 获取IP地址
	 * 
	 * X-Forwarded-For：Squid 服务代理 Proxy-Client-IP：apache 服务代理
	 * WL-Proxy-Client-IP：weblogic 服务代理 HTTP_CLIENT_IP：有些代理服务器 X-Real-IP：nginx服务代理
	 */
	public static String getIpAddr(HttpServletRequest request) {

		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return "0:0:0:0:0:0:0:1".equals(ip) ? "127.0.0.1" : ip;
	}

	public static String getAddressByIp(String ip) {
		String address = "未知地址";
		return address;
	}
}
