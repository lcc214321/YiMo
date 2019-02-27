package top.yimo.common.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import top.yimo.common.model.vo.TreeVo;

/**
 *  基于 jsTree 3.3.7 框架  工具类
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年2月22日 上午11:21:09
 */
public class TreeUtils {
	private static final String DEFAULT_ROOT_ID = "0";

	/**
	 * 构建节点父子关系
	 * @param nodes 
	 * @param defaultRootId 默认为0
	 * @return TreeVo<T> 树对象
	 */
	public static <T> TreeVo<T> build(List<TreeVo<T>> nodes, String defaultRootId) {
		TreeVo<T> root = new TreeVo<T>();
		nodes = buildList(nodes, defaultRootId, false);
		if (nodes.size() == 1) {
			root = nodes.get(0);
		} else {
			root.setId("-1");
			root.setPId("");
			root.setHasParent(false);
			root.setHasChildren(true);
			root.setChecked(true);
			root.setChildren(nodes);
			root.setText("顶级节点");
			Map<String, Object> state = new HashMap<>();
			state.put("opened", true);
			root.setState(state);
		}
		return root;
	}

	/**
	 * 构建节点父子关系
	 * @param nodes 
	 * @param defaultRootId 默认为0
	 * @param isCheckboxTree 
	 * @return 节点集合
	 */
	public static <T> List<TreeVo<T>> buildList(List<TreeVo<T>> nodes, String defaultRootId, boolean isCheckboxTree) {
		if (nodes == null) {
			return null;
		}
		if (defaultRootId == null || defaultRootId.equals("")) {
			defaultRootId = DEFAULT_ROOT_ID;
		}
		List<TreeVo<T>> topNodes = new ArrayList<TreeVo<T>>();
		for (TreeVo<T> currNode : nodes) {
			String pid = currNode.getPId();
			if (pid == null || defaultRootId.equals(pid)) {// 如果当前节点没有父节点 或者当前节点为默认根节点
				topNodes.add(currNode);
				continue;
			}
			for (TreeVo<T> parent : nodes) {
				String id = parent.getId();
				if (id != null && id.equals(pid)) {// 遍历查找父节点
					parent.getChildren().add(currNode);// 将当前节点添加父节点得子节点集合中
					currNode.setHasParent(true);
					parent.setHasChildren(true);
					if (isCheckboxTree) {// 如果是多选的checkBox 默认将父节点设置成不选中，jstree会默认将子节点的所有父节点选中
						parent.getState().put("selected", false);
					}
					continue;
				}
			}
		}
		return topNodes;
	}
}
