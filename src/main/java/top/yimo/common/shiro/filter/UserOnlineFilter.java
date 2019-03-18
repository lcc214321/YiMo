package top.yimo.common.shiro.filter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.web.filter.PathMatchingFilter;
import org.springframework.beans.factory.annotation.Autowired;

import top.yimo.common.constant.WebConstant;
import top.yimo.common.shiro.session.OnlineSessionDao;
import top.yimo.sys.domain.OnlineSession;

/**
 * 同步会话数据到DB 需要放到Shiro过滤器之前 一次请求最多同步一次 防止过多处理
 * 
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年3月16日 下午7:09:22
 */

public class UserOnlineFilter extends PathMatchingFilter {
	@Autowired
	OnlineSessionDao userOnlineSessionDao;
	@Override
	protected boolean onPreHandle(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
		OnlineSession session = (OnlineSession) request.getAttribute(WebConstant.ONLINE_SESSION);
		// session停止时间，如果stopTimestamp不为null，则代表已停止
		if (session != null && session.getUserId() != null && session.getStopTimestamp() == null) {
			userOnlineSessionDao.save2DB(session);
		}
		return true;
	}
}
