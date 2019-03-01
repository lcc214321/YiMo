package top.yimo.sys.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
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
import top.yimo.common.model.vo.TreeVo;
import top.yimo.sys.domain.DeptDO;
import top.yimo.sys.service.DeptService;

/**
 * 部门管理
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年22月24日 17:22:00
 */

@Controller
@RequestMapping("/sys/dept")
public class DeptController extends BaseController {
	private String prefix = "/sys/dept";
	@Autowired
	private DeptService deptService;

	@GetMapping()
	@RequiresPermissions("sys:dept:dept")
	public String Dept() {
		return prefix + "/dept";
	}

	@ResponseBody
	@GetMapping("/listByPage")
	@RequiresPermissions("sys:dept:dept")
	@Log(describe = "获取部门管理 列表", title = "部门管理", operatorType = OperatorType.QUERY)
	public PageVo listByPage(@RequestParam Map<String, Object> params) {
		List<DeptDO> deptList = deptService.listByPage(params);
		int total = deptService.count(params);
		return getPageData(deptList, total);
	}

	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("sys:dept:dept")
	@Log(describe = "获取部门管理 列表", title = "部门管理", operatorType = OperatorType.QUERY)
	public List<DeptDO> list(@RequestParam Map<String, Object> params) {
		return deptService.list(params);
	}

	@GetMapping("/add/{deptId}")
	@RequiresPermissions("sys:dept:add")
	public String add(@PathVariable("deptId") Long deptId, Model model) {
		if (StringUtils.isBlank(deptId.toString())) {
			deptId = 1l;
		}
		model.addAttribute("pDeptId", deptId);
		model.addAttribute("pDeptName", deptService.get(deptId).getDeptName());
		model.addAttribute("dept", new DeptDO());
		return prefix + "/add";
	}

	@GetMapping("/edit/{deptId}")
	@RequiresPermissions("sys:dept:edit")
	public String edit(@PathVariable("deptId") Long deptId, Model model) {
		DeptDO dept = deptService.get(deptId);
		model.addAttribute("pDeptName", deptService.get(dept.getDeptId()).getDeptName());
		model.addAttribute("dept", dept);
		return prefix + "/edit";
	}

	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("sys:dept:add")
	public ResponseVo save(DeptDO dept) {
		beforeSave(dept);
		dept.setStatus("1");
		if (deptService.save(dept) > 0) {
			return ResponseVo.ok("保存成功");
		}
		return ResponseVo.fail();
	}

	@ResponseBody
	@PutMapping("/update")
	@RequiresPermissions("sys:dept:edit")
	public ResponseVo update(DeptDO dept) {
		beforeUpdate(dept);
		if (deptService.update(dept) > 0) {
			return ResponseVo.ok("更新成功");
		}
		return ResponseVo.fail();
	}

	/**
	 * 删除
	 */
	@DeleteMapping("/remove")
	@ResponseBody
	@RequiresPermissions("sys:dept:remove")
	public ResponseVo remove(Long deptId) {
		if (deptService.remove(deptId) > 0) {
			return ResponseVo.ok("删除成功");
		}
		return ResponseVo.fail();
	}

	/**
	 * 批量删除
	 */
	@DeleteMapping("/batchRemove")
	@ResponseBody
	@RequiresPermissions("sys:dept:batchRemove")
	public ResponseVo remove(@RequestParam("ids[]") Long[] deptIds) {
		if (deptService.batchRemove(deptIds) > 0) {
			return ResponseVo.ok("删除成功");
		}
		return ResponseVo.fail();
	}

	@GetMapping("/tree")
	@ResponseBody
	public TreeVo<DeptDO> tree() {
		return deptService.getTree();
	}

	@GetMapping("/treeView")
	String treeView() {
		return prefix + "/deptTree";
	}

}
