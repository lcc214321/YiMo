package cn.tayle.common.interceptor;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import lombok.extern.slf4j.Slf4j;
import cn.tayle.common.model.vo.ResponseVo;

/**
 * 自定义拦截器，用于演示模式
 * 
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年5月28日 下午11:25:27
 */
@Component
@Slf4j
public class RunInterceptor implements HandlerInterceptor {

	@Value("${yimo.isDemo}")
	private boolean isDemo;

	@Value("${yimo.refusedURI}")
	private String refusedURI;

	/**
	 * 目标方法执行之前执行
	 *
	 * @param request
	 * @param response
	 * @param handler
	 * @return
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		String uri = request.getRequestURI();
		if (StringUtils.isNotBlank(uri) && isDemo && StringUtils.isNotBlank(refusedURI)) {
			String[] refusedURIs = refusedURI.split("@");
			List<String> refusedURIList = Arrays.asList(refusedURIs);
			for (String refuseduri : refusedURIList) {
				if (uri.contains(refuseduri)) {
					log.info("demo模式操作被拦截{}", uri);
					ResponseVo.out(response, ResponseVo.fail("演示模型不允许该操作,如需体验请fork后在本地部署"));
					return false;
				}
			}
		}
		return true;

	}

}
