package cn.tayle.sys.dao;

import cn.tayle.sys.domain.LogDO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

/**
 * 系统日志
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年05月28日 23:04:24
 */
@Mapper
public interface LogDao {

	LogDO get(Long id);
	
	List<LogDO> listByPage(Map<String,Object> map);
	
	int count(Map<String,Object> map);
	
	int save(LogDO log);
	
	int update(LogDO log);
	
	int remove(Long id);
	
	int batchRemove(Long[] ids);
	
	List<LogDO> exportData(LogDO log);
	
}
