package cn.tayle.sys.dao;

import cn.tayle.sys.domain.ModelCatalogDO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

/**
 * 系统模型目录
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年06月08日 13:27:18
 */
@Mapper
public interface ModelCatalogDao {

	ModelCatalogDO get(Long id);
	
	List<ModelCatalogDO> listByPage(Map<String,Object> map);
	
	int count(Map<String,Object> map);
	
	int save(ModelCatalogDO modelCatalog);
	
	int update(ModelCatalogDO modelCatalog);
	
	int remove(Long id);
	
	int batchRemove(Long[] ids);
	
	List<ModelCatalogDO> exportData(ModelCatalogDO modelCatalog);
	
}
