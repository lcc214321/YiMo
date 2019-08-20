package cn.tayle.sys.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import cn.tayle.common.constant.WebConstant;
import cn.tayle.sys.dao.DictDataDao;
import cn.tayle.sys.domain.DictDataDO;
import cn.tayle.sys.service.DictDataService;

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
@Slf4j
public class DictDataServiceImpl implements DictDataService {

	@Autowired
	private DictDataDao dictDataDao;

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
	@Cacheable(value = WebConstant.DICT_CACHE)
	public DictDataDO getByTypeAndNo(String dictType, String dictNo) {
		return dictDataDao.getByTypeAndNo(dictType, dictNo);
	}

	@Override
	@Cacheable(value = WebConstant.DICT_CACHE)
	public List<DictDataDO> getDictDatas(String dictType, String dictNos) {
		return dictDataDao.getDictDatas(dictType, dictNos);
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
	@Cacheable(value = WebConstant.DICT_CACHE, key = "AllActiveDictData")
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
	@Cacheable(value = WebConstant.DICT_CACHE)
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
	@Cacheable(value = WebConstant.DICT_CACHE)
	public List<DictDataDO> getDictDatas(String dictType) {
		log.debug("第一次加载未使用缓存{}", dictType);
		return getAllActiveDictData(dictType);
	}

	/**
	 * 获取下一级城市
	 * 
	 * @param dictType
	 * @param dictNo
	 * @param dictDescribe
	 * @return
	 */
	@Override
	public List<DictDataDO> getNextCitys(String dictType, String dictNo, String dictDescribe) {
		return dictDataDao.getNextCitys(dictType, dictNo, dictDescribe);
	}

}
