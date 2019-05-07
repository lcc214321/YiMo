package top.yimo.common.model.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Data;

/**
 * 构造出前端bootstrapTable 需要分页显示信息
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年1月17日 上午11:05:26
 */
@Data
public class  BootstrapTablePageVo implements Serializable {
	private static final long serialVersionUID = 1L;
	private long total;
	private List<?> rows;

	public BootstrapTablePageVo(List<?> list, long total) {
		this.rows = list;
		this.total = total;
	}
}
