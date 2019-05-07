package top.yimo.sys.controller;

import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import top.yimo.common.annotation.Log;
import top.yimo.common.constant.WebConstant;
import top.yimo.common.controller.BaseController;
import top.yimo.common.enums.OperatorType;
import top.yimo.common.model.vo.BootstrapTablePageVo;
import top.yimo.common.model.vo.ResponseVo;
import top.yimo.common.util.ShiroUtils;
import top.yimo.sys.domain.UserOnlineDO;
import top.yimo.sys.service.UserOnlineService;

/**
 * 在线用户记录 
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年03月12日 10:04:16
 */

@Controller
@RequestMapping("/sys/userOnline")
public class UserOnlineController extends BaseController {
	private String prefix = "/sys/userOnline";
	private final static String title = "在线用户记录";
	@Autowired
	private UserOnlineService userOnlineService;

	@GetMapping()
	@RequiresPermissions("sys:userOnline:userOnline")
	public String UserOnline() {
		return prefix + "/userOnline";
	}

	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("sys:userOnline:userOnline")
	@Log(describe = "获取" + title, title = title, operatorType = OperatorType.QUERY)
	public BootstrapTablePageVo listByPage(@RequestParam Map<String, Object> params) {
		startPage(params);
		List<UserOnlineDO> userOnlineList = userOnlineService.listByPage(params);
		return getPageData(userOnlineList);
	}

	/**
	 * 强制踢出
	 */
	@DeleteMapping("/kickout")
	@ResponseBody
	@RequiresPermissions("sys:userOnline:kickout")
	@Log(describe = "强制踢出", title = title, operatorType = OperatorType.FORCE)
	public ResponseVo kickout(String sessionId) {
		UserOnlineDO userOnlineDO = userOnlineService.get(sessionId);
		if (userOnlineDO.getStatus().equals(WebConstant.ONLINE_SESSION_OFF)) {
			return ResponseVo.fail("该用户状态为离线，不允许踢出");
		}
		if (userOnlineDO.getUserId().equals(ShiroUtils.getUserId())) {
			return ResponseVo.fail("踢出用户为当前用户，不允许踢出");
		}
		if (userOnlineService.kickout(sessionId) > 0) {
			return ResponseVo.kickout("踢出成功");
		}
		return ResponseVo.fail();
	}

}
