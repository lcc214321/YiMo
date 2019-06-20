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
import top.yimo.blog.domain.CommentDO;
import top.yimo.blog.service.CommentService;
import top.yimo.common.annotation.Log;
import top.yimo.common.controller.BaseController;
import top.yimo.common.enums.OperatorType;
import top.yimo.common.model.vo.BootstrapTablePageVo;
import top.yimo.common.model.vo.ResponseVo;
import top.yimo.common.util.excel.ExcelUtil;

/**
 * 评论
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年06月17日 16:02:33
 */
@Slf4j
@Controller
@RequestMapping("/blog/comment")
public class CommentController extends BaseController {
	private String prefix = "/blog/comment";
	private final static String title = "评论";
	@Autowired
	private CommentService commentService;

	@GetMapping()
	@RequiresPermissions("blog:comment:comment")
	public String comment() {
		return prefix + "/comment";
	}

	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("blog:comment:comment")
	@Log(describe = "获取" + title, title = title, operatorType = OperatorType.QUERY)
	public BootstrapTablePageVo listByPage(@RequestParam Map<String, Object> params) {
		startPage(params);
		List<CommentDO> commentList = commentService.listByPage(params);
		return getPageData(commentList);
	}

	@GetMapping("/add")
	@RequiresPermissions("blog:comment:add")
	public String add() {
		return prefix + "/add";
	}

	@GetMapping("/edit/{coid}")
	@RequiresPermissions("blog:comment:edit")
	public String edit(@PathVariable("coid") Integer coid, Model model) {
		CommentDO comment = commentService.get(coid);
		model.addAttribute("comment", comment);
		return prefix + "/edit";
	}

	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("blog:comment:add")
	@Log(describe = "新增", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo save(CommentDO comment) {
		beforeSave(comment);
		if (commentService.save(comment) > 0) {
			return ResponseVo.ok("保存成功");
		}
		return ResponseVo.fail();
	}

	@ResponseBody
	@PutMapping("/update")
	@RequiresPermissions("blog:comment:edit")
	@Log(describe = "更新", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo update(CommentDO comment) {
		beforeUpdate(comment);
		if (commentService.update(comment) > 0) {
			return ResponseVo.ok("更新成功");
		}
		return ResponseVo.fail();
	}

	/**
	 * 删除
	 */
	@DeleteMapping("/remove/{id}")
	@ResponseBody
	@RequiresPermissions("blog:comment:remove")
	@Log(describe = "删除", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo remove(@PathVariable("id") Integer coid) {
		if (commentService.remove(coid) > 0) {
			return ResponseVo.ok("删除成功");
		}
		return ResponseVo.fail();
	}

	/**
	 * 批量删除
	 */
	@DeleteMapping("/batchRemove")
	@ResponseBody
	@RequiresPermissions("blog:comment:batchRemove")
	@Log(describe = "批量删除", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo batchRemove(@RequestParam("ids[]") Integer[] coids) {
		if (commentService.batchRemove(coids) > 0) {
			return ResponseVo.ok("删除成功");
		}
		return ResponseVo.fail();
	}

	/**
	 * 导出数据
	 */
	@PostMapping("/exportData")
	@ResponseBody
	@RequiresPermissions("blog:comment:export")
	public ResponseVo exportData(CommentDO comment) {
		try {
			List<CommentDO> exportData = commentService.exportData(comment);
			ExcelUtil<CommentDO> excel = new ExcelUtil<CommentDO>(CommentDO.class);
			return excel.exportExcel(exportData, "评论数据");
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
	@RequiresPermissions("blog:comment:edit")
	public ResponseVo importTemplate() {
		try {
			ExcelUtil<CommentDO> excel = new ExcelUtil<CommentDO>(CommentDO.class);
			return excel.importTemplateExcel("评论数据导入模板");
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
	@RequiresPermissions("blog:comment:edit")
	public ResponseVo importData(MultipartFile file, boolean isCover) {
		ExcelUtil<CommentDO> util = new ExcelUtil<CommentDO>(CommentDO.class);
		try {
			List<CommentDO> commentList = util.importExcel(file.getInputStream());
			String message = commentService.importData(commentList, isCover);
			return ResponseVo.ok(message);
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseVo.fail(-1, e.getMessage());
		}
	}
}
