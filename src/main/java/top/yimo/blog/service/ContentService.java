package top.yimo.blog.service;

import java.util.List;
import java.util.Map;

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
public interface ContentService {
	// 通过主键获取单个数据
	ContentDO get(Integer cid);

	// 获取列表数据
	List<ContentDO> listByPage(Map<String, Object> map);

	// 统计笔数
	int count(Map<String, Object> map);

	// 新增保存
	int save(ContentDO content);

	// 更新
	int update(ContentDO content);

	// 删除
	int remove(Integer cid);

	// 批量删除
	int batchRemove(Integer[] cids);

	// 数据导出
	List<ContentDO> exportData(ContentDO content);

	// 数据导入
	String importData(List<ContentDO> contentList, boolean isCover);

	// 获取归档数据，按照月度分组
	List<ArchiveVo> getArchives();

	// 根据关键字搜索文章
	List<ContentDO> getArticlesByKeyWord(ContentDO content);

	// 根据地址获取页面
	ContentDO getPage(String slug);

	// 根据地址获取文章
	ContentDO getArticle(String slug);
}
