package cn.tayle.common.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class WebUtils extends org.springframework.web.util.WebUtils{
	// 获取请求对象
	public static HttpServletRequest getHttpServletRequest() {
		ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		return servletRequestAttributes.getRequest();
	}

	// 获取响应对象
	public static HttpServletResponse getHttpServletResponse() {
		ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		return servletRequestAttributes.getResponse();
	}
}
