package top.yimo.sys.controller;

import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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

	@GetMapping("/add")
	@RequiresPermissions("sys:userOnline:add")
	public String add() {
		return prefix + "/add";
	}

	@GetMapping("/edit/{sessionid}")
	@RequiresPermissions("sys:userOnline:edit")
	public String edit(@PathVariable("sessionid") String sessionid, Model model) {
		UserOnlineDO userOnline = userOnlineService.get(sessionid);
		model.addAttribute("userOnline", userOnline);
		return prefix + "/edit";
	}

	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("sys:userOnline:add")
	@Log(describe = "新增", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo save(UserOnlineDO userOnline) {
		if (userOnlineService.save(userOnline) > 0) {
			return ResponseVo.ok("保存成功");
		}
		return ResponseVo.fail();
	}

	@ResponseBody
	@PutMapping("/update")
	@RequiresPermissions("sys:userOnline:edit")
	@Log(describe = "更新", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo update(UserOnlineDO userOnline) {
		if (userOnlineService.update(userOnline) > 0) {
			return ResponseVo.ok("更新成功");
		}
		return ResponseVo.fail();
	}

	/**
	 * 删除
	 */
	@DeleteMapping("/remove")
	@ResponseBody
	@RequiresPermissions("sys:userOnline:remove")
	@Log(describe = "删除", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo remove(String sessionid) {
		if (userOnlineService.remove(sessionid) > 0) {
			return ResponseVo.ok("删除成功");
		}
		return ResponseVo.fail();
	}

	/**
	 * 批量删除
	 */
	@DeleteMapping("/batchRemove")
	@ResponseBody
	@RequiresPermissions("sys:userOnline:batchRemove")
	@Log(describe = "批量删除", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo remove(@RequestParam("ids[]") String[] sessionids) {
		if (userOnlineService.batchRemove(sessionids) > 0) {
			return ResponseVo.ok("删除成功");
		}
		return ResponseVo.fail();
	}
}
