package top.yimo.sys.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

import top.yimo.sys.dao.LogDao;
import top.yimo.sys.domain.LogDO;
import top.yimo.sys.service.LogService;



@Service
@Transactional(rollbackFor = Exception.class)
public class LogServiceImpl implements LogService {
	@Autowired
	private LogDao logDao;
	
	@Override
	public LogDO get(Long id){
		return logDao.get(id);
	}
	
	@Override
	public List<LogDO> listByPage(Map<String, Object> map){
		return logDao.listByPage(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return logDao.count(map);
	}
	
	@Override
	public int save(LogDO log){
		return logDao.save(log);
	}
	
	@Override
	public int update(LogDO log){
		return logDao.update(log);
	}
	
	@Override
	public int remove(Long id){
		return logDao.remove(id);
	}
	
	@Override
	public int batchRemove(Long[] ids){
		return logDao.batchRemove(ids);
	}
	
}
