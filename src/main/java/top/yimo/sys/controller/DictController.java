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
import top.yimo.common.model.vo.BootstrapTablePageVo;
import top.yimo.common.model.vo.ResponseVo;
import top.yimo.sys.domain.DictDO;
import top.yimo.sys.service.DictService;

/**
 * 数据字典目标表 
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年03月07日 17:18:06
 */
 
@Controller
@RequestMapping("/sys/dict")
public class DictController extends BaseController{
	private String prefix ="/sys/dict";
	@Autowired
	private DictService dictService;
	
	@GetMapping()
	@RequiresPermissions("sys:dict:dict")
	public String Dict(){
	    return prefix+"/dict";
	}
	
	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("sys:dict:dict")
	@Log(describe = "获取数据字典目标表列表", title = "数据字典目标表", operatorType = OperatorType.QUERY)
	public BootstrapTablePageVo listByPage(@RequestParam Map<String, Object> params){
		startPage(params);
		List<DictDO> dictList = dictService.listByPage(params);
		return getPageData(dictList);
	}
	
	@GetMapping("/add")
	@RequiresPermissions("sys:dict:add")
	public String add(){
	    return prefix+"/add";
	}

	@GetMapping("/edit/{dictType}")
	@RequiresPermissions("sys:dict:edit")
	public String edit(@PathVariable("dictType") String dictType,Model model){
		DictDO dict = dictService.get(dictType);
		model.addAttribute("dict", dict);
	    return prefix+"/edit";
	}
	
	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("sys:dict:add")
	public ResponseVo save( DictDO dict){
		DictDO dictDB = dictService.get(dict.getDictType());
		if(dictDB != null) {
			return ResponseVo.fail(666, "该字典类型已经存在，请检查字典类型。");
		}
		beforeSave(dict);
		if(dictService.save(dict)>0){
			return ResponseVo.ok("保存成功");
		}
		return ResponseVo.fail();
	}
	
	@ResponseBody
	@PutMapping("/update")
	@RequiresPermissions("sys:dict:edit")
	public ResponseVo update( DictDO dict){
		beforeUpdate(dict);
		if (dictService.update(dict) > 0) {
			return ResponseVo.ok("更新成功");
		}
		return ResponseVo.fail();
	}
	
	/**
	 * 删除
	 */
	@DeleteMapping( "/remove")
	@ResponseBody
	@RequiresPermissions("sys:dict:remove")
	public ResponseVo remove(@PathVariable("id") String dictType){
		if(dictService.remove(dictType)>0){
			return ResponseVo.ok("删除成功");
		}
		return ResponseVo.fail();
	}
	
	/**
	 * 批量删除
	 */
	@DeleteMapping( "/batchRemove")
	@ResponseBody
	@RequiresPermissions("sys:dict:batchRemove")
	public ResponseVo remove(@PathVariable("id")@RequestParam("ids[]") String[] dictTypes){
		if(dictService.batchRemove(dictTypes)>0){
			return ResponseVo.ok("删除成功");
		}
		return ResponseVo.fail();
	}
}
