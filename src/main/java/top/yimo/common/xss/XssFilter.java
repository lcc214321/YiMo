package top.yimo.common.xss;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/**
 * xss过滤器
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年3月28日 上午11:01:53
 */
public class XssFilter implements Filter {
	private final Logger log = LoggerFactory.getLogger(getClass());
	/**
	 * 排除链接
	 */
	public List<String> excludes = new ArrayList<>();

	/**
	 * xss过滤开关
	 */
	public boolean enabled = false;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		String tempExcludes = filterConfig.getInitParameter("excludes");
		String tempEnabled = filterConfig.getInitParameter("enabled");
		if (StringUtils.isNotEmpty(tempExcludes)) {
			String[] url = tempExcludes.split(",");
			for (int i = 0; url != null && i < url.length; i++) {
				excludes.add(url[i]);
			}
		}
		if (StringUtils.isNotEmpty(tempEnabled)) {
			enabled = Boolean.valueOf(tempEnabled);
		}
		log.info("过滤器初始化");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		if (handleExcludeURL(req, resp)) {
			chain.doFilter(request, response);
			return;
		}
		XssHttpServletRequestWrapper xssRequest = new XssHttpServletRequestWrapper((HttpServletRequest) request);
		chain.doFilter(xssRequest, response);
	}

	private boolean handleExcludeURL(HttpServletRequest request, HttpServletResponse response) {
		if (!enabled) {
			return true;
		}
		if (excludes == null || excludes.isEmpty()) {
			return false;
		}
		String url = request.getServletPath();
		for (String pattern : excludes) {
			Pattern p = Pattern.compile("^" + pattern);
			Matcher m = p.matcher(url);
			if (m.find()) {
				return true;
			}
		}
		return false;
	}

	@Override
	public void destroy() {
		log.info(getClass().getSimpleName() + " 已销毁");
	}

}
