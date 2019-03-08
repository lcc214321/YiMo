package top.yimo.common.shiro;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Properties;

import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.beans.factory.annotation.Qualifier;
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
		filterChainDefinitionMap.put("/**", "authc");// authc
		// 如果不设置默认会自动寻找Web工程根目录下的"/login.jsp"页面
		shiroFilterFactoryBean.setLoginUrl("/login");
		// 登录成功后要跳转的链接
		shiroFilterFactoryBean.setSuccessUrl("/index");

		// 未授权界面;
		shiroFilterFactoryBean.setUnauthorizedUrl("/error/403");
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
		return securityManager;
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
