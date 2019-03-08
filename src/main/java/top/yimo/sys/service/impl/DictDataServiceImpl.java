package top.yimo.sys.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

import top.yimo.sys.dao.DictDataDao;
import top.yimo.sys.domain.DictDataDO;
import top.yimo.sys.service.DictDataService;



@Service
@Transactional(rollbackFor = Exception.class)
public class DictDataServiceImpl implements DictDataService {
	@Autowired
	private DictDataDao dictDataDao;
	
	@Override
	public DictDataDO get(String dictType){
		return dictDataDao.get(dictType);
	}
	
	@Override
	public List<DictDataDO> listByPage(Map<String, Object> map){
		return dictDataDao.listByPage(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return dictDataDao.count(map);
	}
	
	@Override
	public int save(DictDataDO dictData){
		return dictDataDao.save(dictData);
	}
	
	@Override
	public int update(DictDataDO dictData){
		return dictDataDao.update(dictData);
	}
	
	@Override
	public int remove(String dictType){
		return dictDataDao.remove(dictType);
	}
	
	@Override
	public int batchRemove(String[] dictTypes){
		return dictDataDao.batchRemove(dictTypes);
	}
	
}
