package top.yimo.sys.controller;
/**
 * 查看服务器端日志
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年4月16日 上午10:43:39
 */

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sys/webLog")
public class WebLogController {
	private String prefix = "sys/log";
	@GetMapping("/tail")
	public String tailLog() {
		return prefix+"/webLog";
	}
}
