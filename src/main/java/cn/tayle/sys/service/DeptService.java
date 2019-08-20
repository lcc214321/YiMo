package cn.tayle.sys.service;

import java.util.List;
import java.util.Map;

import cn.tayle.common.model.vo.TreeVo;
import cn.tayle.sys.domain.DeptDO;

/**
 * 部门管理
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年22月24日 17:22:00
 */
public interface DeptService {

	DeptDO get(Long deptId);

	List<DeptDO> listByPage(Map<String, Object> map);

	List<DeptDO> list(Map<String, Object> map);

	int count(Map<String, Object> map);

	int save(DeptDO dept);

	int update(DeptDO dept);

	int remove(Long deptId);

	int batchRemove(Long[] deptIds);

	TreeVo<DeptDO> getTree();

	/**
	 * 获取项下所有下级部门id
	 */
	List<Long> getAllSubDeptIds(long deptId);
}
