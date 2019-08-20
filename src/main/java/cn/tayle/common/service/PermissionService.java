package cn.tayle.common.service;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Service;

/**
 * 用于JS调用判断是否有权限服务
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年2月25日 上午10:50:19
 */
@Service("permission")
public class PermissionService {
	public String hasPermi(String permission) {
		boolean permitted = SecurityUtils.getSubject().isPermitted(permission);
		return permitted ? "" : "hidden";
	}
}
