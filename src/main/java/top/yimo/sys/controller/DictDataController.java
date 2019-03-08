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
import top.yimo.sys.domain.DictDataDO;
import top.yimo.sys.service.DictDataService;

/**
 * 数据字典数据表 
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年03月07日 17:42:42
 */

@Controller
@RequestMapping("/sys/dictData")
public class DictDataController extends BaseController {
	private String prefix = "/sys/dictData";
	@Autowired
	private DictDataService dictDataService;

	@GetMapping("/{dictType}")
	@RequiresPermissions("sys:dictData:dictData")
	public String DictData(@PathVariable("dictType") String dictType, Model model) {
		model.addAttribute("dictType", dictType);
		return prefix + "/dictData";
	}

	@ResponseBody
	@GetMapping("/list/{dictType}")
	@RequiresPermissions("sys:dictData:dictData")
	@Log(describe = "获取数据字典数据表列表", title = "数据字典数据表", operatorType = OperatorType.QUERY)
	public PageVo listByPage(@RequestParam Map<String, Object> params, @PathVariable("dictType") String dictType) {
		params.put("dictType", dictType);
		List<DictDataDO> dictDataList = dictDataService.listByPage(params);
		int total = dictDataService.count(params);
		return getPageData(dictDataList, total);
	}

	@GetMapping("/add")
	@RequiresPermissions("sys:dictData:add")
	public String add() {
		return prefix + "/add";
	}

	@GetMapping("/edit/{dictType}")
	@RequiresPermissions("sys:dictData:edit")
	public String edit(@PathVariable("dictType") String dictType, Model model) {
		DictDataDO dictData = dictDataService.get(dictType);
		model.addAttribute("dictData", dictData);
		return prefix + "/edit";
	}

	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("sys:dictData:add")
	public ResponseVo save(DictDataDO dictData) {
		if (dictDataService.save(dictData) > 0) {
			return ResponseVo.ok("保存成功");
		}
		return ResponseVo.fail();
	}

	@ResponseBody
	@PutMapping("/update")
	@RequiresPermissions("sys:dictData:edit")
	public ResponseVo update(DictDataDO dictData) {
		if (dictDataService.update(dictData) > 0) {
			return ResponseVo.ok("更新成功");
		}
		return ResponseVo.fail();
	}

	/**
	 * 删除
	 */
	@DeleteMapping("/remove")
	@ResponseBody
	@RequiresPermissions("sys:dictData:remove")
	public ResponseVo remove(String dictType) {
		if (dictDataService.remove(dictType) > 0) {
			return ResponseVo.ok("删除成功");
		}
		return ResponseVo.fail();
	}

	/**
	 * 批量删除
	 */
	@DeleteMapping("/batchRemove")
	@ResponseBody
	@RequiresPermissions("sys:dictData:batchRemove")
	public ResponseVo remove(@RequestParam("ids[]") String[] dictTypes) {
		if (dictDataService.batchRemove(dictTypes) > 0) {
			return ResponseVo.ok("删除成功");
		}
		return ResponseVo.fail();
	}
}