package top.yimo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import springfox.documentation.swagger2.annotations.EnableSwagger2;

@SpringBootApplication
@EnableCaching
@EnableScheduling
@EnableSwagger2
@MapperScan("top.yimo.*.dao")
@EnableTransactionManagement // 开启事务控制
public class YiMoApplication {

	public static void main(String[] args) {
		System.setProperty(net.sf.ehcache.CacheManager.ENABLE_SHUTDOWN_HOOK_PROPERTY, "true");
		SpringApplication.run(YiMoApplication.class, args);
	}
}
