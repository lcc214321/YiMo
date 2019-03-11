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

import top.yimo.common.controller.BaseController;
import top.yimo.common.model.vo.PageVo;
import top.yimo.common.model.vo.ResponseVo;
import top.yimo.sys.domain.LogDO;
import top.yimo.sys.service.LogService;

/**
 * 系统日志 
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年03月11日 10:54:37
 */

@Controller
@RequestMapping("/sys/log")
public class LogController extends BaseController {
	private String prefix = "/sys/log";
	@Autowired
	private LogService logService;

	@GetMapping()
	@RequiresPermissions("sys:log:log")
	public String Log() {
		return prefix + "/log";
	}

	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("sys:log:log")
	public PageVo listByPage(@RequestParam Map<String, Object> params) {
		List<LogDO> logList = logService.listByPage(params);
		int total = logService.count(params);
		return getPageData(logList, total);
	}

	@GetMapping("/add")
	@RequiresPermissions("sys:log:add")
	public String add() {
		return prefix + "/add";
	}

	@GetMapping("/edit/{id}")
	@RequiresPermissions("sys:log:edit")
	public String edit(@PathVariable("id") Long id, Model model) {
		LogDO log = logService.get(id);
		model.addAttribute("log", log);
		return prefix + "/edit";
	}

	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("sys:log:add")
	public ResponseVo save(LogDO log) {
		beforeSave(log);
		if (logService.save(log) > 0) {
			return ResponseVo.ok("保存成功");
		}
		return ResponseVo.fail();
	}

	@ResponseBody
	@PutMapping("/update")
	@RequiresPermissions("sys:log:edit")
	public ResponseVo update(LogDO log) {
		beforeUpdate(log);
		if (logService.update(log) > 0) {
			return ResponseVo.ok("更新成功");
		}
		return ResponseVo.fail();
	}

	/**
	 * 删除
	 */
	@DeleteMapping("/remove")
	@ResponseBody
	@RequiresPermissions("sys:log:remove")
	public ResponseVo remove(Long id) {
		if (logService.remove(id) > 0) {
			return ResponseVo.ok("删除成功");
		}
		return ResponseVo.fail();
	}

	/**
	 * 批量删除
	 */
	@DeleteMapping("/batchRemove")
	@ResponseBody
	@RequiresPermissions("sys:log:batchRemove")
	public ResponseVo remove(@RequestParam("ids[]") Long[] ids) {
		if (logService.batchRemove(ids) > 0) {
			return ResponseVo.ok("删除成功");
		}
		return ResponseVo.fail();
	}
}
