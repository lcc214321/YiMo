package top.yimo.blog.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import top.yimo.blog.domain.MetaDO;

/**
 * 项目
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年06月20日 15:56:27
 */
@Mapper
public interface MetaDao {

	MetaDO get(Integer mid);

	List<MetaDO> listByPage(Map<String, Object> map);

	int count(Map<String, Object> map);

	int save(MetaDO meta);

	int update(MetaDO meta);

	int remove(Integer mid);

	int batchRemove(Integer[] mids);

	List<MetaDO> exportData(MetaDO meta);

	List<MetaDO> getMetasByType(String type);

}
