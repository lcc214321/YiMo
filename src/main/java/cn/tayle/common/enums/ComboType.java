package cn.tayle.common.enums;

/**
 * 转码方式
 * 
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年5月15日 上午10:04:53
 */
public enum ComboType {
	/**
	 * Sql表达式 select dict_no,dict_name from sys_dict_data where dict_type='Sex'
	 */
	SQL,
	/**
	 * 代码表 1=男,2=女
	 */
	CODE_TABLE,
	/**
	 * 数据字典 sex
	 */
	DICT,

}
