package top.yimo.sys.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.yimo.common.model.vo.TreeVo;
import top.yimo.common.util.TreeUtils;
import top.yimo.sys.dao.MenuDao;
import top.yimo.sys.domain.MenuDO;
import top.yimo.sys.service.MenuService;

@Service
public class MenuServiceImpl implements MenuService {
	@Autowired
	private MenuDao menuDao;

	@Override
	public MenuDO get(Long menuId) {
		return menuDao.get(menuId);
	}

	@Override
	public List<MenuDO> list(Map<String, Object> map) {
		return menuDao.list(map);
	}

	@Override
	public int count(Map<String, Object> map) {
		return menuDao.count(map);
	}

	@Override
	public int save(MenuDO menu) {
		return menuDao.save(menu);
	}

	@Override
	public int update(MenuDO menu) {
		return menuDao.update(menu);
	}

	@Override
	public int remove(Long menuId) {
		return menuDao.remove(menuId);
	}

	@Override
	public int batchRemove(Long[] menuIds) {
		return menuDao.batchRemove(menuIds);
	}

	@Override
	public Set<String> listPermsByUserId(Long id) {
		List<String> perms = menuDao.listPermsByUserId(id);
		Set<String> permsSet = new HashSet<>();
		for (String perm : perms) {
			if (StringUtils.isNotBlank(perm)) {//排除空格
				permsSet.addAll(Arrays.asList(perm.trim().split(",")));
			}
		}
		return permsSet;
	}

	@Override
	public List<TreeVo<MenuDO>>  getMenusByUser(Long userId) {
		List<TreeVo<MenuDO>> trees = new ArrayList<TreeVo<MenuDO>>();
		List<MenuDO> menus = menuDao.getMenuByUserId(userId);
		for (MenuDO menu : menus) {
			TreeVo<MenuDO> tree = new TreeVo<MenuDO>();
			tree.setId(menu.getMenuId().toString());
			tree.setPId(menu.getParentId().toString());
			tree.setText(menu.getName());
			Map<String, Object> attributes = new HashMap<>(16);
			attributes.put("url", menu.getUrl());
			attributes.put("icon", menu.getIcon());
			tree.setAttributes(attributes);
			trees.add(tree);
		}
		// 默认顶级菜单为０，根据数据库实际情况调整
		List<TreeVo<MenuDO>> treeList = TreeUtils.buildList(trees, "0");
		return treeList;
	}

}
