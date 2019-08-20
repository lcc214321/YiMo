package cn.tayle.sys.service;

import cn.tayle.sys.domain.ModelLibarayDO;

import java.util.List;
import java.util.Map;

/**
 * 系统模型库
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年06月08日 13:27:18
 */
public interface ModelLibarayService {
	//通过主键获取单个数据
	ModelLibarayDO get(Long id);
	//获取列表数据
	List<ModelLibarayDO> listByPage(Map<String, Object> map);
	//统计笔数
	int count(Map<String, Object> map);
	//新增保存
	int save(ModelLibarayDO modelLibaray);
	//更新
	int update(ModelLibarayDO modelLibaray);
	//删除
	int remove(Long id);
	//批量删除
	int batchRemove(Long[] ids);
	//数据导出
	List<ModelLibarayDO> exportData(ModelLibarayDO modelLibaray);
	//数据导入
	String importData(List<ModelLibarayDO> modelLibarayList, boolean isCover);

}
