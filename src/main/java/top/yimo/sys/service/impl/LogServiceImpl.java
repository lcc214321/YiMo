package top.yimo.sys.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

import top.yimo.common.exception.TipException;
import top.yimo.sys.dao.LogDao;
import top.yimo.sys.domain.LogDO;
import top.yimo.sys.service.LogService;



@Service
@Transactional(rollbackFor = Exception.class)
public class LogServiceImpl implements LogService {
	@Autowired
	private LogDao logDao;
	
	@Override
	public LogDO get(Long id){
		return logDao.get(id);
	}
	
	@Override
	public List<LogDO> listByPage(Map<String, Object> map){
		return logDao.listByPage(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return logDao.count(map);
	}
	
	@Override
	public int save(LogDO log){
		return logDao.save(log);
	}
	
	@Override
	public int update(LogDO log){
		return logDao.update(log);
	}
	
	@Override
	public int remove(Long id){
		return logDao.remove(id);
	}
	
	@Override
	public int batchRemove(Long[] ids){
		return logDao.batchRemove(ids);
	}
	
	@Override
	public List<LogDO> exportData(LogDO log) {
		List<LogDO> exportData = logDao.exportData(log);
		return exportData;
	}
	
	@Override
	public String importData(List<LogDO> logList, boolean isCover) {
		if (logList == null || logList.size() == 0) {
			throw new TipException("导入数据不能为空！");
		}
		int successNum = 0;
		int failureNum = 0;
		StringBuilder successMsg = new StringBuilder();
		StringBuilder failureMsg = new StringBuilder();

		for (LogDO log : logList) {
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
