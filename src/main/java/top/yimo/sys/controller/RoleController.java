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

import lombok.extern.slf4j.Slf4j;
import top.yimo.common.annotation.Log;
import top.yimo.common.controller.BaseController;
import top.yimo.common.enums.OperatorType;
import top.yimo.common.model.vo.BootstrapTablePageVo;
import top.yimo.common.model.vo.ResponseVo;
import top.yimo.common.util.excel.ExcelUtil;
import top.yimo.sys.domain.RoleDO;
import top.yimo.sys.service.RoleService;

/**
 * 角色
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年22月24日 17:22:00
 */
@Slf4j
@Controller
@RequestMapping("/sys/role")
public class RoleController extends BaseController {
	private String prefix = "/sys/role";
	@Autowired
	private RoleService roleService;

	@GetMapping()
	@RequiresPermissions("sys:role:role")
	public String Role() {
		return prefix + "/role";
	}

	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("sys:role:role")
	@Log(describe = "获取角色 列表", title = "角色", operatorType = OperatorType.QUERY)
	public BootstrapTablePageVo listByPage(@RequestParam Map<String, Object> params) {
		log.info("参数信息：{}", params.toString());
		startPage(params);
		List<RoleDO> roleList = roleService.listByPage(params);
		return getPageData(roleList);
	}

	@GetMapping("/add")
	@RequiresPermissions("sys:role:add")
	public String add() {
		return prefix + "/add";
	}

	@GetMapping("/edit/{roleId}")
	@RequiresPermissions("sys:role:edit")
	public String edit(@PathVariable("roleId") Long roleId, Model model) {
		RoleDO role = roleService.get(roleId);
		model.addAttribute("role", role);
		return prefix + "/edit";
	}

	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("sys:role:add")
	public ResponseVo save(RoleDO role) {
		beforeSave(role);
		role.setStatus("1");
		if (roleService.save(role) > 0) {
			return ResponseVo.ok("保存成功");
		}
		return ResponseVo.fail();
	}

	@ResponseBody
	@PutMapping("/update")
	@RequiresPermissions("sys:role:edit")
	public ResponseVo update(RoleDO role) {
		beforeUpdate(role);
		if (roleService.update(role) > 0) {
			return ResponseVo.ok("更新成功");
		}
		return ResponseVo.fail();
	}

	/**
	 * 删除
	 */
	@DeleteMapping("/remove/{id}")
	@ResponseBody
	@RequiresPermissions("sys:role:remove")
	public ResponseVo remove(@PathVariable("id") Long roleId) {
		if (roleService.remove(roleId) > 0) {
			return ResponseVo.ok("删除成功");
		}
		return ResponseVo.fail();
	}

	/**
	 * 批量删除
	 */
	@DeleteMapping("/batchRemove")
	@ResponseBody
	@RequiresPermissions("sys:role:batchRemove")
	public ResponseVo batchRemove(@RequestParam("ids[]") Long[] roleIds) {
		if (roleService.batchRemove(roleIds) > 0) {
			return ResponseVo.ok("删除成功");
		}
		return ResponseVo.fail();
	}

	/**
	 * 导出所有有效的用户信息
	 */
	@PostMapping("/exportData")
	@ResponseBody
	public ResponseVo exportData(RoleDO role) {
		try {
			List<RoleDO> exportData = roleService.exportData(role);
			ExcelUtil<RoleDO> excel = new ExcelUtil<RoleDO>(RoleDO.class);
			return excel.exportExcel(exportData, "角色数据");
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseVo.fail(-1, e.getMessage());
		}
	}
}
