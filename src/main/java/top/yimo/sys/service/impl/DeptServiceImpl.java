package top.yimo.sys.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import top.yimo.common.model.vo.TreeVo;
import top.yimo.common.util.TreeUtils;
import top.yimo.sys.dao.DeptDao;
import top.yimo.sys.domain.DeptDO;
import top.yimo.sys.service.DeptService;

@Service
@Transactional(rollbackFor = Exception.class)
public class DeptServiceImpl implements DeptService {
	@Autowired
	private DeptDao deptDao;

	@Override
	public DeptDO get(Long deptId) {
		return deptDao.get(deptId);
	}

	@Override
	public List<DeptDO> listByPage(Map<String, Object> map) {
		return deptDao.listByPage(map);
	}

	@Override
	public int count(Map<String, Object> map) {
		return deptDao.count(map);
	}

	@Override
	public int save(DeptDO dept) {
		return deptDao.save(dept);
	}

	@Override
	public int update(DeptDO dept) {
		return deptDao.update(dept);
	}

	@Override
	public int remove(Long deptId) {
		List<Long> allSubDeptIds = getAllSubDeptIds(deptId);
		for (Long subDeptId : allSubDeptIds) {// 级联删除下级部门
			deptDao.remove(subDeptId);
		}
		return deptDao.remove(deptId);
	}

	@Override
	public int batchRemove(Long[] deptIds) {
		return deptDao.batchRemove(deptIds);
	}

	@Override
	public TreeVo<DeptDO> getTree() {
		List<TreeVo<DeptDO>> treeList = new ArrayList<TreeVo<DeptDO>>();
		List<DeptDO> depts = deptDao.getTree();
		for (DeptDO dept : depts) {
			TreeVo<DeptDO> tree = new TreeVo<DeptDO>();
			tree.setId(dept.getDeptId().toString());
			tree.setPId(dept.getParentId().toString());
			tree.setText(dept.getDeptName());
			Map<String, Object> state = new HashMap<>(16);
			state.put("opened", true);
			tree.setState(state);
			treeList.add(tree);
		}
		TreeVo<DeptDO> tree = TreeUtils.build(treeList, "");
		return tree;
	}

	@Override
	public List<Long> getAllSubDeptIds(long deptId) {
		return getSubDeptIds(deptId);
	}

	public List<Long> getSubDeptIds(long deptId) {
		List<Long> list = new ArrayList<Long>();
		list.add(deptId);
		List<Long> subDeptIds = deptDao.getSubDeptIds(deptId);
		if (subDeptIds != null && !subDeptIds.isEmpty() && subDeptIds.size() > 0) {
			for (Long subDeptId : subDeptIds) {
				if (subDeptId != null) {
					List<Long> subDeptIds2 = getSubDeptIds(subDeptId);
					list.addAll(subDeptIds2);
				}
			}
		}
		return list;
	}

	@Override
	public List<DeptDO> list(Map<String, Object> map) {
		return deptDao.list(map);
	}
}
