package cn.tayle.common.util;

import java.util.regex.Pattern;

/**
 * 
 * @author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2018-12-18 05:17:34
 */
public final class VerifyUtils {

	/**
	 * 验证Email
	 * 
	 * @param email email地址，格式：imTayle@126.com，zhangsan@xxx.com.cn，xxx代表邮件服务器
	 * @return 验证成功返回true，验证失败返回false
	 */
	public static boolean isEmail(String email) {
		String regex = "\\w+@\\w+\\.[a-z]+(\\.[a-z]+)?";
		return Pattern.matches(regex, email);
	}

	/**
	 * 验证身份证号码
	 * 
	 * @param idCard 居民身份证号码15位或18位，最后一位可能是数字或字符
	 * @return 验证成功返回true，验证失败返回false
	 */
	public static boolean isIdCard(String idCard) {
		// TODO 后续补充详细校验
		String regex = "[1-9]\\d{13,16}[a-zA-Z0-9]{1}";
		return Pattern.matches(regex, idCard);
	}

	public static boolean isImage(String suffix) {
		if (null != suffix && !"".equals(suffix)) {
			String regex = "(.*?)(?i)(jpg|jpeg|png|gif|bmp|webp)";
			return Pattern.matches(regex, suffix);
		}
		return false;
	}

	/**
	 * 验证手机号码
	 * 
	 * @param mobile
	 * @return 验证成功返回true，验证失败返回false
	 */
	public static boolean isMobile(String mobile) {
		String regex = "(\\+\\d+)?1[34578]\\d{9}$";
		return Pattern.matches(regex, mobile);
	}

	/**
	 * 验证固定电话号码
	 * 
	 * @param phone 电话号码，格式：国家（地区）电话代码 + 区号（城市代码） + 电话号码，如：+8607550000123
	 * @return 验证成功返回true，验证失败返回false
	 */
	public static boolean isPhone(String phone) {
		String regex = "(\\+\\d+)?(\\d{3,4}\\-?)?\\d{7,8}$";
		return Pattern.matches(regex, phone);
	}

	/**
	 * 验证整数（正整数和负整数)
	 * 
	 * @param digit
	 * @return 验证成功返回true，验证失败返回false
	 */
	public static boolean isDigit(String digit) {
		String regex = "\\-?[1-9]\\d+";
		return Pattern.matches(regex, digit);
	}

	/**
	 * 验证整数和浮点数（正负整数和正负浮点数）
	 * 
	 * @param decimals
	 * @return 验证成功返回true，验证失败返回false
	 */
	public static boolean isDecimals(String decimals) {
		String regex = "\\-?[1-9]\\d+(\\.\\d+)?";
		return Pattern.matches(regex, decimals);
	}

	/**
	 * 验证空白字符
	 * 
	 * @param blankSpace 空白字符，包括：空格、\t、\n、\r、\f、\x0B
	 * @return 验证成功返回true，验证失败返回false
	 */
	public static boolean isBlankSpace(String blankSpace) {
		String regex = "\\s+";
		return Pattern.matches(regex, blankSpace);
	}

	/**
	 * 验证中文
	 * 
	 * @param chinese 中文字符
	 * @return 验证成功返回true，验证失败返回false
	 */
	public static boolean isChinese(String chinese) {
		String regex = "^[\u4E00-\u9FA5]+$";
		return Pattern.matches(regex, chinese);
	}

	/**
	 * 验证中文字母数字空格
	 * 
	 * @param chinese 中文字符
	 * @return 验证成功返回true，验证失败返回false
	 */
	public static boolean isRealName(String chinese) {
		String regex = "^[A-Za-z0-9\\s\u4E00-\u9FA5]+$";
		return Pattern.matches(regex, chinese);
	}

	/**
	 * 检测是否是数字
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isNumber(String str) {
		String regex = "^[1-9]\\d*$";
		return Pattern.matches(regex, str);
	}

	/**
	 * 验证学生学号
	 * 
	 * @param num
	 * @return
	 */
	public static boolean isStudentNum(String num) {
		String regex = "^[A-Za-z0-9-_]+$";
		return Pattern.matches(regex, num);
	}

	/**
	 * 验证生日（年月日)
	 * 
	 * @param birthday 日期，格式：1992-09-03，或1992.09.03
	 * @return 验证成功返回true，验证失败返回false
	 */
	public static boolean isBirthday(String birthday) {
		String regex = "^(\\d{4})-(\\d{2})-(\\d{2})$";
		return Pattern.matches(regex, birthday);
	}

	/**
	 * 验证URL地址
	 * 
	 * @param url 格式：https://gitee.com/Tayle/YiMo
	 * @return 验证成功返回true，验证失败返回false
	 */
	public static boolean isURL(String url) {
		String regex = "(https?://(w{3}\\.)?)?\\w+\\.\\w+(\\.[a-zA-Z]+)*(:\\d{1,5})?(/\\w*)*(\\??(.+=.*)?(&.+=.*)?)?";
		return Pattern.matches(regex, url);
	}

	/**
	 * 匹配中国邮政编码
	 * 
	 * @param postcode 邮政编码
	 * @return 验证成功返回true，验证失败返回false
	 */
	public static boolean isPostcode(String postcode) {
		String regex = "[1-9]\\d{5}";
		return Pattern.matches(regex, postcode);
	}

	/**
	 * 匹配IP地址(格式，如：192.168.1.1 或 127.0.0.1，没有匹配IP段的大小)
	 * 
	 * @param ipAddress IPv4标准地址
	 * @return 验证成功返回true，验证失败返回false
	 */
	public static boolean isIpAddress(String ipAddress) {
		String regex = "[1-9](\\d{1,2})?\\.(0|([1-9](\\d{1,2})?))\\.(0|([1-9](\\d{1,2})?))\\.(0|([1-9](\\d{1,2})?))";
		return Pattern.matches(regex, ipAddress);
	}
}