package cn.tayle.common.xss;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.lang3.StringUtils;

import cn.tayle.common.util.JsoupUtil;

/**
 * 增加xss过滤 基于JsoupUtil
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年3月28日 上午10:27:21
 */
public class XssHttpServletRequestWrapper extends HttpServletRequestWrapper {
	HttpServletRequest oldRequest = null;
	private boolean isIncludeRichText = false;
	public XssHttpServletRequestWrapper(HttpServletRequest request) {
		super(request);

	}

	/**
	 * 覆盖getParameter方法，将参数名和参数值都做xss过滤。<br/> 
	* 如果需要获得原始的值，则通过super.getParameterValues(name)来获取<br/> 
	* getParameterNames,getParameterValues和getParameterMap也可能需要覆盖 
	 */
	@Override
	public String getParameter(String name) {
		Boolean flag = ("content".equals(name) || name.endsWith("WithHtml"));
		if (flag && !isIncludeRichText) {
			return super.getParameter(name);
		}
		name = JsoupUtil.clean(name);
		String value = super.getParameter(name);
		if (StringUtils.isNotBlank(value)) {
			value = JsoupUtil.clean(value);
		}
		return value;
	}
	@Override
	public String[] getParameterValues(String name) {
		String[] arr = super.getParameterValues(name);
		if (arr != null) {
			for (int i = 0; i < arr.length; i++) {
				arr[i] = JsoupUtil.clean(arr[i]);
			}
		}
		return arr;
	}
	/** 
	    * 覆盖getHeader方法，将参数名和参数值都做xss过滤。<br/> 
	    * 如果需要获得原始的值，则通过super.getHeaders(name)来获取<br/> 
	    * getHeaderNames 也可能需要覆盖 
	    */
	@Override
	public String getHeader(String name) {
		name = JsoupUtil.clean(name);
		String value = super.getHeader(name);
		if (StringUtils.isNotBlank(value)) {
			value = JsoupUtil.clean(value);
		}
		return value;
	}

	/** 
	* 获取最原始的request 
	* @return 
	*/
	public HttpServletRequest getOldRequest() {
		return oldRequest;
	}

	/** 
	* 获取最原始的request的静态方法 
	* @return 
	*/
	public static HttpServletRequest getOldRequest(HttpServletRequest req) {
		if (req instanceof XssHttpServletRequestWrapper) {
			return ((XssHttpServletRequestWrapper) req).getOldRequest();
		}
		return req;
	}

}
