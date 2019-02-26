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
import top.yimo.sys.domain.DeptDO;
import top.yimo.sys.domain.RoleDO;
import top.yimo.sys.domain.UserDO;
import top.yimo.sys.service.DeptService;
import top.yimo.sys.service.RoleService;
import top.yimo.sys.service.UserService;

/**
 * 用户管理
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年41月16日 17:41:03
 */

@Controller
@RequestMapping("/sys/user")
public class UserController extends BaseController {
	private String prefix = "/sys/user";
	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;
	
	@Autowired
	private DeptService deptService;
	
	@GetMapping()
	@RequiresPermissions("sys:user:user")
	public String User() {
		return prefix + "/user";
	}

	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("sys:user:user")
	@Log(describe = "获取用户列表", title = "/sys/user", operatorType = OperatorType.QUERY)
	public PageVo listByPage(@RequestParam Map<String, Object> params) {
		List<UserDO> userList = userService.listByPage(params);
		int total = userService.count(params);
		return getPageData(userList, total);
	}

	@GetMapping("/add")
	@RequiresPermissions("sys:user:add")
	public String add() {
		return prefix + "/add";
	}

	@GetMapping("/edit/{userId}")
	@RequiresPermissions("sys:user:edit")
	public String edit(@PathVariable("userId") Long userId, Model model) {
		UserDO user = userService.get(userId);
		model.addAttribute("user", user);
		//加载角色信息
		List<RoleDO> roles = roleService.getRolesByUserId(userId);
		model.addAttribute("roles", roles);
		//加载部门信息
		DeptDO dept = deptService.get(user.getDeptId());
		model.addAttribute("dept", dept);
		return prefix + "/edit";
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("sys:user:add")
	public ResponseVo save(UserDO user) {

		if (userService.save(user) > 0) {
			return ResponseVo.ok("保存成功");
		}
		return ResponseVo.fail();
	}
	/**
	 * 修改
	 */
	@ResponseBody
	@PutMapping("/update")
	@RequiresPermissions("sys:user:edit")
	public ResponseVo update(UserDO user) {
		if (userService.update(user) > 0) {
			return ResponseVo.ok("更新成功");
		}
		return ResponseVo.fail();
	}

	/**
	 * 删除
	 */
	@DeleteMapping("/remove")
	@ResponseBody
	@RequiresPermissions("sys:user:remove")
	public ResponseVo remove(Long userId) {
		if (userService.remove(userId) > 0) {
			return ResponseVo.ok("删除成功");
		}
		return ResponseVo.fail();
	}

	/**
	 * 批量删除
	 */
	@DeleteMapping("/batchRemove")
	@ResponseBody
	@RequiresPermissions("sys:user:batchRemove")
	public ResponseVo remove(@RequestParam("ids[]") Long[] userIds) {
		userService.batchRemove(userIds);
		return ResponseVo.ok("删除成功");
	}

	/**
	 * 重置为默认密码
	 */
	@RequiresPermissions("sys:user:resetPwd")
	@PutMapping("/resetPwd/{id}")
	@Log(describe = "提交重置用户密码", title = "/sys/user", operatorType = OperatorType.resetPwd)
	@ResponseBody
	public ResponseVo resetPwd(@PathVariable("id") Long userId) {
		try {
			userService.resetPwd(userId);
			return ResponseVo.ok("密码重置成功");
		} catch (Exception e) {
			return ResponseVo.fail(-1, e.getMessage());
		}

	}
}
