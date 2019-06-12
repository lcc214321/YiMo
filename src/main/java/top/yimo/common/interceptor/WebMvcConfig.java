package top.yimo.common.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import top.yimo.common.YiMoConfig;

@Component
public class WebMvcConfig implements WebMvcConfigurer {
	@Autowired
	private RunInterceptor runInterceptor;

	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(runInterceptor).addPathPatterns("/**");

	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// 增加静态文件映射
		registry.addResourceHandler("/files/**").addResourceLocations("file:" + YiMoConfig.getUploadPath());
	}

}
