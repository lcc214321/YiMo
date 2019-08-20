package cn.tayle.sys.dao;

import cn.tayle.sys.domain.ModelLibarayDO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

/**
 * 系统模型库
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年06月08日 13:27:18
 */
@Mapper
public interface ModelLibarayDao {

	ModelLibarayDO get(Long id);
	
	List<ModelLibarayDO> listByPage(Map<String,Object> map);
	
	int count(Map<String,Object> map);
	
	int save(ModelLibarayDO modelLibaray);
	
	int update(ModelLibarayDO modelLibaray);
	
	int remove(Long id);
	
	int batchRemove(Long[] ids);
	
	List<ModelLibarayDO> exportData(ModelLibarayDO modelLibaray);
	
}
