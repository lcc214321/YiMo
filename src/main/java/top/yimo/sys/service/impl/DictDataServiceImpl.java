package top.yimo.sys.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import top.yimo.sys.dao.DictDataDao;
import top.yimo.sys.domain.DictDataDO;
import top.yimo.sys.service.DictDataService;

/**
 * 数据字典服务层，CRUD以及页面动态加载回显
 * 
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年4月12日 上午11:47:45
 */
@Service("dict")
@Transactional(rollbackFor = Exception.class)
public class DictDataServiceImpl implements DictDataService {
	@Autowired
	private DictDataDao dictDataDao;

	@Override
	public DictDataDO get(String dictType) {
		return dictDataDao.get(dictType);
	}

	@Override
	public List<DictDataDO> listByPage(Map<String, Object> map) {
		return dictDataDao.listByPage(map);
	}

	@Override
	public int count(Map<String, Object> map) {
		return dictDataDao.count(map);
	}

	@Override
	public int save(DictDataDO dictData) {
		return dictDataDao.save(dictData);
	}

	@Override
	public int update(DictDataDO dictData) {
		return dictDataDao.update(dictData);
	}

	@Override
	public int remove(String dictType) {
		return dictDataDao.remove(dictType);
	}

	@Override
	public int batchRemove(String[] dictTypes) {
		return dictDataDao.batchRemove(dictTypes);
	}

	@Override
	public DictDataDO getByTypeAndNo(String dictType, String dictNo) {
		return dictDataDao.getByTypeAndNo(dictType, dictNo);
	}

	@Override
	public List<DictDataDO> getDictDatas(String dictType, String dictNo) {
		return dictDataDao.getDictDatas(dictType, dictNo);
	}

	@Override
	public int removeByNo(String dictType, String dictNo) {
		return dictDataDao.removeByNo(dictType, dictNo);
	}

	@Override
	public int batchRemoveByNo(String dictType, String[] dictNos) {
		return dictDataDao.batchRemoveByNo(dictType, dictNos);
	}

	@Override
	public List<DictDataDO> getAllActiveDictData(String dictType) {
		return dictDataDao.getAllActiveDictData(dictType);
	}

	/**
	 * 获取单个dictData
	 * 
	 * @param dictType 字典类型
	 * @param dictNo   字典编号
	 * @return
	 */
	public DictDataDO getDictData(String dictType, String dictNo) {
		DictDataDO dict = getByTypeAndNo(dictType, dictNo);
		return dict;
	}

	/**
	 * 获取单个dictName
	 * 
	 * @param dictType 字典类型
	 * @param dictNo   字典编号
	 * @return
	 */
	public String getDictName(String dictType, String dictNo) {
		return getDictData(dictType, dictNo).getDictName();
	}

	/**
	 * 获取单个dictName
	 * 
	 * @param dictType 字典类型
	 * @param dictNo   字典编号
	 * @return
	 */
	public String getDictNoByName(String dictType, String dictName) {
		return dictDataDao.getDictNoByName(dictType, dictName);
	}

	/**
	 * 获取某一个类型的dictData
	 * 
	 * @param dictType
	 * @return
	 */
	public List<DictDataDO> getDictDatas(String dictType) {
		return getAllActiveDictData(dictType);
	}
	
	/**
	 * 获取下一级城市
	 * @param dictType
	 * @param dictNo
	 * @param dictDescribe
	 * @return
	 */
	@Override
	public List<DictDataDO> getNextCitys(String dictType, String dictNo, String dictDescribe) {
		// TODO Auto-generated method stub
		return dictDataDao.getNextCitys(dictType, dictNo, dictDescribe);
	}

}
