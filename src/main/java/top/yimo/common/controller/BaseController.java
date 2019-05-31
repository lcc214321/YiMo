package top.yimo.common.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import top.yimo.common.domain.BaseDO;
import top.yimo.common.exception.TipException;
import top.yimo.common.model.vo.BootstrapTablePageVo;
import top.yimo.common.util.DataConvert;
import top.yimo.common.util.DateUtils;
import top.yimo.common.util.ShiroUtils;
import top.yimo.sys.domain.UserDO;

/**
 * web层通用数据处理
 * 
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年1月18日 下午3:51:41
 */

public class BaseController {

	/**
	 * 统一使用PageHelper设置分页
	 */
	protected void startPage(Map<String, Object> params) {
		int pageSize = DataConvert.toInt(params.get("limit"));
		int offset = DataConvert.toInt(params.get("offset"));
		int pageNum = 1;
		if (pageSize > 0) {
			pageNum = offset / pageSize + 1;
		}
		String orderBy = "";
		String sort = DataConvert.camelToUnderScore(params.get("sort"));// 转化成下划线
		if (StringUtils.isNotBlank(sort)) {
			String order = DataConvert.toString(params.get("order"), "desc");
			orderBy = sort + " " + order;
		}
		PageHelper.startPage(pageNum, pageSize, orderBy);
	}

	/**
	 * 响应请求分页数据
	 */
	protected BootstrapTablePageVo getPageData(List<?> list) {
		@SuppressWarnings({ "rawtypes", "unchecked" })
		BootstrapTablePageVo page = new BootstrapTablePageVo(list, new PageInfo(list).getTotal());
		return page;
	}

	protected UserDO getSysUser() {
		UserDO user = ShiroUtils.getSysUser();
		if (user == null) {
			throw new TipException("当前用户已登录失效，请重新登录");
		}
		return user;
	}

	protected Long getUserId() {
		return getSysUser().getUserId();
	}

	protected String getUserName() {
		return getSysUser().getUserName();
	}

	protected void beforeSave(BaseDO baseDo) {
		baseDo.setCreateUserId(ShiroUtils.getUserId());
		baseDo.setCreateTime(DateUtils.getNow());
	}

	protected void beforeUpdate(BaseDO baseDo) {
		baseDo.setUpdateTime(DateUtils.getNow());
	}
}
