package cn.tayle.common.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tayle.sys.dao.DictDataDao;
import cn.tayle.sys.domain.DictDataDO;

@Service("dictService")
public class DictService {

	@Autowired
	private DictDataDao dictDataDao;

	public boolean contains(String dictNo, String str) {
		boolean isContains = false;
		if (StringUtils.isBlank(str) || StringUtils.isBlank(dictNo)) {
			return false;
		} else if (str.contains(",")) {
			String[] split = str.split(",");
			for (String s : split) {
				if (dictNo.equals(s)) {
					isContains = true;
					break;
				}
			}
		} else if (str.indexOf(dictNo) >= 0) {
			isContains = true;
		}
		return isContains;
	}

	public boolean contains(String dictNo, List<String> list) {
		return list.contains(dictNo);
	}

	public String getDictDataName(String dictType, String dictNo) {
		String name = "";
		DictDataDO dataDO = dictDataDao.getByTypeAndNo(dictType, dictNo);
		if (dataDO != null) {
			name = dataDO.getDictName();
		}
		return name;
	}

	/**
	 * 获取省份
	 * 
	 * @param dictType
	 * @param dictDescribe
	 * @return
	 */
	public List<DictDataDO> getProvinces(String dictType, String dictDescribe) {
		// TODO Auto-generated method stub
		return dictDataDao.getProvinces(dictType, dictDescribe);
	}

	/**
	 * 获取省份
	 * 
	 * @param dictType
	 * @param dictDescribe
	 * @return
	 */
	public List<DictDataDO> getNextCitys(String dictType, String dictNo, String dictDescribe) {
		if (!"".equals(dictNo) && dictNo != null) {
			if ("city".equals(dictDescribe)) {
				dictNo = dictNo.substring(0, 2) + "%";
			} else {
				dictNo = dictNo.substring(0, 4) + "%";
			}
		}
		return dictDataDao.getNextCitys(dictType, dictNo, dictDescribe);

	}

}
