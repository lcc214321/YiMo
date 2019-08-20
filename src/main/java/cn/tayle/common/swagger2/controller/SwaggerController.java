package cn.tayle.common.swagger2.controller;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年4月23日 上午11:59:01
 */
@Controller
@RequestMapping("sys/swagger")
public class SwaggerController {

	@RequiresPermissions("sys:swagger:view")
	@GetMapping("/view")
	public String view() {
		return "redirect:/swagger-ui.html";
	}
}
