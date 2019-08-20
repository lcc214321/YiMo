package cn.tayle.common.swagger2.config;

import org.springframework.context.annotation.Bean;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;

public class Swagger2Config {
	@Bean
	public Docket createRestApi() {
		return new Docket(DocumentationType.SWAGGER_2).apiInfo(apiInfo()).select()
		        // 为当前包路径
		        // .apis(RequestHandlerSelectors.any())
		        .apis(RequestHandlerSelectors.basePackage("cn.tayle.sys.controller")).paths(PathSelectors.any()).build();
	}

	// 构建 api文档的详细信息函数
	private ApiInfo apiInfo() {
		return new ApiInfoBuilder()
		        // 页面标题
		        .title("功能测试")
		        // 创建人
		        .contact(new Contact("Edison", "xxx@qq.com", "xxx@qq.com"))
		        // 版本号
		        .version("1.0")
		        // 描述
		        .description("API 描述").build();
	}
}
