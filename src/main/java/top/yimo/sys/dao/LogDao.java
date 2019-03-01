package top.yimo.sys.dao;

import top.yimo.sys.domain.LogDO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

/**
 * 系统日志
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年07月01日 18:07:27
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
}
