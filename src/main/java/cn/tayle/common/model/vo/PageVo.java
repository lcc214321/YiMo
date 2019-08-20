package cn.tayle.common.model.vo;

import java.io.Serializable;
import java.util.List;

/**
 * 普通的分页信息
 * 
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年1月17日 上午11:05:26
 */
public class PageVo implements Serializable {
	/**
	 * @Fields serialVersionUID
	 */
	private static final long serialVersionUID = -7722556713377454656L;
	private long total;
	private List<?> rows;
	private int currPage;
	private int pageSize;

	public PageVo(List<?> list, long l) {
		this.rows = list;
		this.total = l;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public List<?> getRows() {
		return rows;
	}

	public void setRows(List<?> rows) {
		this.rows = rows;
	}

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

}
