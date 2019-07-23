package top.yimo.blog.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import top.yimo.blog.domain.ContentDO;
import top.yimo.blog.model.vo.ArchiveVo;

/**
 * 内容表
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年06月17日 16:02:33
 */
@Mapper
public interface ContentDao {

	ContentDO get(Integer cid);

	List<ContentDO> listByPage(Map<String, Object> map);

	int count(Map<String, Object> map);

	int save(ContentDO content);

	int update(ContentDO content);

	int remove(Integer cid);

	int batchRemove(Integer[] cids);

	List<ContentDO> exportData(ContentDO content);

	@Select("select   substring(created,1,7)  as date, count(*) as count from b_content where status = 'publish' group by date order by date desc")
	List<ArchiveVo> getArchivesByCreatedDate();

	@Select("select   *  from b_content where status = 'publish'  and substring(created,1,7) =#{date} and type='article' ")
	List<ContentDO> getArchivesByDate(String date);

	List<ContentDO> getArticlesByKeyWord(ContentDO content);

	@Select("select   *  from b_content where status = 'publish'  and slug=#{slug} and type=#{type} ")
	ContentDO getPage(String slug, String type);

	@Select("select   *  from b_content where status = 'publish'  and cid=#{cid} and type=#{type} ")
	ContentDO getPageById(String cid, String type);

	@Update("update b_content set comment_num=comment_num+1 where comment_num=#{comment_num} and cid=#{cid}")
	int updateCommentNum(Integer cid, Integer comment_num);

	@Select("select   *  from b_content where status = 'publish'  and  type='article' order by created limit #{limit} ")
	List<ContentDO> recentcontent(int limit);
}
