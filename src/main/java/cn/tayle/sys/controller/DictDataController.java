package cn.tayle.sys.controller;

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

import cn.tayle.common.annotation.Log;
import cn.tayle.common.controller.BaseController;
import cn.tayle.common.enums.OperatorType;
import cn.tayle.common.model.vo.BootstrapTablePageVo;
import cn.tayle.common.model.vo.ResponseVo;
import cn.tayle.sys.domain.DictDataDO;
import cn.tayle.sys.service.DictDataService;

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
	private String prefix = "sys/dictData";
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
	public BootstrapTablePageVo listByPage(@RequestParam Map<String, Object> params,
			@PathVariable("dictType") String dictType) {
		params.put("dictType", dictType);
		startPage(params);
		List<DictDataDO> dictDataList = dictDataService.listByPage(params);
		return getPageData(dictDataList);
	}

	@GetMapping("/add/{dictType}")
	@RequiresPermissions("sys:dictData:add")
	public String add(@PathVariable("dictType") String dictType, Model model) {
		model.addAttribute("dictType", dictType);
		return prefix + "/add";
	}

	@GetMapping("/edit/{dictType}/{dictNo}")
	@RequiresPermissions("sys:dictData:edit")
	public String edit(@PathVariable("dictType") String dictType, @PathVariable("dictNo") String dictNo, Model model) {
		DictDataDO dictData = dictDataService.getByTypeAndNo(dictType, dictNo);
		model.addAttribute("dictData", dictData);
		return prefix + "/edit";
	}

	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("sys:dictData:add")
	public ResponseVo save(DictDataDO dictData) {
		DictDataDO dictDataDB = dictDataService.getByTypeAndNo(dictData.getDictType(), dictData.getDictNo());
		if (dictDataDB != null) {
			return ResponseVo.fail(666, "该字典编码值已经存在，请检查字典编码值。");
		}
		beforeSave(dictData);
		if (dictDataService.save(dictData) > 0) {
			return ResponseVo.ok("保存成功");
		}
		return ResponseVo.fail();
	}

	@ResponseBody
	@PutMapping("/update")
	@RequiresPermissions("sys:dictData:edit")
	public ResponseVo update(DictDataDO dictData) {
		beforeUpdate(dictData);
		if (dictDataService.update(dictData) > 0) {
			return ResponseVo.ok("更新成功");
		}
		return ResponseVo.fail();
	}

	/**
	 * 删除
	 */
	@DeleteMapping("/remove/{dictType}/{dictNo}")
	@ResponseBody
	@RequiresPermissions("sys:dictData:remove")
	public ResponseVo remove(@PathVariable("dictType") String dictType, @PathVariable("dictNo") String dictNo) {
		if (dictDataService.removeByNo(dictType, dictNo) > 0) {
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
	public ResponseVo remove(@PathVariable("id") String dictType, @RequestParam("ids[]") String[] dictNos) {
		if (dictDataService.batchRemoveByNo(dictType, dictNos) > 0) {
			return ResponseVo.ok("删除成功");
		}
		return ResponseVo.fail();
	}

	@ResponseBody
	@GetMapping("/getDictData")
	public DictDataDO getDictData(@RequestParam Map<String, Object> params, String dictType, String dictNo) {
		DictDataDO dictData = dictDataService.getByTypeAndNo(dictType, dictNo);
		return dictData;
	}

	@ResponseBody
	@GetMapping("/getDictDatas")
	public ResponseVo getDictDatas(@RequestParam Map<String, Object> params, String dictType, String dictNo) {
		if (StringUtils.isBlank(dictNo) || StringUtils.isBlank(dictType)) {
			return ResponseVo.ok("-");
		}
		StringBuffer sb = new StringBuffer();
		List<DictDataDO> dictDatas = dictDataService.getDictDatas(dictType, dictNo);
		for (DictDataDO dictData : dictDatas) {
			sb = sb.append(dictData.getDictName()).append(",");
		}
		String dictNames = sb.toString();
		if (!"".equals(dictNames)) {
			dictNames = dictNames.substring(0, dictNames.length() - 1);
		}
		return ResponseVo.ok(dictNames);
	}

	@ResponseBody
	@GetMapping("/getNextCitys")
	public List<DictDataDO> getNextCitys(@RequestParam Map<String, Object> params, String dictType, String dictNo,
			String dictDescribe) {
		if (!StringUtils.isBlank(dictNo)) {
			if ("city".equals(dictDescribe)) {
				dictNo = dictNo.substring(0, 2) + "%";
			} else {
				dictNo = dictNo.substring(0, 4) + "%";
			}
		}

		return dictDataService.getNextCitys(dictType, dictNo, dictDescribe);
	}
}
