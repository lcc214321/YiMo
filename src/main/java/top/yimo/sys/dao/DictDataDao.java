package top.yimo.sys.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import top.yimo.sys.domain.DictDataDO;

/**
 * 数据字典数据表
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年03月07日 17:42:42
 */
@Mapper
public interface DictDataDao {

	DictDataDO get(String dictType);

	DictDataDO getByTypeAndNo(String dictType, String dictNo);

	List<DictDataDO> listByPage(Map<String, Object> map);

	int count(Map<String, Object> map);

	int save(DictDataDO dictData);

	int update(DictDataDO dictData);

	int remove(String dict_type);

	int removeByNo(String dictType, String dictNo);

	int batchRemove(String[] dictTypes);

	int batchRemoveByNo(String dictType, String[] dictNos);

	List<DictDataDO> getAllActiveDictData(String dictType);

	@Select("select dict_no from sys_dict_data where dict_type=#{dictType} and status='1' and dict_name=#{dictName}")
	String getDictNoByName(String dictType, String dictName);
}
