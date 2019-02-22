package top.yimo.common.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import top.yimo.common.model.vo.TreeVo;

/**
 * jsTree工具类
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年2月22日 上午11:21:09
 */
public class TreeUtils {
	public static  <T> TreeVo build(List<TreeVo> nodes) {

		if (nodes == null) {
			return null;
		}
		List<TreeVo<T>> topNodes = new ArrayList<TreeVo<T>>();

		for (TreeVo<T> children : nodes) {

			String pid = children.getPId();
			if (pid == null || "0".equals(pid)) {
				topNodes.add(children);

				continue;
			}

			for (TreeVo<T> parent : nodes) {
				String id = parent.getId();
				if (id != null && id.equals(pid)) {
					parent.getChildren().add(children);
					children.setHasParent(true);
					parent.setHasChildren(true);
					continue;
				}
			}
		}
		TreeVo root = new TreeVo();
		if (topNodes.size() == 1) {
			root = topNodes.get(0);
		} else {
			root.setId("-1");
			root.setPId("");
			root.setHasParent(false);
			root.setHasChildren(true);
			root.setChecked(true);
			root.setChildren(topNodes);
			root.setText("顶级节点");
			Map<String, Object> state = new HashMap<>(16);
			state.put("opened", true);
			root.setState(state);
		}
		return root;
	}
}
