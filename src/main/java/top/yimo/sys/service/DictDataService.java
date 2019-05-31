package top.yimo.sys.service;

import java.util.List;
import java.util.Map;

import top.yimo.sys.domain.DictDataDO;

/**
 * 数据字典数据表
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年03月07日 17:42:42
 */
public interface DictDataService {
	//
	DictDataDO get(String dictType);

	DictDataDO getByTypeAndNo(String dictType, String dictNo);

	// 获取多个dictName
	List<DictDataDO> getDictDatas(String dictType, String dictNo);

	List<DictDataDO> listByPage(Map<String, Object> map);

	int count(Map<String, Object> map);

	int save(DictDataDO dictData);

	int update(DictDataDO dictData);

	int remove(String dictType);

	int removeByNo(String dictType, String dictNo);

	int batchRemove(String[] dictTypes);

	int batchRemoveByNo(String dictType, String[] dictNos);

	// 获取指定type对应有效的字典数据
	List<DictDataDO> getAllActiveDictData(String dictType);
}
