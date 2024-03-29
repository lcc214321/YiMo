package top.yimo.sys.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;

import top.yimo.common.constant.WebConstant;
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

	@Cacheable(value = WebConstant.DICT_CACHE)
	DictDataDO getByTypeAndNo(String dictType, String dictNo);

	List<DictDataDO> getDictDatas(String dictType, String dictNo);

	List<DictDataDO> listByPage(Map<String, Object> map);

	int count(Map<String, Object> map);

	@CacheEvict(value = WebConstant.DICT_CACHE, allEntries = true)
	int save(DictDataDO dictData);

	@CacheEvict(value = WebConstant.DICT_CACHE, allEntries = true)
	int update(DictDataDO dictData);

	@CacheEvict(value = WebConstant.DICT_CACHE, allEntries = true)
	int remove(String dict_type);

	@CacheEvict(value = WebConstant.DICT_CACHE, allEntries = true)
	int removeByNo(String dictType, String dictNo);

	@CacheEvict(value = WebConstant.DICT_CACHE, allEntries = true)
	int batchRemove(String[] dictTypes);

	@CacheEvict(value = WebConstant.DICT_CACHE, allEntries = true)
	int batchRemoveByNo(String dictType, String[] dictNos);

	List<DictDataDO> getAllActiveDictData(String dictType);

	@Select("select dict_no from sys_dict_data where dict_type=#{dictType} and status='1' and dict_name=#{dictName}")
	String getDictNoByName(String dictType, String dictName);

	// 获取省份数据
	List<DictDataDO> getProvinces(String dictType, String dictDescribe);

	// 获取下一级城市
	List<DictDataDO> getNextCitys(String dictType, String dictNo, String dictDescribe);
}
