package top.yimo.generator.service.impl;

import java.io.ByteArrayOutputStream;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipOutputStream;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.yimo.generator.GenUtils;
import top.yimo.generator.dao.GeneratorMapper;
import top.yimo.generator.service.GeneratorService;

/**
 * 
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年1月9日 下午6:05:27
 */
@Service
public class GeneratorServiceImpl implements GeneratorService {
	@Autowired
	GeneratorMapper generatorMapper;

	@Override
	public List<Map<String, Object>> list() {
		List<Map<String, Object>> list = generatorMapper.list();
		return list;
	}

	@Override
	public byte[] generatorCode(String[] tableNames) {
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		ZipOutputStream zip = new ZipOutputStream(outputStream);
		for(String tableName : tableNames){
			//查询表信息
			Map<String, String> table = generatorMapper.get(tableName);
			//查询列信息
			List<Map<String, String>> columns = generatorMapper.listColumns(tableName);
			//生成代码
			try {
				GenUtils.generatorCode(table, columns, zip);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		IOUtils.closeQuietly(zip);
		return outputStream.toByteArray();
	}

}
