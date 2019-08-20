package cn.tayle.sys.service;

import java.util.List;
import java.util.Map;

import cn.tayle.sys.domain.RoleDO;

/**
 * 角色
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年05月28日 22:08:56
 */
public interface RoleService {
	// 通过主键获取单个数据
	RoleDO get(Long roleId);

	// 获取列表数据
	List<RoleDO> listByPage(Map<String, Object> map);

	// 统计笔数
	int count(Map<String, Object> map);

	// 新增保存
	int save(RoleDO role);

	// 更新
	int update(RoleDO role);

	// 删除
	int remove(Long roleId);

	// 批量删除
	int batchRemove(Long[] roleIds);

	// 数据导出
	List<RoleDO> exportData(RoleDO role);

	// 根据用户id获取其拥有的角色信息
	List<RoleDO> getRolesByUserId(Long userId);
}
