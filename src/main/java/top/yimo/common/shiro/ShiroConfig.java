package top.yimo.common.shiro;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.Filter;

import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.session.mgt.eis.MemorySessionDAO;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import at.pollux.thymeleaf.shiro.dialect.ShiroDialect;
import net.sf.ehcache.CacheManager;
import top.yimo.common.constant.WebConstant;

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

	@Value("${shiro.filter.loginurl}")
	private String loginUrl;
	@Value("${shiro.filter.sucessurl}")
	private String sucessUrl;
	@Value("${shiro.filter.unauthorizedurl}")
	private String unauthorizedUrl;

	@Bean
	public ShiroFilterFactoryBean shirFilter(SecurityManager securityManager) {
		ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
		shiroFilterFactoryBean.setSecurityManager(securityManager);
		// 拦截器.
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
		filterChainDefinitionMap.put("/**", "kickout,authc");
		// filterChainDefinitionMap.put("/**", "authc");// authc

		// 添加kickout认证
		HashMap<String, Filter> hashMap = new HashMap<String, Filter>();
		hashMap.put("kickout", kickoutSessionFilter());
		shiroFilterFactoryBean.setFilters(hashMap);

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
		userRealm.setCacheManager(ehCacheManager());
		return userRealm;
	}

	/**
	 * 配置核心安全事务管理器
	 * @param shiroRealm
	 * @return
	 */
	@Bean
	public SecurityManager securityManager() {
		DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
		// 设置realm.
		securityManager.setRealm(userRealm());
		// 添加Ehcache
		securityManager.setCacheManager(ehCacheManager());
		// 添加Session控制
		securityManager.setSessionManager(sessionManager());

		return securityManager;
	}

	@Bean
	public SessionDAO sessionDAO() {
		return new MemorySessionDAO();// 使用默认的MemorySessionDAO
	}
	/**
	 * shiro session的管理
	 */
	@Bean
	public DefaultWebSessionManager sessionManager() { // 配置默认的sesssion管理器
		DefaultWebSessionManager sessionManager = new DefaultWebSessionManager();
		sessionManager.setGlobalSessionTimeout(timeout * 1000);
		sessionManager.setSessionDAO(sessionDAO());
		// Collection<SessionListener> listeners = new ArrayList<SessionListener>();
		// // listeners.add(new BDSessionListener());
		// sessionManager.setSessionListeners(listeners);
		return sessionManager;
	}

	/**
	 * 同一个用户多设备登录限制
	 */
	@Bean
	public KickoutSessionFilter kickoutSessionFilter() {
		KickoutSessionFilter kickoutSessionFilter = new KickoutSessionFilter();
		// 使用cacheManager获取相应的cache来缓存用户登录的会话；用于保存用户—会话之间的关系的；
		// 这里我们还是用之前shiro使用的ehcache实现的cacheManager()缓存管理
		// 也可以重新另写一个，重新配置缓存时间之类的自定义缓存属性
		kickoutSessionFilter.setCacheManager(ehCacheManager());
		// 用于根据会话ID，获取会话进行踢出操作的；
		kickoutSessionFilter.setSessionManager(sessionManager());
		// 是否踢出后来登录的，默认是false；即后者登录的用户踢出前者登录的用户；踢出顺序。
		kickoutSessionFilter.setKickoutAfter(false);
		// 同一个用户最大的会话数，默认1；比如2的意思是同一个用户允许最多同时两个人登录；
		kickoutSessionFilter.setMaxSession(1);
		// 被踢出后重定向到的地址；
		kickoutSessionFilter.setKickoutUrl(loginUrl);
		return kickoutSessionFilter;
	}

	/**
	 *  缓存管理器 使用Ehcache实现
	 */
	@Bean
	public EhCacheManager ehCacheManager() {
		// 将ehcacheManager转换成shiro包装后的ehcacheManager对象
		EhCacheManager em = new EhCacheManager();
		em.setCacheManager(CacheManager.create());
		em.setCacheManagerConfigFile("classpath:config/ehcache.xml");
		return em;
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
	 * @param @param
	 *            securityManager
	 * @param @return
	 * @return AuthorizationAttributeSourceAdvisor
	 */
	@Bean
	public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(@Qualifier("securityManager") SecurityManager securityManager) {
		AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
		authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
		return authorizationAttributeSourceAdvisor;
	}
	/**
	 * 开启支持thymeleaf shiro标签
	 */
	@Bean
	public ShiroDialect shiroDialect() {
		return new ShiroDialect();
	}

}
