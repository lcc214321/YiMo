package top.yimo.common.util;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.Subject;

import com.alibaba.fastjson.JSONObject;

import top.yimo.sys.domain.UserDO;

/**
 * Shiro 工具类 用于获取登陆用户信息
 * 
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年1月16日 下午5:06:55
 */

public class ShiroUtils {

	public static Subject getSubject() {
		return SecurityUtils.getSubject();
	}

	public static Session getSession() {
		return SecurityUtils.getSubject().getSession();
	}

	public static void logout() {
		getSubject().logout();
	}

	public static UserDO getCurrentUser() {
		UserDO user = null;
		Object obj = getSubject().getPrincipal();
		if (obj != null) {
			JSONObject json = (JSONObject) JSONObject.toJSON(obj);
			user = json.toJavaObject(UserDO.class);
		}
		return user;
	}

	public static Long getUserId() {
		return getCurrentUser().getUserId().longValue();
	}

	public static String getUserName() {
		return getCurrentUser().getName();
	}

	public static String getIp() {
		return getSubject().getSession().getHost();
	}

	public static String getSessionId() {
		return String.valueOf(getSubject().getSession().getId());
	}

	public static void updateUser(UserDO user) {
		Subject subject = getSubject();
		PrincipalCollection principalCollection = subject.getPrincipals();
		String realmName = principalCollection.getRealmNames().iterator().next();
		PrincipalCollection newPrincipalCollection = new SimplePrincipalCollection(user, realmName);
		// 重新加载Principal
		subject.runAs(newPrincipalCollection);
	}
}
