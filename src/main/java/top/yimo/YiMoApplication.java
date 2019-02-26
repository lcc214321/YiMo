package top.yimo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication()
@MapperScan("top.yimo.*.dao")
@EnableTransactionManagement//开启事务控制
public class YiMoApplication {

	public static void main(String[] args) {
		SpringApplication.run(YiMoApplication.class, args);
	}
}

