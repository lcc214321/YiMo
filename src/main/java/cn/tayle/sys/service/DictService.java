package cn.tayle.sys.service;

import cn.tayle.sys.domain.DictDO;

import java.util.List;
import java.util.Map;

/**
 * 数据字典目标表
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年03月07日 17:18:06
 */
public interface DictService {
	
	DictDO get(String dictType);
	
	List<DictDO> listByPage(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(DictDO dict);
	
	int update(DictDO dict);
	
	int remove(String dictType);
	
	int batchRemove(String[] dictTypes);
}
