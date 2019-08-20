package cn.tayle.blog.service;

import java.util.List;
import java.util.Map;

import cn.tayle.blog.domain.MetaDO;

/**
 * 项目
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年06月20日 15:56:27
 */
public interface MetaService {
	// 通过主键获取单个数据
	MetaDO get(Integer mid);

	// 获取列表数据
	List<MetaDO> listByPage(Map<String, Object> map);

	// 统计笔数
	int count(Map<String, Object> map);

	// 新增保存
	int save(MetaDO meta);

	// 更新
	int update(MetaDO meta);

	// 删除
	int remove(Integer mid);

	// 批量删除
	int batchRemove(Integer[] mids);

	// 数据导出
	List<MetaDO> exportData(MetaDO meta);

	// 数据导入
	String importData(List<MetaDO> metaList, boolean isCover);

	List<MetaDO> getMetas(String type);

}
