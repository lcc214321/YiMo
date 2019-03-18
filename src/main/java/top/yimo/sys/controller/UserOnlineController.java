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
import top.yimo.common.controller.BaseController;
import top.yimo.common.enums.OperatorType;
import top.yimo.common.model.vo.PageVo;
import top.yimo.common.model.vo.ResponseVo;
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
	public PageVo listByPage(@RequestParam Map<String, Object> params) {
		List<UserOnlineDO> userOnlineList = userOnlineService.listByPage(params);
		int total = userOnlineService.count(params);
		return getPageData(userOnlineList, total);
	}

	/**
	 * 强制踢出
	 */
	@DeleteMapping("/kickout")
	@ResponseBody
	@RequiresPermissions("sys:userOnline:kickout")
	@Log(describe = "强制踢出", title = title, operatorType = OperatorType.FORCE)
	public ResponseVo kickout(String sessionid) {
		if (userOnlineService.kickout(sessionid) > 0) {
			return ResponseVo.ok("提出成功");
		}
		return ResponseVo.fail();
	}

}
