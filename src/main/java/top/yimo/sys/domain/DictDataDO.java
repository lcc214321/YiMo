package top.yimo.sys.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import top.yimo.common.domain.BaseDo;

/**
 * 数据字典数据表 表sys_dict_data
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年03月07日 17:42:42
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class DictDataDO extends BaseDo {
	private static final long serialVersionUID = 1L;

	// 字典类型
	private String dictType;
	// 字典编码
	private String dictNo;
	// 字典含义
	private String dictName;
	// 字典描述
	private String dictDescribe;
}
