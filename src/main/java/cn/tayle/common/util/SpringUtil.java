package cn.tayle.common.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

/**
 * 用于获取Spring中的bean对象 
 * 		<li>解决ShiroFilter中注入Bean失败
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年3月18日 下午2:25:02
 */
@Component
public class SpringUtil implements ApplicationContextAware {

	private static ApplicationContext applicationContext;

	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		if (SpringUtil.applicationContext == null) {
			SpringUtil.applicationContext = applicationContext;
		}
	}

	public static ApplicationContext getApplicationContext() {
		return applicationContext;
	}

	// 根据name
	public static Object getBean(String name) {
		return getApplicationContext().getBean(name);
	}

	// 根据类型
	public static <T> T getBean(Class<T> clazz) {
		return getApplicationContext().getBean(clazz);
	}

	public static <T> T getBean(String name, Class<T> clazz) {
		return getApplicationContext().getBean(name, clazz);
	}

}
