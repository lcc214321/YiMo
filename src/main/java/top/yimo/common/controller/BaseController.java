package top.yimo.common.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import top.yimo.common.domain.BaseDO;
import top.yimo.common.model.vo.BootstrapTablePageVo;
import top.yimo.common.model.vo.PageVo;
import top.yimo.common.util.DataConvert;
import top.yimo.common.util.DateUtils;
import top.yimo.common.util.ShiroUtils;

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
		int pageSize = DataConvert.toInt(params.get("limit"));// 每页大小
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

	/**
	 * 响应请求普通分页数据
	 */
	protected PageVo getPageVo(List<?> list, int currPage, int pageSize) {
		@SuppressWarnings({ "rawtypes", "unchecked" })
		PageVo page = new PageVo(list, new PageInfo(list).getTotal());
		page.setCurrPage(currPage);
		page.setPageSize(pageSize);
		return page;
	}

	protected void beforeSave(BaseDO baseDo) {
		baseDo.setCreateUserId(ShiroUtils.getUserId());
		baseDo.setCreateTime(DateUtils.getNow());
	}

	protected void beforeUpdate(BaseDO baseDo) {
		baseDo.setUpdateTime(DateUtils.getNow());
	}
}
