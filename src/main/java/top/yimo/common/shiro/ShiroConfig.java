package top.yimo.common.shiro;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.Filter;

import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.io.ResourceUtils;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.session.SessionListener;
import org.apache.shiro.session.mgt.ExecutorServiceSessionValidationScheduler;
import org.apache.shiro.session.mgt.SessionValidationScheduler;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import at.pollux.thymeleaf.shiro.dialect.ShiroDialect;
import net.sf.ehcache.CacheManager;
import top.yimo.common.constant.WebConstant;
import top.yimo.common.shiro.filter.KickoutSessionFilter;
import top.yimo.common.shiro.realm.UserRealm;
import top.yimo.common.shiro.session.OnlineSessionDao;
import top.yimo.common.shiro.session.OnlineSessionFactory;
import top.yimo.common.shiro.session.OnlineSessionManager;
import top.yimo.common.shiro.session.ShiroSessionListener;

/**
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年1月14日 下午5:49:40
 */
@Configuration
public class ShiroConfig {

	@Value("${shiro.session.timeout}")
	private int timeout;
	@Value("${shiro.session.interval}")
	private int interval;

	@Value("${shiro.filter.loginurl}")
	private String loginUrl;
	@Value("${shiro.filter.sucessurl}")
	private String sucessUrl;
	@Value("${shiro.filter.unauthorizedurl}")
	private String unauthorizedUrl;

	@Value("${yimo.permissions}")
	private boolean permissions;

	@Bean
	public ShiroFilterFactoryBean shirFilter(SecurityManager securityManager) {
		ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
		shiroFilterFactoryBean.setSecurityManager(securityManager);
		// 拦截器.
		HashMap<String, Filter> hashMap = new HashMap<String, Filter>();
		hashMap.put("kickout", kickoutSessionFilter());
		shiroFilterFactoryBean.setFilters(hashMap);
		Map<String, String> filterChainDefinitionMap = new LinkedHashMap<String, String>();
		// 配置不会被拦截的链接 顺序判断
		filterChainDefinitionMap.put("/css/**", "anon");
		filterChainDefinitionMap.put("/fonts/**", "anon");
		filterChainDefinitionMap.put("/img/**", "anon");
		filterChainDefinitionMap.put("/js/**", "anon");
		filterChainDefinitionMap.put("/yimo/**", "anon");
		filterChainDefinitionMap.put("/favicon.ico", "anon");
		filterChainDefinitionMap.put("/login/**", "anon");

		// <!-- authc:所有url都必须认证通过才可以访问; anon:所有url都都可以匿名访问-->
		if (permissions) {
			filterChainDefinitionMap.put("/**", "kickout,authc");
		} else {
			filterChainDefinitionMap.put("/**", "anon");// authc
		}

		// 如果不设置默认会自动寻找Web工程根目录下的"/login.jsp"页面
		shiroFilterFactoryBean.setLoginUrl(loginUrl);
		// 登录成功后要跳转的链接
		shiroFilterFactoryBean.setSuccessUrl(sucessUrl);

		// 未授权界面;
		shiroFilterFactoryBean.setUnauthorizedUrl(unauthorizedUrl);
		shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);
		return shiroFilterFactoryBean;
	}

	/**
	 * 增加一个简单的无权限异常捕获器
	 * 
	 * @param @return
	 * @return SimpleMappingExceptionResolver
	 */
	@Bean
	public SimpleMappingExceptionResolver resolver() {
		SimpleMappingExceptionResolver resolver = new SimpleMappingExceptionResolver();
		Properties properties = new Properties();
		properties.setProperty("org.apache.shiro.authz.UnauthorizedException", "error/403");
		resolver.setExceptionMappings(properties);
		return resolver;
	}

	@Bean
	public UserRealm userRealm() {
		UserRealm userRealm = new UserRealm();
		// 使用加密
		userRealm.setCredentialsMatcher(hashedCredentialsMatcher());
		// 使用ehcache
//		userRealm.setCacheManager(ehCacheManager());
		return userRealm;
	}

	/**
	 * 配置核心安全事务管理器
	 * 
	 * @param shiroRealm
	 * @return
	 */
	@Bean
	public SecurityManager securityManager() {
		DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
		// 设置realm.
		securityManager.setRealm(userRealm());
		// 添加Ehcache
//		securityManager.setCacheManager(ehCacheManager());
		// 添加Session控制
		securityManager.setSessionManager(sessionManager());

		return securityManager;
	}

	/**
	 * 自定义sessionDao
	 */
	@Bean
	public OnlineSessionDao sessionDAO() {
		return new OnlineSessionDao();
	}

	/**
	 * 自定义sessionFactory会话
	 */
	@Bean
	public OnlineSessionFactory sessionFactory() {
		OnlineSessionFactory sessionFactory = new OnlineSessionFactory();
		return sessionFactory;
	}

	/**
	 * shiro session的管理 负责整个session的生命周期
	 */
	@Bean
	public DefaultWebSessionManager sessionManager() {
		DefaultWebSessionManager sessionManager = new DefaultWebSessionManager();// 配置默认的sesssion管理器
		sessionManager.setGlobalSessionTimeout(timeout * 1000);
		sessionManager.setSessionDAO(sessionDAO());
		sessionManager.setSessionFactory(sessionFactory());
		sessionManager.setSessionIdUrlRewritingEnabled(false);// 去掉 JSESSIONID
		sessionManager.setSessionValidationScheduler(sessionValidationScheduler());
		sessionManager.setSessionValidationSchedulerEnabled(true);// 开启定时检查session
		// 增加session过期操作监听
		Collection<SessionListener> listeners = new HashSet<SessionListener>();
		listeners.add(shiroSessionListener());
		sessionManager.setSessionListeners(listeners);
		sessionManager.setDeleteInvalidSessions(true);// 删除过期的session
		sessionManager.setSessionIdCookieEnabled(true);
		return sessionManager;
	}

	@Bean
	public ShiroSessionListener shiroSessionListener() {
		ShiroSessionListener shiroSessionListener = new ShiroSessionListener();
		return shiroSessionListener;
	}

	@Bean
	public SessionValidationScheduler sessionValidationScheduler() {
		ExecutorServiceSessionValidationScheduler sessionValidationScheduler = new ExecutorServiceSessionValidationScheduler();
		// 相隔多久检查一次session的有效性，单位秒，
		sessionValidationScheduler.setInterval(interval * 1000);
		sessionValidationScheduler.setSessionManager(onlineSessionManager());
		return sessionValidationScheduler;
	}

	@Bean
	public OnlineSessionManager onlineSessionManager() {
		OnlineSessionManager onlineSessionManager = new OnlineSessionManager();
		// 加入缓存管理器
//		onlineSessionManager.setCacheManager(ehCacheManager());
		// 删除过期的session
		onlineSessionManager.setDeleteInvalidSessions(true);
		// 去掉 JSESSIONID
		onlineSessionManager.setSessionIdUrlRewritingEnabled(false);
		// 是否定时检查session
		onlineSessionManager.setSessionValidationSchedulerEnabled(true);
		// 自定义SessionDao
		onlineSessionManager.setSessionDAO(sessionDAO());
		// 自定义sessionFactory
		onlineSessionManager.setSessionFactory(sessionFactory());
		return onlineSessionManager;
	}

	@Bean
	public KickoutSessionFilter kickoutSessionFilter() {
		KickoutSessionFilter kickoutSessionFilter = new KickoutSessionFilter();
		kickoutSessionFilter.setSessionManager(sessionManager());
//		kickoutSessionFilter.setCacheManager(ehCacheManager());

		// 是否踢出后来登录的，默认是false；即后者登录的用户踢出前者登录的用户；踢出顺序。
		kickoutSessionFilter.setKickoutAfter(false);
		// 同一个用户最大的会话数，默认1；比如2的意思是同一个用户允许最多同时两个人登录；
		kickoutSessionFilter.setMaxSession(1);
		// 被踢出后重定向到的地址；
		kickoutSessionFilter.setKickoutUrl(loginUrl);
		return kickoutSessionFilter;
	}

	/**
	 * 缓存管理器 使用Ehcache实现
	 */
	@Bean
	public EhCacheManager ehCacheManager() {
		CacheManager cacheManager = CacheManager.getCacheManager("YiMo");
		if (cacheManager == null) {// 避免热部署时冲突,先获取判断是否为空，为空时才重新创建
			try {
				cacheManager = CacheManager.create(ResourceUtils.getInputStreamForPath("classpath:config/ehcache.xml"));
			} catch (IOException e) {
				throw new RuntimeException("initialize cacheManager failed");
			}
		}
		EhCacheManager ehCacheManager = new EhCacheManager();
		ehCacheManager.setCacheManager(cacheManager);
		return ehCacheManager;
	}

	/**
	 * 凭证匹配器 由于我们的密码校验交给Shiro的SimpleAuthenticationInfo进行处理了
	 * 
	 * @return
	 */
	@Bean
	public HashedCredentialsMatcher hashedCredentialsMatcher() {
		HashedCredentialsMatcher hashedCredentialsMatcher = new HashedCredentialsMatcher();
		hashedCredentialsMatcher.setHashAlgorithmName(WebConstant.ALGORITHM_NAME);
		hashedCredentialsMatcher.setHashIterations(WebConstant.HASH_ITERATIONS);//
		return hashedCredentialsMatcher;
	}

	/**
	 * 开启Shiro注解方式
	 * 
	 * @param @param securityManager
	 * @param @return
	 * @return AuthorizationAttributeSourceAdvisor
	 */
//	@Bean
//	public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(
//			@Qualifier("securityManager") SecurityManager securityManager) {
//		AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
//		authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
//		return authorizationAttributeSourceAdvisor;
//	}

	/**
	 * 开启支持thymeleaf shiro标签
	 */
	@Bean
	public ShiroDialect shiroDialect() {
		return new ShiroDialect();
	}

}
