package top.yimo.blog.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import top.yimo.blog.dao.ContentDao;
import top.yimo.blog.domain.ContentDO;
import top.yimo.blog.model.vo.ArchiveVo;
import top.yimo.blog.service.ContentService;
import top.yimo.common.exception.TipException;

@Service
@Transactional(rollbackFor = Exception.class)
public class ContentServiceImpl implements ContentService {
	@Autowired
	private ContentDao contentDao;

	@Override
	public ContentDO get(Integer cid) {
		return contentDao.get(cid);
	}

	@Override
	public List<ContentDO> listByPage(Map<String, Object> map) {
		return contentDao.listByPage(map);
	}

	@Override
	public int count(Map<String, Object> map) {
		return contentDao.count(map);
	}

	@Override
	public int save(ContentDO content) {
		return contentDao.save(content);
	}

	@Override
	public int update(ContentDO content) {
		return contentDao.update(content);
	}

	@Override
	public int remove(Integer cid) {
		return contentDao.remove(cid);
	}

	@Override
	public int batchRemove(Integer[] cids) {
		return contentDao.batchRemove(cids);
	}

	@Override
	public List<ContentDO> exportData(ContentDO content) {
		List<ContentDO> exportData = contentDao.exportData(content);
		return exportData;
	}

	@Override
	public String importData(List<ContentDO> contentList, boolean isCover) {
		if (contentList == null || contentList.size() == 0) {
			throw new TipException("导入数据不能为空！");
		}
		int successNum = 0;
		int failureNum = 0;
		StringBuilder successMsg = new StringBuilder();
		StringBuilder failureMsg = new StringBuilder();

		for (ContentDO content : contentList) {
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
	public List<ArchiveVo> getArchives() {
		List<ArchiveVo> list = contentDao.getArchivesByCreatedDate();// 获取分组信息
		for (ArchiveVo archive : list) {// 根据分组信息获取对应月份下明细信息
			String date = archive.getDate();
			List<ContentDO> articles = contentDao.getArchivesByDate(date);
			archive.setArticles(articles);
		}
		return list;
	}

	@Override
	public List<ContentDO> getArticlesByKeyWord(ContentDO content) {
		return contentDao.getArticlesByKeyWord(content);
	}

	@Override
	public ContentDO getPage(String slug) {
		return contentDao.getPage(slug);
	}
}
