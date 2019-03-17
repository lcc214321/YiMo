package top.yimo.common.shiro.filter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.web.filter.PathMatchingFilter;
import org.springframework.beans.factory.annotation.Autowired;

import top.yimo.common.constant.WebConstant;
import top.yimo.common.shiro.session.UserOnlineSessionDao;
import top.yimo.sys.domain.UserOnlineDO;

/**
 * 同步会话数据到DB 需要放到Shiro过滤器之前 一次请求最多同步一次 防止过多处理
 * 
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年3月16日 下午7:09:22
 */

public class OnlineSessionFilter extends PathMatchingFilter {
	@Autowired
	private UserOnlineSessionDao onlineSessionDao;

	@Override
	protected boolean onPreHandle(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
		UserOnlineDO session = (UserOnlineDO) request.getAttribute(WebConstant.ONLINE_SESSION);
		// 如果session stop了 也不同步
		// session停止时间，如果stopTimestamp不为null，则代表已停止
		if (session != null && session.getUserId() != null && session.getStopTimestamp() == null) {
			onlineSessionDao.saveSession2DB(session);
		}
		return true;
	}
}
