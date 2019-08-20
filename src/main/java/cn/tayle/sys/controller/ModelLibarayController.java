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

import lombok.extern.slf4j.Slf4j;
import cn.tayle.common.annotation.Log;
import cn.tayle.common.controller.BaseController;
import cn.tayle.common.enums.OperatorType;
import cn.tayle.common.model.vo.BootstrapTablePageVo;
import cn.tayle.common.model.vo.ResponseVo;
import cn.tayle.common.util.excel.ExcelUtil;
import cn.tayle.sys.domain.ModelLibarayDO;
import cn.tayle.sys.service.ModelLibarayService;

/**
 * 系统模型库 
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年06月08日 13:27:18
 */
 @Slf4j
@Controller
@RequestMapping("/sys/modelLibaray")
public class ModelLibarayController extends BaseController{
	private String prefix ="/sys/modelLibaray";
	private final static String title ="系统模型库";
	@Autowired
	private ModelLibarayService modelLibarayService;
	
	@GetMapping()
	@RequiresPermissions("sys:modelLibaray:modelLibaray")
	public String ModelLibaray(){
	    return prefix+"/modelLibaray";
	}
	
	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("sys:modelLibaray:modelLibaray")
	@Log(describe = "获取"+title, title = title, operatorType = OperatorType.QUERY)
	public BootstrapTablePageVo listByPage(@RequestParam Map<String, Object> params){
		startPage(params);
		List<ModelLibarayDO> modelLibarayList = modelLibarayService.listByPage(params);
		return getPageData(modelLibarayList);
	}
	
	@GetMapping("/add")
	@RequiresPermissions("sys:modelLibaray:add")
	public String add(){
	    return prefix+"/add";
	}

	@GetMapping("/edit/{id}")
	@RequiresPermissions("sys:modelLibaray:edit")
	public String edit(@PathVariable("id") Long id,Model model){
		ModelLibarayDO modelLibaray = modelLibarayService.get(id);
		model.addAttribute("modelLibaray", modelLibaray);
	    return prefix+"/edit";
	}
	
	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("sys:modelLibaray:add")
	@Log(describe = "新增", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo save( ModelLibarayDO modelLibaray){
		beforeSave(modelLibaray);
		if(modelLibarayService.save(modelLibaray)>0){
			return ResponseVo.ok("保存成功");
		}
		return ResponseVo.fail();
	}
	
	@ResponseBody
	@PutMapping("/update")
	@RequiresPermissions("sys:modelLibaray:edit")
	@Log(describe = "更新", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo update( ModelLibarayDO modelLibaray){
			beforeUpdate(modelLibaray);
		if (modelLibarayService.update(modelLibaray) > 0) {
			return ResponseVo.ok("更新成功");
		}
		return ResponseVo.fail();
	}
	
	/**
	 * 删除
	 */
	@DeleteMapping( "/remove/{id}")
	@ResponseBody
	@RequiresPermissions("sys:modelLibaray:remove")
	@Log(describe = "删除", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo remove(@PathVariable("id") Long id){
		if(modelLibarayService.remove(id)>0){
			return ResponseVo.ok("删除成功");
		}
		return ResponseVo.fail();
	}
	
	/**
	 * 批量删除
	 */
	@DeleteMapping( "/batchRemove")
	@ResponseBody
	@RequiresPermissions("sys:modelLibaray:batchRemove")
	@Log(describe = "批量删除", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo batchRemove(@RequestParam("ids[]") Long[] ids){
		if(modelLibarayService.batchRemove(ids)>0){
			return ResponseVo.ok("删除成功");
		}
		return ResponseVo.fail();
	}
	
	/**
	 * 导出数据
	 */
	@PostMapping("/exportData")
	@ResponseBody
	@RequiresPermissions("sys:modelLibaray:export")
	public ResponseVo exportData(ModelLibarayDO modelLibaray) {
		try {
			List<ModelLibarayDO> exportData = modelLibarayService.exportData(modelLibaray);
			ExcelUtil<ModelLibarayDO> excel = new ExcelUtil<ModelLibarayDO>(ModelLibarayDO.class);
			return excel.exportExcel(exportData, "系统模型库数据");
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
	@RequiresPermissions("sys:modelLibaray:edit")
	public ResponseVo importTemplate() {
		try {
			ExcelUtil<ModelLibarayDO> excel = new ExcelUtil<ModelLibarayDO>(ModelLibarayDO.class);
			return excel.importTemplateExcel("系统模型库数据导入模板");
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
	@RequiresPermissions("sys:modelLibaray:edit")
	public ResponseVo importData(MultipartFile file, boolean isCover) {
		ExcelUtil<ModelLibarayDO> util = new ExcelUtil<ModelLibarayDO>(ModelLibarayDO.class);
		try {
			List<ModelLibarayDO> modelLibarayList = util.importExcel(file.getInputStream());
			String message = modelLibarayService.importData(modelLibarayList, isCover);
			return ResponseVo.ok(message);
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseVo.fail(-1, e.getMessage());
		}
	}
}
