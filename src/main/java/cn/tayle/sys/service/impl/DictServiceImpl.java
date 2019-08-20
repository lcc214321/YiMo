package cn.tayle.sys.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

import cn.tayle.sys.dao.DictDao;
import cn.tayle.sys.domain.DictDO;
import cn.tayle.sys.service.DictService;



@Service
@Transactional(rollbackFor = Exception.class)
public class DictServiceImpl implements DictService {
	@Autowired
	private DictDao dictDao;
	
	@Override
	public DictDO get(String dictType){
		return dictDao.get(dictType);
	}
	
	@Override
	public List<DictDO> listByPage(Map<String, Object> map){
		return dictDao.listByPage(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return dictDao.count(map);
	}
	
	@Override
	public int save(DictDO dict){
		return dictDao.save(dict);
	}
	
	@Override
	public int update(DictDO dict){
		return dictDao.update(dict);
	}
	
	@Override
	public int remove(String dictType){
		return dictDao.remove(dictType);
	}
	
	@Override
	public int batchRemove(String[] dictTypes){
		return dictDao.batchRemove(dictTypes);
	}
	
}
