package top.yimo.common.shiro.session;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.SessionContext;
import org.apache.shiro.session.mgt.SessionFactory;
import org.apache.shiro.web.session.mgt.WebSessionContext;

import eu.bitwalker.useragentutils.UserAgent;
import top.yimo.common.util.DateUtils;
import top.yimo.common.util.YiMoUtils;
import top.yimo.sys.domain.UserOnlineDO;
/**
 * 根据SessionContext创建session
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年3月15日 下午5:23:57
 */
public class UserOnlineSessionFactory implements SessionFactory {

	/**
	 * 创建session
	 */
	@Override
	public Session createSession(SessionContext initData) {
		UserOnlineDO session = new UserOnlineDO();
		if (initData != null && initData instanceof WebSessionContext) {
			WebSessionContext sessionContext = (WebSessionContext) initData;
			HttpServletRequest request = (HttpServletRequest) sessionContext.getServletRequest();
			if (request != null) {
				UserAgent userAgent = UserAgent.parseUserAgentString(request.getHeader("User-Agent"));
				// 获取客户端操作系统
				String os = userAgent.getOperatingSystem().getName();
				// 获取客户端浏览器
				String browser = userAgent.getBrowser().getName();
				session.setHost(YiMoUtils.getIpAddr(request));
				session.setBrowser(browser);
				session.setOs(os);
				session.setStatus("on_line");
				session.setBeginTime(DateUtils.getNow());
			}
		}
		System.out.println("session信息：" + session.toString());
		return session;
	}

}
