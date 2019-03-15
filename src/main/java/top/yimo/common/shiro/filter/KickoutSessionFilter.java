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
import org.apache.shiro.session.mgt.DefaultSessionKey;
import org.apache.shiro.session.mgt.SessionManager;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.databind.ObjectMapper;

import top.yimo.common.model.vo.ResponseVo;
import top.yimo.common.shiro.session.UserOnlineSessionDao;
import top.yimo.common.util.DateUtils;
import top.yimo.common.util.ShiroUtils;
import top.yimo.sys.domain.UserDO;
import top.yimo.sys.domain.UserOnlineDO;

/**
 * 利用Shiro自定义访问控制拦截器：AccessControlFilter <br>
 * 			实现登录人数限制、登录判断重定向
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年3月11日 下午2:41:01
 */
public class KickoutSessionFilter extends AccessControlFilter {

	private final static ObjectMapper objectMapper = new ObjectMapper();

	private String kickoutUrl; // 踢出后到的地址
	private boolean kickoutAfter = false; // 踢出之前登录的/之后登录的用户 默认false踢出之前登录的用户
	private int maxSession = 1; // 同一个帐号最大会话数 默认1
	private SessionManager sessionManager;
	private Cache<String, Deque<Serializable>> cache;

	@Autowired
	UserOnlineSessionDao userOnlineSessionDao;

	// 设置Cache的key的前缀
	public void setCacheManager(CacheManager cacheManager) {
		// 必须和ehcache缓存配置中的缓存name一致
		setCache(cacheManager.getCache("shiro-activeSessionCache"));
	}
	/**
	 * 表示是否允许访问；mappedValue就是[urls]配置中拦截器参数部分，如果允许访问返回true，否则false；
	 */
	@Override
	protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
		Subject subject = getSubject(request, response);
		// 没有登录授权 且没有记住我
		if (!subject.isAuthenticated() && !subject.isRemembered()) {
			// 如果没有登录，直接进行之后的流程
			return true;
		}
		Session session = userOnlineSessionDao.readSession(ShiroUtils.getSessionId());
		if (session != null && session instanceof UserOnlineDO) {
			UserOnlineDO userOnline = (UserOnlineDO) session;
			// 当前用户
			UserDO user = (UserDO) subject.getPrincipal();
			String username = user.getUserName();
			Serializable sessionId = session.getId();
			// 读取缓存用户 没有就存入
			Deque<Serializable> deque = cache.get(username);
			if (deque == null) {
				// 初始化队列
				deque = new ArrayDeque<Serializable>();
			}
			// 如果队列里没有此sessionId，且用户没有被踢出；放入队列
			if (!deque.contains(sessionId) && session.getAttribute("kickout") == null) {
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
				try {
					// 获取被踢出的sessionId的session对象
					Session kickoutSession = sessionManager.getSession(new DefaultSessionKey(kickoutSessionId));
					if (kickoutSession != null) {
						// 设置会话的kickout属性表示踢出了 同时更新db状态为下线
						kickoutSession.setAttribute("kickout", true);
						userOnlineSessionDao.doDelete(kickoutSession);
					}
				} catch (Exception e) {// ignore exception
					return true;
				}
			}

			// 保存session到DB
			if (userOnline.getUserId() == null || userOnline.getUserId() == 0L) {
				UserDO sysUser = ShiroUtils.getSysUser();
				BeanUtils.copyProperties(sysUser, userOnline);
				userOnline.setEndTime(DateUtils.getNow());
				userOnlineSessionDao.saveSession2DB(userOnline);
			}
		}
		return true;
	}

	/**
	 * 表示当访问拒绝时是否已经处理了；如果返回true表示需要继续处理；
	 * 		如果返回false表示该拦截器实例已经处理了，将直接返回即可
	 */
	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
		Subject subject = ShiroUtils.getSubject();
		Session session = ShiroUtils.getSession();
		// 如果被踢出了，(前者或后者)直接退出，重定向到踢出后的地址
		if (session != null && (Boolean) session.getAttribute("kickout") != null && (Boolean) session.getAttribute("kickout") == true) {
			// 会话被踢出了
			// 退出登录
			subject.logout();
			saveRequest(request);
			// ajax请求
			if (isAjax(request)) {
				out(response, ResponseVo.kickout("您已在别处登录，请您修改密码或重新登录"));
			} else {
				// 重定向
				WebUtils.issueRedirect(request, response, kickoutUrl);
			}
			return false;
		}
		// 重定向到登录界面
		WebUtils.issueRedirect(request, response, "/login");
		return false;
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
			response.setContentType("application/json");// 设置返回类型
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

	public String getKickoutUrl() {
		return kickoutUrl;
	}

	public void setKickoutUrl(String kickoutUrl) {
		this.kickoutUrl = kickoutUrl;
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

}
