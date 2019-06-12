package top.yimo.common.service;

import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Service;

/**
 * 
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年6月11日 上午10:32:14
 */
@Service("tool")
public class ToolService {
	/**
	 * 参数替换 默认参数格式为#{para}
	 * 
	 */
	public String replaceArg(String template, Map<String, String> params) {
		StringBuffer sb = new StringBuffer();
		Matcher m = Pattern.compile("\\#\\{\\w+\\}").matcher(template);
		while (m.find()) {
			String param = m.group();
			Object value = params.get(param.substring(2, param.length() - 1));
			m.appendReplacement(sb, value == null ? "" : value.toString());
		}
		m.appendTail(sb);
		return sb.toString();
	}
}
