package cn.tayle.blog.controller;

import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tayle.blog.domain.CommentDO;
import cn.tayle.blog.service.CommentService;
import cn.tayle.common.annotation.Log;
import cn.tayle.common.controller.BaseController;
import cn.tayle.common.enums.OperatorType;
import cn.tayle.common.model.vo.BootstrapTablePageVo;
import cn.tayle.common.model.vo.ResponseVo;
import cn.tayle.common.util.excel.ExcelUtil;

/**
 * 评论
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年06月17日 16:02:33
 */
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

	@PutMapping("/approve/{id}")
	@RequiresPermissions("blog:comment:approve")
	@ResponseBody
	public ResponseVo approve(@PathVariable("id") Integer coid) {
		if (commentService.approve(coid) > 0) {
			System.out.println("1234");
			return ResponseVo.ok("审批成功");
		}
		return ResponseVo.fail();
	}
}
