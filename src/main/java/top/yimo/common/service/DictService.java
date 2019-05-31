package top.yimo.common.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

@Service("dictService")
public class DictService {
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
}
