package top.yimo.sys.service;

import top.yimo.sys.domain.LogDO;

import java.util.List;
import java.util.Map;

/**
 * 系统日志
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年07月01日 18:07:27
 */
public interface LogService {
	
	LogDO get(Long id);
	
	List<LogDO> listByPage(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(LogDO log);
	
	int update(LogDO log);
	
	int remove(Long id);
	
	int batchRemove(Long[] ids);
}
