package cn.tayle.blog.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.tayle.blog.dao.CommentDao;
import cn.tayle.blog.dao.ContentDao;
import cn.tayle.blog.domain.CommentDO;
import cn.tayle.blog.domain.ContentDO;
import cn.tayle.blog.service.CommentService;
import cn.tayle.sys.service.DictDataService;

@Service
@Transactional(rollbackFor = Exception.class)
public class CommentServiceImpl implements CommentService {
	@Autowired
	private CommentDao commentDao;
	@Autowired
	private ContentDao contentDao;
	@Autowired
	DictDataService dict;

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
		return "";
	}

	@Override
	public int approve(Integer coid) {
		CommentDO comment = commentDao.get(coid);
		comment.setStatus("approved");
		return commentDao.update(comment);
	}

	@Override
	public List<CommentDO> recentcomment(int limit) {

		return commentDao.recentcomment(limit);
	}
}
