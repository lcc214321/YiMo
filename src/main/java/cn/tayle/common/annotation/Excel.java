package cn.tayle.common.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import cn.tayle.common.enums.ComboType;
import cn.tayle.common.enums.ConvertType;

/**
 * 自定义导出Excel数据注解
 * 
 * @author ruoyi
 */
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Excel {
	/**
	 * 导出到Excel中的名字.
	 */
	public String name();

	/**
	 * 排序号用于导出对列排序
	 */
	public int orderNum();

	/**
	 * 日期格式,
	 */
	public String dateFormat() default "";

	/**
	 * 读取内容转码方式 默认为数据字典
	 */
	public ConvertType convertType() default ConvertType.DICT;

	/**
	 * 读取内容转表达式 详见 ConvertType
	 */
	public String convertExp() default "";

	/**
	 * 导出时在excel中每个列的高度 单位为字符
	 */
	public double height() default 14;

	/**
	 * 导出时在excel中每个列的宽 单位为字符
	 */
	public double width() default 16;

	/**
	 * 文字后缀,如% 90 变成90%
	 */
	public String suffix() default "";

	/**
	 * 当值为空时,字段的默认值
	 */
	public String defaultValue() default "";

	/**
	 * 另一个类中的属性名称,支持多级获取,以小数点隔开
	 */
	public String targetAttr() default "";

	/**
	 * 是否导出数据
	 */
	public boolean isExport() default true;

	/**
	 * 提示信息
	 */
	public String prompt() default "";

	/**
	 * 下拉值类型默认为数据字典
	 */
	public ComboType comboType() default ComboType.DICT;

	/**
	 * 设置只能选择不能输入的列内容.
	 */
	public String comboExp() default "";

	/**
	 * 字段允许导出或导入
	 */
	public Type type() default Type.ALL;

	public enum Type {
		ALL, EXPORT, IMPORT;
	}
}
