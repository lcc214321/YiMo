package top.yimo.sys.service;

import top.yimo.sys.domain.ModelCatalogDO;

import java.util.List;
import java.util.Map;

/**
 * 系统模型目录
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年06月08日 13:27:18
 */
public interface ModelCatalogService {
	//通过主键获取单个数据
	ModelCatalogDO get(Long id);
	//获取列表数据
	List<ModelCatalogDO> listByPage(Map<String, Object> map);
	//统计笔数
	int count(Map<String, Object> map);
	//新增保存
	int save(ModelCatalogDO modelCatalog);
	//更新
	int update(ModelCatalogDO modelCatalog);
	//删除
	int remove(Long id);
	//批量删除
	int batchRemove(Long[] ids);
	//数据导出
	List<ModelCatalogDO> exportData(ModelCatalogDO modelCatalog);
	//数据导入
	String importData(List<ModelCatalogDO> modelCatalogList, boolean isCover);

}
