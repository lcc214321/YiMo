package top.yimo.blog.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import top.yimo.blog.dao.MetaDao;
import top.yimo.blog.domain.MetaDO;
import top.yimo.blog.service.MetaService;
import top.yimo.common.exception.TipException;

@Service
@Transactional(rollbackFor = Exception.class)
public class MetaServiceImpl implements MetaService {
	@Autowired
	private MetaDao metaDao;

	@Override
	public MetaDO get(Integer mid) {
		return metaDao.get(mid);
	}

	@Override
	public List<MetaDO> listByPage(Map<String, Object> map) {
		return metaDao.listByPage(map);
	}

	@Override
	public int count(Map<String, Object> map) {
		return metaDao.count(map);
	}

	@Override
	public int save(MetaDO meta) {
		return metaDao.save(meta);
	}

	@Override
	public int update(MetaDO meta) {
		return metaDao.update(meta);
	}

	@Override
	public int remove(Integer mid) {
		return metaDao.remove(mid);
	}

	@Override
	public int batchRemove(Integer[] mids) {
		return metaDao.batchRemove(mids);
	}

	@Override
	public List<MetaDO> exportData(MetaDO meta) {
		List<MetaDO> exportData = metaDao.exportData(meta);
		return exportData;
	}

	@Override
	public String importData(List<MetaDO> metaList, boolean isCover) {
		if (metaList == null || metaList.size() == 0) {
			throw new TipException("导入数据不能为空！");
		}
		int successNum = 0;
		int failureNum = 0;
		StringBuilder successMsg = new StringBuilder();
		StringBuilder failureMsg = new StringBuilder();

		for (MetaDO meta : metaList) {
			// try {
			// TODO 完成数据有效性校验与唯一性校验
			// 验证是否存在数据
//				UserDO userdb = userDao.findByUserName(user.getUserName()); 
//				if (userdb == null) {// 不存在新增 
//					user.setPassword(password); 
//					user.setCreateUserId(operuserId); 
//					this.save(user); 
//					successNum++; 
//					successMsg.append("<br/>" + successNum + "、账号 " + user.getName() + " 导入成功"); 
//				} else if (isCover) {// 覆盖 
//					
//					this.update(user); 
//					successNum++; 
//					successMsg.append("<br/>" + successNum + "、账号 " + user.getName() + " 更新成功"); 
//				} else { 
//					failureNum++; 
//					failureMsg.append("<br/>" + failureNum + "、账号 " + user.getName() + " 已存在"); 
//				} 
//			} catch (Exception e) { 
//				failureNum++; 
//				String msg = "<br/>" + failureNum + "、账号 " + user.getName() + " 导入失败："; 
//				failureMsg.append(msg + e.getMessage()); 
//				log.error(msg, e); 
		}
		if (failureNum > 0) {
			failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
			throw new TipException(failureMsg.toString());
		} else {
			successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
		}
		return successMsg.toString();
	}

	@Override
	public List<MetaDO> getMetas(String type) {
		return metaDao.getMetasByType(type);
	}
}
