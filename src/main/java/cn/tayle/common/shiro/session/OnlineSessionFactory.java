package cn.tayle.common.shiro.session;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.SessionContext;
import org.apache.shiro.session.mgt.SessionFactory;
import org.apache.shiro.web.session.mgt.WebSessionContext;
import org.springframework.beans.factory.annotation.Autowired;

import eu.bitwalker.useragentutils.UserAgent;
import cn.tayle.common.util.DateUtils;
import cn.tayle.common.util.YiMoUtils;
import cn.tayle.sys.domain.OnlineSession;
/**
 * 自定义sessionFactory
 * 			<br>根据SessionContext创建session
 * 
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年3月15日 下午5:23:57
 */
public class OnlineSessionFactory implements SessionFactory {
	@Autowired
	OnlineSessionDao sessionDao;
	/**
	 * 创建session
	 */
	@Override
	public Session createSession(SessionContext initData) {
		OnlineSession onlineSession = new OnlineSession();
		if (initData != null && initData instanceof WebSessionContext) {
			WebSessionContext sessionContext = (WebSessionContext) initData;
			HttpServletRequest request = (HttpServletRequest) sessionContext.getServletRequest();
			if (request != null) {
				UserAgent userAgent = UserAgent.parseUserAgentString(request.getHeader("User-Agent"));
				// 获取客户端操作系统
				String os = userAgent.getOperatingSystem().getName();
				// 获取客户端浏览器
				String browser = userAgent.getBrowser().getName();
				onlineSession.setHost(YiMoUtils.getIpAddr(request));
				onlineSession.setBrowser(browser);
				onlineSession.setOs(os);
				onlineSession.setStatus("on_line");
				onlineSession.setBeginTime(DateUtils.getNow());
				String ipAddr = YiMoUtils.getIpAddr(request);
				onlineSession.setIp(ipAddr);
				onlineSession.setLoginLocation(YiMoUtils.getAddressByIp(ipAddr));
			}
		}
		return onlineSession;
	}

}
