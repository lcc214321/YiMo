package top.yimo.sys.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import top.yimo.sys.dao.MenuDao;
import top.yimo.sys.domain.MenuDO;
import top.yimo.sys.service.MenuService;



@Service
public class MenuServiceImpl implements MenuService {
	@Autowired
	private MenuDao menuDao;
	
	@Override
	public MenuDO get(Long menuId){
		return menuDao.get(menuId);
	}
	
	@Override
	public List<MenuDO> list(Map<String, Object> map){
		return menuDao.list(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return menuDao.count(map);
	}
	
	@Override
	public int save(MenuDO menu){
		return menuDao.save(menu);
	}
	
	@Override
	public int update(MenuDO menu){
		return menuDao.update(menu);
	}
	
	@Override
	public int remove(Long menuId){
		return menuDao.remove(menuId);
	}
	
	@Override
	public int batchRemove(Long[] menuIds){
		return menuDao.batchRemove(menuIds);
	}
	
}
