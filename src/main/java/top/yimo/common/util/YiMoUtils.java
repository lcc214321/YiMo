package top.yimo.common.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

import top.yimo.common.constant.WebConstant;
import top.yimo.common.model.vo.TreeVo;

/**
 * 工具类
 * 
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年1月18日 下午6:10:58
 */

public class YiMoUtils {

	/**
	 * 对明文密码加密 加盐
	 * 
	 * @param pswd
	 * @return
	 * @return String
	 */
	public static String encrypt(String pswd) {
		String newPassword = new SimpleHash(WebConstant.ALGORITHM_NAME, pswd, ByteSource.Util.bytes(WebConstant.SALT), WebConstant.HASH_ITERATIONS).toHex();
		return newPassword;
	}

	/**
	 * 
	 * @param username
	 *            用户名
	 * @param pswd
	 *            明文密码
	 * @return String
	 */
	public static String encrypt(String username, String pswd) {
		String newPassword = new SimpleHash(WebConstant.ALGORITHM_NAME, pswd, ByteSource.Util.bytes(username + WebConstant.SALT), WebConstant.HASH_ITERATIONS)
		        .toHex();
		return newPassword;
	}
	
	
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
