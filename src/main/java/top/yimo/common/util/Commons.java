package top.yimo.common.util;

import org.springframework.stereotype.Component;
import org.springframework.util.DigestUtils;

/**
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年1月10日 下午3:16:47
 */
@Component
public class Commons {
	public static void main(String[] args) {
		System.out.println(DigestUtils.md5DigestAsHex("tayle123456".getBytes()));
	}
}
