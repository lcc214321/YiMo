package top.yimo.blog.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import top.yimo.blog.dao.CommentDao;
import top.yimo.blog.dao.ContentDao;
import top.yimo.blog.domain.CommentDO;
import top.yimo.blog.domain.ContentDO;
import top.yimo.blog.service.CommentService;
import top.yimo.common.exception.TipException;

@Service
@Transactional(rollbackFor = Exception.class)
public class CommentServiceImpl implements CommentService {
	@Autowired
	private CommentDao commentDao;
	@Autowired
	private ContentDao contentDao;

	@Override
	public CommentDO get(Integer coid) {
		return commentDao.get(coid);
	}

	@Override
	public List<CommentDO> listByPage(Map<String, Object> map) {
		return commentDao.listByPage(map);
	}

	@Override
	public int count(Map<String, Object> map) {
		return commentDao.count(map);
	}

	@Override
	@Transactional
	public int save(CommentDO comment) {
		Integer cid = comment.getCid();
		ContentDO content = contentDao.get(cid);
		Integer commentNum = content.getCommentNum();
		// 同时更新对应文章评论数
		if (contentDao.updateCommentNum(comment.getCid(), commentNum) > 0) {
			return commentDao.save(comment);
		} else {
			return 0;
		}
	}

	@Override
	public int update(CommentDO comment) {
		return commentDao.update(comment);
	}

	@Override
	public int remove(Integer coid) {
		return commentDao.remove(coid);
	}

	@Override
	public int batchRemove(Integer[] coids) {
		return commentDao.batchRemove(coids);
	}

	@Override
	public List<CommentDO> exportData(CommentDO comment) {
		List<CommentDO> exportData = commentDao.exportData(comment);
		return exportData;
	}

	@Override
	public String importData(List<CommentDO> commentList, boolean isCover) {
		if (commentList == null || commentList.size() == 0) {
			throw new TipException("导入数据不能为空！");
		}
		int successNum = 0;
		int failureNum = 0;
		StringBuilder successMsg = new StringBuilder();
		StringBuilder failureMsg = new StringBuilder();

		for (CommentDO comment : commentList) {
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
}
