package top.yimo.blog.service;

import java.util.List;
import java.util.Map;

import top.yimo.blog.domain.CommentDO;

/**
 * 评论
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年06月17日 16:02:33
 */
public interface CommentService {
	// 通过主键获取单个数据
	CommentDO get(Integer coid);

	// 获取列表数据
	List<CommentDO> listByPage(Map<String, Object> map);

	// 统计笔数
	int count(Map<String, Object> map);

	// 新增保存
	int save(CommentDO comment);

	// 更新
	int update(CommentDO comment);

	// 删除
	int remove(Integer coid);

	// 批量删除
	int batchRemove(Integer[] coids);

	// 数据导出
	List<CommentDO> exportData(CommentDO comment);

	// 数据导入
	String importData(List<CommentDO> commentList, boolean isCover);

	// 审批评论
	int approve(Integer coid);

	/**
	 * 获取最新的评论
	 */
	List<CommentDO> recentcomment(int limit);
}
