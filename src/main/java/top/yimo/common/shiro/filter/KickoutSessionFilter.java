package top.yimo.common.shiro.filter;

import java.io.PrintWriter;
import java.io.Serializable;
import java.util.ArrayDeque;
import java.util.Deque;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.SessionManager;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.databind.ObjectMapper;

import top.yimo.common.constant.WebConstant;
import top.yimo.common.model.vo.ResponseVo;
import top.yimo.common.shiro.session.OnlineSessionDao;
import top.yimo.common.util.SpringUtil;
import top.yimo.sys.domain.OnlineSession;
import top.yimo.sys.domain.UserDO;
import top.yimo.sys.service.UserOnlineService;

/**
 * 利用Shiro自定义访问控制拦截器：AccessControlFilter <br>
 * 实现登录人数限制、登录判断重定向
 * 
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年3月11日 下午2:41:01
 */
public class KickoutSessionFilter extends AccessControlFilter {
	private static final Logger logger = LoggerFactory.getLogger(KickoutSessionFilter.class);

	private final static ObjectMapper objectMapper = new ObjectMapper();

	private boolean kickoutAfter = false; // 踢出之前登录的/之后登录的用户 默认false踢出之前登录的用户
	private int maxSession = 1; // 同一个帐号最大会话数 默认1
	private SessionManager sessionManager;
	private Cache<String, Deque<Serializable>> cache;
	private String loginUrl;

	@Autowired
	OnlineSessionDao onlineSessionDao;

	/**
	 * 使用同一个缓存
	 */
	public void setCacheManager(CacheManager cacheManager) {
		setCache(cacheManager.getCache(WebConstant.ONLINE_CASE));
	}

	/**
	 * 表示是否允许访问；mappedValue就是[urls]配置中拦截器参数部分，如果允许访问返回true，否则false；
	 */
	@Override
	protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue)
			throws Exception {
		Subject subject = getSubject(request, response);
		// 没有登录授权 且没有记住我
		if (!subject.isAuthenticated() && !subject.isRemembered()) {
			// 如果没有登录，直接进行之后的流程
			return true;
		}
		Session session = onlineSessionDao.readSession(subject.getSession().getId());
		if (session != null && (Boolean) session.getAttribute("kickout") != null
				&& (Boolean) session.getAttribute("kickout") == true) {// 标记为踢出的session
			return false;
		}
		if (session != null && session instanceof OnlineSession) {
			OnlineSession onlineSession = (OnlineSession) session;// 类型强制转换 ，改变的是对象引用变量
			// 当前用户
			UserDO user = (UserDO) subject.getPrincipal();
			String username = user.getUserName();
			if (onlineSession.getUserId() == null || onlineSession.getUserId() == 0L) {// 补充自定义session中当前用户信息
				BeanUtils.copyProperties(user, onlineSession);
				onlineSession.setChange(true);
			}
			onlineSessionDao.save2DB(onlineSession);

			request.setAttribute(WebConstant.ONLINE_SESSION, onlineSession);
			Serializable sessionId = onlineSession.getId();
			// 读取缓存用户 没有就存入
			Deque<Serializable> deque = cache.get(username);
			if (deque == null) {
				// 初始化队列
				deque = new ArrayDeque<Serializable>();
			}
			// 如果队列里没有此sessionId，且用户没有被踢出；放入队列
			if (!deque.contains(sessionId) && onlineSession.getAttribute("kickout") == null) {
				// 将sessionId存入队列
				deque.push(sessionId);
				// 将用户的sessionId队列缓存
				cache.put(username, deque);
			}
			// 如果队列里的sessionId数超出最大会话数，开始踢人
			while (deque.size() > maxSession) {
				Serializable kickoutSessionId = null;
				// 是否踢出后来登录的，默认是false；即后者登录的用户踢出前者登录的用户；
				if (kickoutAfter) { // 如果踢出后者
					kickoutSessionId = deque.removeFirst();
				} else { // 否则踢出前者
					kickoutSessionId = deque.removeLast();
				}
				// 踢出后再更新下缓存队列
				cache.put(username, deque);
				// 踢出session
				UserOnlineService userOnlineService = SpringUtil.getBean(UserOnlineService.class);
				userOnlineService.kickout(kickoutSessionId.toString());
			}
		} else {
			return false;
		}
		return true;
	}

	/**
	 * 表示当访问拒绝时是否已经处理了；
	 * 
	 * @return 如果返回true表示需要继续处理； 如果返回false表示该拦截器实例已经处理了，将直接返回即可
	 */
	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
		Subject subject = getSubject(request, response);
		Session session = subject.getSession();
		if (session != null && (Boolean) session.getAttribute("kickout") != null
				&& (Boolean) session.getAttribute("kickout") == true) {
			subject.logout();// 调用Shiro框架的退出
			saveRequest(request);
			String msg = "您已在别处登录，请您修改密码或重新登录";
			logger.info("被强制踢出KickoutSessionFilter");
			if (isAjax(request)) {// ajax请求
				out(response, ResponseVo.timeout(msg));
			} else {
				WebUtils.issueRedirect(request, response, loginUrl);
			}
			return false;
		}
		return true;
	}

	/**
	 * 判断是否为ajax请求
	 */
	public static boolean isAjax(ServletRequest request) {
		String header = ((HttpServletRequest) request).getHeader("X-Requested-With");
		if ("XMLHttpRequest".equalsIgnoreCase(header)) {
			return Boolean.TRUE;
		}
		return Boolean.FALSE;
	}

	/**
	 * response输出json
	 */
	public static void out(ServletResponse response, ResponseVo result) {
		PrintWriter out = null;
		try {
			response.setCharacterEncoding("UTF-8");// 设置编码
			response.setContentType("timeout");// 设置返回类型
			out = response.getWriter();
			out.println(objectMapper.writeValueAsString(result));// 输出
		} catch (Exception e) {
		} finally {
			if (null != out) {
				out.flush();
				out.close();
			}
		}
	}

	public boolean isKickoutAfter() {
		return kickoutAfter;
	}

	public void setKickoutAfter(boolean kickoutAfter) {
		this.kickoutAfter = kickoutAfter;
	}

	public int getMaxSession() {
		return maxSession;
	}

	public void setMaxSession(int maxSession) {
		this.maxSession = maxSession;
	}

	public SessionManager getSessionManager() {
		return sessionManager;
	}

	public void setSessionManager(SessionManager sessionManager) {
		this.sessionManager = sessionManager;
	}

	public Cache<String, Deque<Serializable>> getCache() {
		return cache;
	}

	public void setCache(Cache<String, Deque<Serializable>> cache) {
		this.cache = cache;
	}

	public String getLoginUrl() {
		return loginUrl;
	}

	public void setLoginUrl(String loginUrl) {
		this.loginUrl = loginUrl;
	}

}
