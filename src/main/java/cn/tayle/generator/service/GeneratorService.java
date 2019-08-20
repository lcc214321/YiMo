package cn.tayle.generator.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

/**
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年1月9日 下午6:04:49
 */
@Service
public interface GeneratorService {
	List<Map<String, Object>> list();

	byte[] generatorCode(String[] tableNames);
}
