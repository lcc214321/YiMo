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

import top.yimo.blog.domain.ContentDO;
import top.yimo.blog.service.ContentService;
import top.yimo.common.annotation.Log;
import top.yimo.common.controller.BaseController;
import top.yimo.common.enums.OperatorType;
import top.yimo.common.model.vo.BootstrapTablePageVo;
import top.yimo.common.model.vo.ResponseVo;
import top.yimo.common.util.excel.ExcelUtil;

/**
 * 内容表
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年06月17日 16:02:33
 */
@Controller
@RequestMapping("/blog/content")
public class ContentController extends BaseController {
	private String prefix = "/blog/content";
	private final static String title = "内容表";
	@Autowired
	private ContentService contentService;

	@GetMapping()
	@RequiresPermissions("blog:content:content")
	public String content() {
		return prefix + "/content";
	}

	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("blog:content:content")
	@Log(describe = "获取" + title, title = title, operatorType = OperatorType.QUERY)
	public BootstrapTablePageVo listByPage(@RequestParam Map<String, Object> params) {
		startPage(params);
		List<ContentDO> contentList = contentService.listByPage(params);
		return getPageData(contentList);
	}

	@GetMapping("/add")
	@RequiresPermissions("blog:content:add")
	public String add() {
		return prefix + "/add";
	}

	@GetMapping("/edit/{cid}")
	@RequiresPermissions("blog:content:edit")
	public String edit(@PathVariable("cid") Integer cid, Model model) {
		ContentDO content = contentService.get(cid);
		model.addAttribute("content", content);
		return prefix + "/edit";
	}

	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("blog:content:add")
	@Log(describe = "新增", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo save(ContentDO content) {
		beforeSave(content);
		if (contentService.save(content) > 0) {
			return ResponseVo.ok("保存成功");
		}
		return ResponseVo.fail();
	}

	@ResponseBody
	@PutMapping("/update")
	@RequiresPermissions("blog:content:edit")
	@Log(describe = "更新", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo update(ContentDO content) {
		beforeUpdate(content);
		if (contentService.update(content) > 0) {
			return ResponseVo.ok("更新成功");
		}
		return ResponseVo.fail();
	}

	/**
	 * 删除
	 */
	@DeleteMapping("/remove/{id}")
	@ResponseBody
	@RequiresPermissions("blog:content:remove")
	@Log(describe = "删除", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo remove(@PathVariable("id") Integer cid) {
		if (contentService.remove(cid) > 0) {
			return ResponseVo.ok("删除成功");
		}
		return ResponseVo.fail();
	}

	/**
	 * 批量删除
	 */
	@DeleteMapping("/batchRemove")
	@ResponseBody
	@RequiresPermissions("blog:content:batchRemove")
	@Log(describe = "批量删除", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo batchRemove(@RequestParam("ids[]") Integer[] cids) {
		if (contentService.batchRemove(cids) > 0) {
			return ResponseVo.ok("删除成功");
		}
		return ResponseVo.fail();
	}

	/**
	 * 导出数据
	 */
	@PostMapping("/exportData")
	@ResponseBody
	@RequiresPermissions("blog:content:export")
	public ResponseVo exportData(ContentDO content) {
		try {
			List<ContentDO> exportData = contentService.exportData(content);
			ExcelUtil<ContentDO> excel = new ExcelUtil<ContentDO>(ContentDO.class);
			return excel.exportExcel(exportData, "内容表数据");
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
	@RequiresPermissions("blog:content:edit")
	public ResponseVo importTemplate() {
		try {
			ExcelUtil<ContentDO> excel = new ExcelUtil<ContentDO>(ContentDO.class);
			return excel.importTemplateExcel("内容表数据导入模板");
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
	@RequiresPermissions("blog:content:edit")
	public ResponseVo importData(MultipartFile file, boolean isCover) {
		ExcelUtil<ContentDO> util = new ExcelUtil<ContentDO>(ContentDO.class);
		try {
			List<ContentDO> contentList = util.importExcel(file.getInputStream());
			String message = contentService.importData(contentList, isCover);
			return ResponseVo.ok(message);
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseVo.fail(-1, e.getMessage());
		}
	}
}
