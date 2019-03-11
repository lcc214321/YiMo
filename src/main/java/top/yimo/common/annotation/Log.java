package top.yimo.common.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import top.yimo.common.enums.OperatorType;

/**
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年1月9日 下午4:43:57
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Log {
	/**
	 * 标题
	 */
	public String title() default "";

	/**
	 * 操作类别
	 */
	public OperatorType operatorType() default OperatorType.OTHER;

	/**
	 * 日志描述
	 */
	public String describe() default "";

	public boolean isSaveArgs() default false;
}
