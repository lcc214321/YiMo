package cn.tayle.common.util;

import java.util.Random;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

import cn.tayle.common.constant.WebConstant;

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
	 * 匹配邮箱正则
	 */
	private static final Pattern VALID_EMAIL_ADDRESS_REGEX = Pattern
			.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);

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

	/**
	 * 获取随机整数 [MIN,MAX] <br>
	 * <b>eg:<br>
	 * </b> 取[10,100]随机整数 rand.nextInt(91)+10
	 * 
	 * <br>
	 * rand.nextInt(91) 表示为：[0, 91) -->[0,90]。
	 * 
	 * @param MAX 区间最大
	 * @param MIN 区间最小
	 */
	public static int getRandomNumber(int MIN, int MAX) {
		Random rand = new Random();
		return rand.nextInt(MAX - MIN + 1) + MIN;
	}

	public static void main(String[] args) {
		for (int i = 0; i < 20; i++) {
			System.out.println(getRandomNumber(0, 10));
		}
	}

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

	/**
	 * 通过IP获取物理地址
	 * 
	 */
	public static String getAddressByIp(String ip) {
		// TODO 后续添加接口查询
		String address = "未知地址";
		return address;
	}
}
