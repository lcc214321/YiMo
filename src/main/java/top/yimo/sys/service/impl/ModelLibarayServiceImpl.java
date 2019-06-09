package top.yimo.sys.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

import top.yimo.common.exception.TipException;
import top.yimo.sys.dao.ModelLibarayDao;
import top.yimo.sys.domain.ModelLibarayDO;
import top.yimo.sys.service.ModelLibarayService;



@Service
@Transactional(rollbackFor = Exception.class)
public class ModelLibarayServiceImpl implements ModelLibarayService {
	@Autowired
	private ModelLibarayDao modelLibarayDao;
	
	@Override
	public ModelLibarayDO get(Long id){
		return modelLibarayDao.get(id);
	}
	
	@Override
	public List<ModelLibarayDO> listByPage(Map<String, Object> map){
		return modelLibarayDao.listByPage(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return modelLibarayDao.count(map);
	}
	
	@Override
	public int save(ModelLibarayDO modelLibaray){
		return modelLibarayDao.save(modelLibaray);
	}
	
	@Override
	public int update(ModelLibarayDO modelLibaray){
		return modelLibarayDao.update(modelLibaray);
	}
	
	@Override
	public int remove(Long id){
		return modelLibarayDao.remove(id);
	}
	
	@Override
	public int batchRemove(Long[] ids){
		return modelLibarayDao.batchRemove(ids);
	}
	
	@Override
	public List<ModelLibarayDO> exportData(ModelLibarayDO modelLibaray) {
		List<ModelLibarayDO> exportData = modelLibarayDao.exportData(modelLibaray);
		return exportData;
	}
	
	@Override
	public String importData(List<ModelLibarayDO> modelLibarayList, boolean isCover) {
		if (modelLibarayList == null || modelLibarayList.size() == 0) {
			throw new TipException("导入数据不能为空！");
		}
		int successNum = 0;
		int failureNum = 0;
		StringBuilder successMsg = new StringBuilder();
		StringBuilder failureMsg = new StringBuilder();

		for (ModelLibarayDO modelLibaray : modelLibarayList) {
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
