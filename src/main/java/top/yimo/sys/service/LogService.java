package top.yimo.sys.service;

import top.yimo.sys.domain.LogDO;

import java.util.List;
import java.util.Map;

/**
 * 系统日志
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年05月28日 23:04:24
 */
public interface LogService {
	//通过主键获取单个数据
	LogDO get(Long id);
	//获取列表数据
	List<LogDO> listByPage(Map<String, Object> map);
	//统计笔数
	int count(Map<String, Object> map);
	//新增保存
	int save(LogDO log);
	//更新
	int update(LogDO log);
	//删除
	int remove(Long id);
	//批量删除
	int batchRemove(Long[] ids);
	//数据导出
	List<LogDO> exportData(LogDO log);
	//数据导入
	String importData(List<LogDO> logList, boolean isCover);

}
