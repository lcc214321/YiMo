package top.yimo.common.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import top.yimo.common.annotation.Log;
import top.yimo.common.enums.OperatorType;
import top.yimo.common.model.vo.ResponseVo;
import top.yimo.common.model.vo.TreeVo;
import top.yimo.common.util.ShiroUtils;
import top.yimo.sys.domain.MenuDO;
import top.yimo.sys.domain.UserDO;
import top.yimo.sys.service.MenuService;
import top.yimo.sys.service.UserOnlineService;

/**
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年1月14日 上午11:10:19
 */
@Component
@RequestMapping("/")
public class AuthController {
	@Value("${yimo.loginHtml}")
	private String login;

	@Autowired
	MenuService menuService;
	@Autowired
	UserOnlineService userOnlineService;

	@GetMapping(value = "/login")
	public String login() {
		return login;
	}

	@PostMapping(value = "/login")
	@ResponseBody
	@Log(title = "用户认证", describe = "认证操作", isSaveArgs = false, operatorType = OperatorType.LOGIN)
	public ResponseVo doLogin(@RequestParam String username, @RequestParam String password,
			@RequestParam(required = false) boolean rememberme, HttpServletRequest request,
			HttpServletResponse response) {
		UsernamePasswordToken token = new UsernamePasswordToken(username, password, false);
		Subject currentUser = SecurityUtils.getSubject();
		try {
			currentUser.login(token);
		} catch (IncorrectCredentialsException e) {
			return ResponseVo.fail("用户或密码错误");
		} catch (UnknownAccountException | LockedAccountException e) {
			return ResponseVo.fail(e.getMessage());
		} catch (AuthenticationException e) {
			return ResponseVo.fail("登陆失败");
		}
		return ResponseVo.ok();
	}

	@RequestMapping(value = { "", "/index" })
	public String index(Model model) {
		// 加载登陆用户信息
		UserDO currUser = ShiroUtils.getSysUser();
		if (currUser == null) {
			return login;
		}
		List<TreeVo<MenuDO>> menus = menuService.getMenusByUser(currUser.getUserId());
		model.addAttribute("menus", menus);
		model.addAttribute("user", currUser);
		return "index";
	}

	@GetMapping(value = "/logout")
	@Log(title = "用户认证", describe = "系统退出", operatorType = OperatorType.LOGOUT)
	public String logout() {
		// subject的实现类DelegatingSubject的logout方法，将本subject对象的session清空了
		SecurityUtils.getSubject().logout();
		return login;
	}

}
