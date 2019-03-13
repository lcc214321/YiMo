package top.yimo.common.shiro.realm;

import java.util.List;
import java.util.Set;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import top.yimo.common.constant.WebConstant;
import top.yimo.common.util.ShiroUtils;
import top.yimo.sys.domain.RoleDO;
import top.yimo.sys.domain.UserDO;
import top.yimo.sys.service.MenuService;
import top.yimo.sys.service.RoleService;
import top.yimo.sys.service.UserService;

/**
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年1月14日 下午6:00:48
 */

public class UserRealm extends AuthorizingRealm {

	@Autowired
	UserService userSerivce;
	@Autowired
	MenuService menuService;
	@Autowired
	RoleService roleService;
	/**
	 * 认证
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		// 获取用户的输入的账号与密码
		UsernamePasswordToken upToken = (UsernamePasswordToken) token;
		String username = upToken.getUsername();
		// 通过username从数据库中查找 User对象，
		UserDO user = userSerivce.findByUserName(username);
		// 账号不存在
		if (user == null) {
			throw new UnknownAccountException("账号不存在");
		}
		// 账号锁定
		if (0 == user.getStatus()) {
			throw new LockedAccountException("账号已被锁定,请联系管理员");
		}
		SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(user, // 用户名
		        user.getPassword(), // 密码
		        ByteSource.Util.bytes(user.getUserName() + WebConstant.SALT), // 密码加盐
		        getName() // realm name
		);
		return authenticationInfo;
	}
	/**
	 * 清理缓存权限
	 */
	public void clearCachedAuthorizationInfo() {
		this.clearCachedAuthorizationInfo(SecurityUtils.getSubject().getPrincipals());
	}

	/**
	 * 授权
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		Long userId = ShiroUtils.getUserId();// 获取当面登陆用户ID
		Set<String> perms = menuService.listPermsByUserId(userId);
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		List<RoleDO> roleIds = roleService.getRolesByUserId(userId);
		for (RoleDO role : roleIds) {
			if (role.getRoleSign().equalsIgnoreCase("superAdmin")) {
				perms.add("*:*:*");// 超级管理员 默认赋予所有权限
				break;
			}
		}
		info.setStringPermissions(perms);
		return info;
	}
}
