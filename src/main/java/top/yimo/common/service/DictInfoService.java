package top.yimo.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.yimo.sys.domain.DictDataDO;
import top.yimo.sys.service.DictDataService;

@Service("dict")
public class DictInfoService {
	@Autowired
	DictDataService dictData;
	/**
	 * 获取单个dictData
	 * @param dictType 字典类型
	 * @param dictNo 字典编号
	 * @return
	 */
	public DictDataDO getDictName(String dictType,String dictNo) {
		DictDataDO dict = dictData.getByTypeAndNo(dictType, dictNo);
		return dict;
	}
	
	/**
	 * 获取某一个类型的dictData
	 * @param dictType
	 * @return
	 */
	public List<DictDataDO> getDictData(String dictType){
		return dictData.getAllActiveDictData(dictType);
	}
}
