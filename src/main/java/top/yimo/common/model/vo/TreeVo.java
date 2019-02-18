package top.yimo.common.model.vo;

import java.util.Map;

import lombok.Data;

/**
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年1月25日 上午11:22:40
 */
@Data
public class TreeVo {
	/**
	 * 节点ID
	 */
	private String id;
	/**
	 * 显示节点文本
	 */
	private String text;
	/**
	 * 节点状态，open closed
	 */
	private Map<String, Object> state;
	/**
	 * 节点是否被选中 true false
	 */
	private boolean checked = false;
	/**
	 * 节点属性
	 */
	private Map<String, Object> attributes;

	/**
	 * 父ID
	 */
	private String pId;
}
