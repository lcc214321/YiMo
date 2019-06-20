package top.yimo.blog.dao;

import top.yimo.blog.domain.CommentDO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

/**
 * 评论
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年06月17日 16:02:33
 */
@Mapper
public interface CommentDao {

	CommentDO get(Integer coid);
	
	List<CommentDO> listByPage(Map<String,Object> map);
	
	int count(Map<String,Object> map);
	
	int save(CommentDO comment);
	
	int update(CommentDO comment);
	
	int remove(Integer coid);
	
	int batchRemove(Integer[] coids);
	
	List<CommentDO> exportData(CommentDO comment);
	
}
