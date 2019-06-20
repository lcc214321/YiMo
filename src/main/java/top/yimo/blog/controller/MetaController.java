package top.yimo.blog.controller;

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
import top.yimo.blog.domain.MetaDO;
import top.yimo.blog.service.MetaService;

/**
 * 项目 
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年06月20日 15:56:27
 */
 @Slf4j
@Controller
@RequestMapping("/blog/meta")
public class MetaController extends BaseController{
	private String prefix ="/blog/meta";
	private final static String title ="项目";
	@Autowired
	private MetaService metaService;
	
	@GetMapping()
	@RequiresPermissions("blog:meta:meta")
	public String Meta(){
	    return prefix+"/meta";
	}
	
	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("blog:meta:meta")
	@Log(describe = "获取"+title, title = title, operatorType = OperatorType.QUERY)
	public BootstrapTablePageVo listByPage(@RequestParam Map<String, Object> params){
		startPage(params);
		List<MetaDO> metaList = metaService.listByPage(params);
		return getPageData(metaList);
	}
	
	@GetMapping("/add")
	@RequiresPermissions("blog:meta:add")
	public String add(){
	    return prefix+"/add";
	}

	@GetMapping("/edit/{mid}")
	@RequiresPermissions("blog:meta:edit")
	public String edit(@PathVariable("mid") Integer mid,Model model){
		MetaDO meta = metaService.get(mid);
		model.addAttribute("meta", meta);
	    return prefix+"/edit";
	}
	
	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("blog:meta:add")
	@Log(describe = "新增", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo save( MetaDO meta){
		beforeSave(meta);
		if(metaService.save(meta)>0){
			return ResponseVo.ok("保存成功");
		}
		return ResponseVo.fail();
	}
	
	@ResponseBody
	@PutMapping("/update")
	@RequiresPermissions("blog:meta:edit")
	@Log(describe = "更新", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo update( MetaDO meta){
			beforeUpdate(meta);
		if (metaService.update(meta) > 0) {
			return ResponseVo.ok("更新成功");
		}
		return ResponseVo.fail();
	}
	
	/**
	 * 删除
	 */
	@DeleteMapping( "/remove/{id}")
	@ResponseBody
	@RequiresPermissions("blog:meta:remove")
	@Log(describe = "删除", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo remove(@PathVariable("id") Integer mid){
		if(metaService.remove(mid)>0){
			return ResponseVo.ok("删除成功");
		}
		return ResponseVo.fail();
	}
	
	/**
	 * 批量删除
	 */
	@DeleteMapping( "/batchRemove")
	@ResponseBody
	@RequiresPermissions("blog:meta:batchRemove")
	@Log(describe = "批量删除", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo batchRemove(@RequestParam("ids[]") Integer[] mids){
		if(metaService.batchRemove(mids)>0){
			return ResponseVo.ok("删除成功");
		}
		return ResponseVo.fail();
	}
	
	/**
	 * 导出数据
	 */
	@PostMapping("/exportData")
	@ResponseBody
	@RequiresPermissions("blog:meta:export")
	public ResponseVo exportData(MetaDO meta) {
		try {
			List<MetaDO> exportData = metaService.exportData(meta);
			ExcelUtil<MetaDO> excel = new ExcelUtil<MetaDO>(MetaDO.class);
			return excel.exportExcel(exportData, "项目数据");
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
	@RequiresPermissions("blog:meta:edit")
	public ResponseVo importTemplate() {
		try {
			ExcelUtil<MetaDO> excel = new ExcelUtil<MetaDO>(MetaDO.class);
			return excel.importTemplateExcel("项目数据导入模板");
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
	@RequiresPermissions("blog:meta:edit")
	public ResponseVo importData(MultipartFile file, boolean isCover) {
		ExcelUtil<MetaDO> util = new ExcelUtil<MetaDO>(MetaDO.class);
		try {
			List<MetaDO> metaList = util.importExcel(file.getInputStream());
			String message = metaService.importData(metaList, isCover);
			return ResponseVo.ok(message);
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseVo.fail(-1, e.getMessage());
		}
	}
}
