package cn.tayle.sys.controller;

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

import cn.tayle.common.annotation.Log;
import cn.tayle.common.controller.BaseController;
import cn.tayle.common.enums.OperatorType;
import cn.tayle.common.model.vo.BootstrapTablePageVo;
import cn.tayle.common.model.vo.ResponseVo;
import cn.tayle.common.util.excel.ExcelUtil;
import cn.tayle.sys.domain.ModelCatalogDO;
import cn.tayle.sys.service.ModelCatalogService;

/**
 * 系统模型目录
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年06月08日 13:27:18
 */
@Controller
@RequestMapping("/sys/modelCatalog")
public class ModelCatalogController extends BaseController {
	private String prefix = "/sys/modelCatalog";
	private final static String title = "系统模型目录";
	@Autowired
	private ModelCatalogService modelCatalogService;

	@GetMapping()
	@RequiresPermissions("sys:modelCatalog:modelCatalog")
	public String ModelCatalog() {
		return prefix + "/modelCatalog";
	}

	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("sys:modelCatalog:modelCatalog")
	@Log(describe = "获取" + title, title = title, operatorType = OperatorType.QUERY)
	public BootstrapTablePageVo listByPage(@RequestParam Map<String, Object> params) {
		startPage(params);
		List<ModelCatalogDO> modelCatalogList = modelCatalogService.listByPage(params);
		return getPageData(modelCatalogList);
	}

	@GetMapping("/add")
	@RequiresPermissions("sys:modelCatalog:add")
	public String add() {
		return prefix + "/add";
	}

	@GetMapping("/edit/{id}")
	@RequiresPermissions("sys:modelCatalog:edit")
	public String edit(@PathVariable("id") Long id, Model model) {
		ModelCatalogDO modelCatalog = modelCatalogService.get(id);
		model.addAttribute("modelCatalog", modelCatalog);
		return prefix + "/edit";
	}

	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("sys:modelCatalog:add")
	@Log(describe = "新增", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo save(ModelCatalogDO modelCatalog) {
		beforeSave(modelCatalog);
		if (modelCatalogService.save(modelCatalog) > 0) {
			return ResponseVo.ok("保存成功");
		}
		return ResponseVo.fail();
	}

	@ResponseBody
	@PutMapping("/update")
	@RequiresPermissions("sys:modelCatalog:edit")
	@Log(describe = "更新", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo update(ModelCatalogDO modelCatalog) {
		beforeUpdate(modelCatalog);
		if (modelCatalogService.update(modelCatalog) > 0) {
			return ResponseVo.ok("更新成功");
		}
		return ResponseVo.fail();
	}

	/**
	 * 删除
	 */
	@DeleteMapping("/remove/{id}")
	@ResponseBody
	@RequiresPermissions("sys:modelCatalog:remove")
	@Log(describe = "删除", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo remove(@PathVariable("id") Long id) {
		if (modelCatalogService.remove(id) > 0) {
			return ResponseVo.ok("删除成功");
		}
		return ResponseVo.fail();
	}

	/**
	 * 批量删除
	 */
	@DeleteMapping("/batchRemove")
	@ResponseBody
	@RequiresPermissions("sys:modelCatalog:batchRemove")
	@Log(describe = "批量删除", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo batchRemove(@RequestParam("ids[]") Long[] ids) {
		if (modelCatalogService.batchRemove(ids) > 0) {
			return ResponseVo.ok("删除成功");
		}
		return ResponseVo.fail();
	}

	/**
	 * 导出数据
	 */
	@PostMapping("/exportData")
	@ResponseBody
	@RequiresPermissions("sys:modelCatalog:export")
	public ResponseVo exportData(ModelCatalogDO modelCatalog) {
		try {
			List<ModelCatalogDO> exportData = modelCatalogService.exportData(modelCatalog);
			ExcelUtil<ModelCatalogDO> excel = new ExcelUtil<ModelCatalogDO>(ModelCatalogDO.class);
			return excel.exportExcel(exportData, "系统模型目录数据");
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
	@RequiresPermissions("sys:modelCatalog:edit")
	public ResponseVo importTemplate() {
		try {
			ExcelUtil<ModelCatalogDO> excel = new ExcelUtil<ModelCatalogDO>(ModelCatalogDO.class);
			return excel.importTemplateExcel("系统模型目录数据导入模板");
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
	@RequiresPermissions("sys:modelCatalog:edit")
	public ResponseVo importData(MultipartFile file, boolean isCover) {
		ExcelUtil<ModelCatalogDO> util = new ExcelUtil<ModelCatalogDO>(ModelCatalogDO.class);
		try {
			List<ModelCatalogDO> modelCatalogList = util.importExcel(file.getInputStream());
			String message = modelCatalogService.importData(modelCatalogList, isCover);
			return ResponseVo.ok(message);
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseVo.fail(-1, e.getMessage());
		}
	}
}
