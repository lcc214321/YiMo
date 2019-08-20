package cn.tayle.sys.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

import cn.tayle.common.exception.TipException;
import cn.tayle.sys.dao.ModelCatalogDao;
import cn.tayle.sys.domain.ModelCatalogDO;
import cn.tayle.sys.service.ModelCatalogService;



@Service
@Transactional(rollbackFor = Exception.class)
public class ModelCatalogServiceImpl implements ModelCatalogService {
	@Autowired
	private ModelCatalogDao modelCatalogDao;
	
	@Override
	public ModelCatalogDO get(Long id){
		return modelCatalogDao.get(id);
	}
	
	@Override
	public List<ModelCatalogDO> listByPage(Map<String, Object> map){
		return modelCatalogDao.listByPage(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return modelCatalogDao.count(map);
	}
	
	@Override
	public int save(ModelCatalogDO modelCatalog){
		return modelCatalogDao.save(modelCatalog);
	}
	
	@Override
	public int update(ModelCatalogDO modelCatalog){
		return modelCatalogDao.update(modelCatalog);
	}
	
	@Override
	public int remove(Long id){
		return modelCatalogDao.remove(id);
	}
	
	@Override
	public int batchRemove(Long[] ids){
		return modelCatalogDao.batchRemove(ids);
	}
	
	@Override
	public List<ModelCatalogDO> exportData(ModelCatalogDO modelCatalog) {
		List<ModelCatalogDO> exportData = modelCatalogDao.exportData(modelCatalog);
		return exportData;
	}
	
	@Override
	public String importData(List<ModelCatalogDO> modelCatalogList, boolean isCover) {
		if (modelCatalogList == null || modelCatalogList.size() == 0) {
			throw new TipException("导入数据不能为空！");
		}
		int successNum = 0;
		int failureNum = 0;
		StringBuilder successMsg = new StringBuilder();
		StringBuilder failureMsg = new StringBuilder();

		for (ModelCatalogDO modelCatalog : modelCatalogList) {
		//			try {
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
}
