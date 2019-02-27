package top.yimo.common.controller;

import java.util.List;

import top.yimo.common.domain.BaseDo;
import top.yimo.common.model.vo.PageVo;
import top.yimo.common.util.DateUtils;
import top.yimo.common.util.ShiroUtils;
import top.yimo.sys.domain.UserDO;

/**
 * web层通用数据处理
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年1月18日 下午3:51:41
 */

public class BaseController {
	/**
	* 响应请求分页数据
	*/
	protected PageVo getPageData(List<?> list, int total) {
		PageVo page = new PageVo(list, total);
		return page;
	}

	public UserDO getSysUser() {
		return ShiroUtils.getSysUser();
	}

	public Long getUserId() {
		return getSysUser().getUserId();
	}

	public String getUserName() {
		return getSysUser().getUserName();
	}

	public void beforeSave(BaseDo baseDo) {
		baseDo.setCreateUserId(ShiroUtils.getUserId());
		baseDo.setCreateTime(DateUtils.getNow());
	}

	public void beforeUpdate(BaseDo baseDo) {
		baseDo.setUpdateTime(DateUtils.getNow());
	}
}
