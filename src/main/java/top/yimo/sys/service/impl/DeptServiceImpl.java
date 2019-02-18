package top.yimo.sys.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.yimo.common.model.vo.TreeVo;
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
	public List<TreeVo> getTree() {

		return null;
	}

}
