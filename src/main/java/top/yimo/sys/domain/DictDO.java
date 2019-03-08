package top.yimo.sys.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import top.yimo.common.domain.BaseDo;

/**
 * 数据字典目标表 表sys_dict
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年03月07日 17:18:06
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class DictDO extends BaseDo {
	private static final long serialVersionUID = 1L;

	// 字典类型
	private String dictType;
	// 字典描述
	private String dictDescribe;
}
