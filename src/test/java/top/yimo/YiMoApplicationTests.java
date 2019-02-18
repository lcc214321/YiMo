package top.yimo;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import top.yimo.common.util.YiMoUtils;

//@RunWith(SpringRunner.class)
//@SpringBootTest
public class YiMoApplicationTests {

	@Test
	public void contextLoads() {
		System.out.println(YiMoUtils.encrypt("tayle", "123456"));
	}

}

