package top.yimo.common.constant;

/**
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年1月9日 下午6:19:28
 */

public class WebConstant {
	public static final String AUTO_REOMVE_PRE = "true";

	/**
	 * 密码盐
	 */
	public static final String SALT = "yimo";

	/**
	 * //散列算法:这里使用MD5算法;
	 */
	public static final String ALGORITHM_NAME = "md5";

	/**
	 * hash迭代次数
	 */
	public static final int HASH_ITERATIONS = 2;

	/**
	 * 默认密码
	 */
	public static final String DEAFULT_PWD = "000000";

	/**
	 * 当前session
	 */
	public static final String ONLINE_SESSION = "online_session";

	/**
	 * 当前登录用户case
	 */
	public static final String ONLINE_CASE = "online_case";

	public static final String ONLINE_SESSION_OFF = "off_line";
	public static final String ONLINE_SESSION_ON = "on_line";

}
