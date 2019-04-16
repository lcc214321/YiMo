package top.yimo.common.model.vo;

import lombok.Data;

/**
 * 服务器日志
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年4月16日 上午10:33:07
 */
@Data
public class WebLogVo {
	public String text;

	public WebLogVo(String text) {
		this.text = text;
	}
	public static WebLogVo log(String text) {
		return new WebLogVo(text);
	}
}
