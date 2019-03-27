package top.yimo.common.controller;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年3月27日 下午4:14:25
 */
@RequestMapping("/tool")
@Controller
public class ToolController extends BaseController {
	private String prefix = "tool";

	@RequiresPermissions("tool:frombuild")
	@GetMapping(value = "frombuild")
	public String frombuild() {
		return prefix + "/frombuilder/frombuilder";
	}
}
