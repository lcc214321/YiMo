package top.yimo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication()
@MapperScan("top.yimo.*.dao")
public class YiMoApplication {

	public static void main(String[] args) {
		SpringApplication.run(YiMoApplication.class, args);
	}

}

