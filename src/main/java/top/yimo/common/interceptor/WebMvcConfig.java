package top.yimo.common.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Component
public class WebMvcConfig implements WebMvcConfigurer {
	@Autowired
	private RunInterceptor runInterceptor;

	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(runInterceptor).addPathPatterns("/**");
	}
}
