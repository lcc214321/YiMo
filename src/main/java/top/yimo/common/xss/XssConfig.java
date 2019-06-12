package top.yimo.common.xss;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年3月28日 上午10:49:27
 */
@Configuration
public class XssConfig {
	@Value("${xss.enabled}")
	private String enabled;

	@Value("${xss.excludes}")
	private String excludes;
	@Value("${xss.urlPatterns}")
	private String urlPatterns;

	/**
	 * xss过滤拦截器
	 */
	@Bean
	public FilterRegistrationBean<XssFilter> xssFilterRegistrationBean() {
		FilterRegistrationBean<XssFilter> filterRegistrationBean = new FilterRegistrationBean<XssFilter>();
		filterRegistrationBean.setFilter(new XssFilter());
		filterRegistrationBean.setOrder(1);
		if (StringUtils.isBlank(urlPatterns)) {// 默认过滤所有
			urlPatterns = "/*";
		}
		if (StringUtils.isBlank(enabled)) {// 默认过滤
			enabled = "true";
		}
		filterRegistrationBean.addUrlPatterns(urlPatterns);
		Map<String, String> initParameters = new HashMap<String, String>();
		initParameters.put("excludes", excludes);
		initParameters.put("enabled", enabled);
		filterRegistrationBean.setInitParameters(initParameters);
		return filterRegistrationBean;

	}
}
