package top.yimo.blog.model.vo;

import java.io.Serializable;
import java.util.List;

import top.yimo.blog.domain.ContentDO;

/**
 * 用于归档界面
 * 
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年6月19日 下午5:58:26
 */
public class ArchiveVo implements Serializable {

	/**
	 * @Fields serialVersionUID
	 */
	private static final long serialVersionUID = 1L;
	private String date;
	private String count;
	private List<ContentDO> articles;

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public List<ContentDO> getArticles() {
		return articles;
	}

	public void setArticles(List<ContentDO> articles) {
		this.articles = articles;
	}

	@Override
	public String toString() {
		return "Archive [" + "date='" + date + '\'' + ", count='" + count + '\'' + ", articles=" + articles + ']';
	}
}