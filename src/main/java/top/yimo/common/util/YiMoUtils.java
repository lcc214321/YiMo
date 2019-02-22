package top.yimo.common.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

import top.yimo.common.constant.WebConstant;
import top.yimo.common.model.vo.TreeVo;

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
		String newPassword = new SimpleHash(WebConstant.ALGORITHM_NAME, pswd, ByteSource.Util.bytes(WebConstant.SALT), WebConstant.HASH_ITERATIONS).toHex();
		return newPassword;
	}

	/**
	 * 
	 * @param username
	 *            用户名
	 * @param pswd
	 *            明文密码
	 * @return String
	 */
	public static String encrypt(String username, String pswd) {
		String newPassword = new SimpleHash(WebConstant.ALGORITHM_NAME, pswd, ByteSource.Util.bytes(username + WebConstant.SALT), WebConstant.HASH_ITERATIONS)
		        .toHex();
		return newPassword;
	}
}
