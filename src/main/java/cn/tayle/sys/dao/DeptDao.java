package cn.tayle.sys.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import cn.tayle.sys.domain.DeptDO;

/**
 * 部门管理
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年22月24日 17:22:00
 */
@Mapper
public interface DeptDao {

	DeptDO get(Long deptId);

	List<DeptDO> listByPage(Map<String, Object> map);

	List<DeptDO> list(Map<String, Object> map);

	int count(Map<String, Object> map);

	int save(DeptDO dept);

	int update(DeptDO dept);

	int remove(Long dept_id);

	int batchRemove(Long[] deptIds);

	List<DeptDO> getTree();

	/**
	 * 查找下级部门id
	 */
	@Select("select dept_id from sys_dept where parent_id=#{deptId} and status='1' ")
	List<Long> getSubDeptIds(long deptId);
}
