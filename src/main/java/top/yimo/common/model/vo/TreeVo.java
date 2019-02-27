package top.yimo.common.model.vo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;

import lombok.Data;

/**
 * Tree对象，基于 jsTree 3.3.7 框架 
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年1月25日 上午11:22:40
 */
@Data
public class TreeVo<T> {
	/**
	 * 节点ID
	 */
	private String id;
	/**
	 * 显示节点文本
	 */
	private String text;
	/**
	 * 节点状态，disabled  是否允许编辑 opened  是否展开   selected 是否选中树形勾选
	 */
	private Map<String, Object> state;
	/**
	 * 树形菜单是否选中 true false  
	 */
	private boolean checked = false;
	/**
	 * 节点属性  用于业务对象扩展
	 */
	private Map<String, Object> attributes;

	/**
	 * 节点的子节点
	 */
	private List<TreeVo<T>> children = new ArrayList<TreeVo<T>>();
	/**
	 * 父ID
	 */
	private String pId;

	/**
	 * 是否有父节点
	 */
	private boolean hasParent = false;
	/**
	 * 是否有子节点
	 */
	private boolean hasChildren = false;

	@Override
	public String toString() {
		return JSON.toJSONString(this);
	}
}
