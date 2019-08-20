package cn.tayle.sys.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.cache.annotation.CacheEvict;

import cn.tayle.common.constant.WebConstant;
import cn.tayle.sys.domain.DictDO;

/**
 * 数据字典目标表
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年03月07日 17:18:06
 */
@Mapper
public interface DictDao {

	DictDO get(String dictType);

	List<DictDO> listByPage(Map<String, Object> map);

	int count(Map<String, Object> map);

	@CacheEvict(value = WebConstant.DICT_CACHE, allEntries = true)
	int save(DictDO dict);

	@CacheEvict(value = WebConstant.DICT_CACHE, allEntries = true)
	int update(DictDO dict);

	@CacheEvict(value = WebConstant.DICT_CACHE, allEntries = true)
	int remove(String dict_type);

	@CacheEvict(value = WebConstant.DICT_CACHE, allEntries = true)
	int batchRemove(String[] dictTypes);
}
