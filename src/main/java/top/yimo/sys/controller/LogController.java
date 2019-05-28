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

import lombok.extern.slf4j.Slf4j;
import top.yimo.common.annotation.Log;
import top.yimo.common.controller.BaseController;
import top.yimo.common.enums.OperatorType;
import top.yimo.common.model.vo.BootstrapTablePageVo;
import top.yimo.common.model.vo.ResponseVo;
import top.yimo.common.util.excel.ExcelUtil;
import top.yimo.sys.domain.LogDO;
import top.yimo.sys.service.LogService;

/**
 * 系统日志
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年05月28日 23:04:24
 */
@Slf4j
@Controller
@RequestMapping("/sys/log")
public class LogController extends BaseController {
	private String prefix = "/sys/log";
	private final static String title = "系统日志";
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
	@Log(describe = "获取" + title, title = title, operatorType = OperatorType.QUERY)
	public BootstrapTablePageVo listByPage(@RequestParam Map<String, Object> params) {
		startPage(params);
		List<LogDO> logList = logService.listByPage(params);
		return getPageData(logList);
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
	@Log(describe = "新增", title = title, operatorType = OperatorType.DELETE)
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
	@Log(describe = "更新", title = title, operatorType = OperatorType.DELETE)
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
	@DeleteMapping("/remove/{id}")
	@ResponseBody
	@RequiresPermissions("sys:log:remove")
	@Log(describe = "删除", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo remove(@PathVariable("id") Long id) {
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
	@Log(describe = "批量删除", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo batchRemove(@RequestParam("ids[]") Long[] ids) {
		if (logService.batchRemove(ids) > 0) {
			return ResponseVo.ok("删除成功");
		}
		return ResponseVo.fail();
	}

	/**
	 * 导出数据
	 */
	@PostMapping("/exportData")
	@ResponseBody
	@RequiresPermissions("sys:log:export")
	public ResponseVo exportData(LogDO log) {
		try {
			List<LogDO> exportData = logService.exportData(log);
			ExcelUtil<LogDO> excel = new ExcelUtil<LogDO>(LogDO.class);
			return excel.exportExcel(exportData, "系统日志数据");
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
	@RequiresPermissions("sys:log:edit")
	public ResponseVo importTemplate() {
		try {
			ExcelUtil<LogDO> excel = new ExcelUtil<LogDO>(LogDO.class);
			return excel.importTemplateExcel("系统日志数据导入模板");
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
	@RequiresPermissions("sys:log:edit")
	public ResponseVo importData(MultipartFile file, boolean isCover) {
		ExcelUtil<LogDO> util = new ExcelUtil<LogDO>(LogDO.class);
		try {
			List<LogDO> logList = util.importExcel(file.getInputStream());
			String message = logService.importData(logList, isCover);
			return ResponseVo.ok(message);
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseVo.fail(-1, e.getMessage());
		}
	}
}
