package top.yimo.sys.service;

import top.yimo.sys.domain.DictDataDO;

import java.util.List;
import java.util.Map;

/**
 * 数据字典数据表
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年03月07日 17:42:42
 */
public interface DictDataService {
	
	DictDataDO get(String dictType);
	
	List<DictDataDO> listByPage(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(DictDataDO dictData);
	
	int update(DictDataDO dictData);
	
	int remove(String dictType);
	
	int batchRemove(String[] dictTypes);
}