package cn.tayle.sys.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tayle.common.annotation.Log;
import cn.tayle.common.controller.BaseController;
import cn.tayle.common.enums.OperatorType;
import cn.tayle.common.model.vo.ResponseVo;
import cn.tayle.common.model.vo.TreeVo;
import cn.tayle.sys.domain.MenuDO;
import cn.tayle.sys.service.MenuService;

/**
 * 菜单管理
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年22月24日 17:22:00
 */

@Controller
@RequestMapping("/sys/menu")
public class MenuController extends BaseController {
	private String prefix = "sys/menu";
	private final static String title = "菜单管理";

	@Autowired
	private MenuService menuService;

	@GetMapping()
	@RequiresPermissions("sys:menu:menu")
	public String Menu() {
		return prefix + "/menu";
	}

	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("sys:menu:menu")
	@Log(describe = "获取菜单列表", title = title, operatorType = OperatorType.QUERY)
	public List<MenuDO> list(@RequestParam Map<String, Object> params) {
		List<MenuDO> menuList = menuService.list(params);
		return menuList;
	}

	/**
	 * 增加下级菜单
	 */
	@GetMapping("/add/{menuId}")
	@RequiresPermissions("sys:menu:add")
	public String add(@PathVariable("menuId") Long menuId, Model model) {
		if (StringUtils.isBlank(menuId.toString())) {
			menuId = 0l;
		}
		model.addAttribute("pMenuId", menuId);
		model.addAttribute("menu", new MenuDO());
		return prefix + "/add";
	}

	@GetMapping("/edit/{id}")
	@RequiresPermissions("sys:menu:edit")
	public String edit(@PathVariable("id") Long menuId, Model model) {
		MenuDO menu = menuService.get(menuId);
		model.addAttribute("menu", menu);
		return prefix + "/edit";
	}

	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("sys:menu:add")
	@Log(describe = "新增保存", title = title, operatorType = OperatorType.INSERT)
	public ResponseVo save(MenuDO menu) {
		beforeSave(menu);
		menu.setStatus("1");
		if (menuService.save(menu) > 0) {
			return ResponseVo.ok("保存成功");
		}
		return ResponseVo.fail();
	}

	@ResponseBody
	@PutMapping("/update")
	@RequiresPermissions("sys:menu:edit")
	@Log(describe = "更新保存", title = title, operatorType = OperatorType.UPDATE)
	public ResponseVo update(MenuDO menu) {
		beforeUpdate(menu);
		if (menuService.update(menu) > 0) {
			return ResponseVo.ok("更新成功");
		}
		return ResponseVo.fail();
	}

	/**
	 * 删除
	 */
	@DeleteMapping("/remove/{id}")
	@ResponseBody
	@RequiresPermissions("sys:menu:remove")
	@Log(describe = "删除菜单信息", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo remove(@PathVariable("id") Long menuId) {
		if (menuService.remove(menuId) > 0) {
			return ResponseVo.ok("删除成功");
		}
		return ResponseVo.fail();
	}

	/**
	 * 批量删除
	 */
	@DeleteMapping("/batchRemove")
	@ResponseBody
	@RequiresPermissions("sys:menu:batchRemove")
	@Log(describe = "批量删除菜单信息", title = title, operatorType = OperatorType.DELETE)
	public ResponseVo batchRemove(@RequestParam("ids[]") Long[] menuIds) {
		if (menuService.batchRemove(menuIds) > 0) {
			return ResponseVo.ok("删除成功");
		}
		return ResponseVo.fail();
	}

	/**
	 * 根据角色ID获取菜单树
	 */
	@GetMapping("/getMenuTree/{roleId}")
	@ResponseBody
	public List<TreeVo<MenuDO>> tree(@PathVariable("roleId") Long roleId) {
		return menuService.getMenuTreeByRole(roleId);
	}

}
