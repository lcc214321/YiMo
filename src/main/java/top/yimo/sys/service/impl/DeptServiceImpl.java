package top.yimo.sys.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.yimo.common.model.vo.TreeVo;
import top.yimo.common.util.YiMoUtils;
import top.yimo.sys.dao.DeptDao;
import top.yimo.sys.domain.DeptDO;
import top.yimo.sys.service.DeptService;

@Service
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
		return deptDao.remove(deptId);
	}

	@Override
	public int batchRemove(Long[] deptIds) {
		return deptDao.batchRemove(deptIds);
	}

	@Override
	public TreeVo<DeptDO> getTree() {
		List<TreeVo> treeList = new ArrayList<TreeVo>();
		List<DeptDO> depts = deptDao.getTree();
		for (DeptDO dept : depts) {
			TreeVo tree = new TreeVo();
			tree.setId(dept.getDeptId().toString());
            tree.setPId(dept.getParentId().toString());
            tree.setText(dept.getDeptName());
            Map<String, Object> state = new HashMap<>(16);
            state.put("opened", true);
            tree.setState(state);
            treeList.add(tree);
		}
		System.out.println(treeList.size());
		
		TreeVo tree = YiMoUtils.build(treeList);
		System.out.println(tree.toString());
		
		return tree;
	}

}
