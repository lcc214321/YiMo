package cn.tayle.common.datasource;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年4月23日 下午2:44:45
 */
@Controller
@RequestMapping("/sys/druid")
public class DruidController {

	@GetMapping("/view")
	@RequiresPermissions("sys:druid:view")
	public String view() {
		return "redirect:/druid/index.html";
	}
}
