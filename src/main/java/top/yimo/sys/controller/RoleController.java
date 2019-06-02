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
import org.springframework.web.multipart.MultipartFile;

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
 * @date 2019年05月28日 22:08:56
 */
@Controller
@RequestMapping("/sys/role")
public class RoleController extends BaseController {
	private String prefix = "sys/role";
	private final static String title = "角色";
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
	@Log(describe = "获取" + title, title = title, operatorType = OperatorType.QUERY)
	public BootstrapTablePageVo listByPage(@RequestParam Map<String, Object> params) {
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
	@Log(describe = "新增", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo save(RoleDO role) {
		beforeSave(role);
		if (roleService.save(role) > 0) {
			return ResponseVo.ok("保存成功");
		}
		return ResponseVo.fail();
	}

	@ResponseBody
	@PutMapping("/update")
	@RequiresPermissions("sys:role:edit")
	@Log(describe = "更新", title = title, operatorType = OperatorType.DELETE)
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
	@Log(describe = "删除", title = title, operatorType = OperatorType.DELETE)
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
	@Log(describe = "批量删除", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo batchRemove(@RequestParam("ids[]") Long[] roleIds) {
		if (roleService.batchRemove(roleIds) > 0) {
			return ResponseVo.ok("删除成功");
		}
		return ResponseVo.fail();
	}

	/**
	 * 导出数据
	 */
	@PostMapping("/exportData")
	@ResponseBody
	@RequiresPermissions("sys:role:export")
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

	/**
	 * 导出导入模板
	 */
	@GetMapping("/importTemplate")
	@ResponseBody
	@RequiresPermissions("sys:role:edit")
	public ResponseVo importTemplate() {
		try {
			ExcelUtil<RoleDO> excel = new ExcelUtil<RoleDO>(RoleDO.class);
			return excel.importTemplateExcel("角色数据导入模板");
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseVo.fail(-1, e.getMessage());
		}
	}

	/**
	 * 导入数据
	 */
	@PostMapping("/importData")
	@ResponseBody
	@RequiresPermissions("sys:role:edit")
	public ResponseVo importData(MultipartFile file, boolean isCover) {
		ExcelUtil<RoleDO> util = new ExcelUtil<RoleDO>(RoleDO.class);
		try {
			List<RoleDO> roleList = util.importExcel(file.getInputStream());
			String message = roleService.importData(roleList, isCover);
			return ResponseVo.ok(message);
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseVo.fail(-1, e.getMessage());
		}
	}
}
