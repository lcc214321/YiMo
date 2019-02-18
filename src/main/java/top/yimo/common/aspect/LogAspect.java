package top.yimo.common.aspect;

import java.lang.reflect.Method;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import top.yimo.common.annotation.Log;

/**
 * 自定义系统级别日志切面
 * 
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年1月9日 下午5:11:41
 */
@Aspect
@Component
public class LogAspect {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	ThreadLocal<Long> startTime = new ThreadLocal<Long>();

	/**
	 * 定义个切面 添加了Log注解的所有方法
	 * 
	 * @param
	 * @return void
	 */
	@Pointcut("@annotation(top.yimo.common.annotation.Log)")
	public void sysLogPoint() {
	}

	@Before("sysLogPoint()")
	public void doBefore(JoinPoint joinPoint) {
		startTime.set(System.currentTimeMillis());
		// 接收到请求，记录请求内容
		ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		HttpServletRequest request = attributes.getRequest();

		MethodSignature signature = (MethodSignature) joinPoint.getSignature();
		Method method = signature.getMethod();
		Log syslog = method.getAnnotation(Log.class);
		if (syslog != null) {
			// 注解上的描述
			logger.info("LOG : " + syslog.toString());
		}
		// 记录下请求内容
		logger.info("URL : " + request.getRequestURL().toString());
		logger.info("HTTP_METHOD : " + request.getMethod());
		logger.info("IP : " + request.getRemoteAddr());
		logger.info("CLASS_METHOD : " + joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName());
		logger.info("ARGS : " + Arrays.toString(joinPoint.getArgs()));
		// 获取所有参数方法一：
		// Enumeration<String> enu = request.getParameterNames();
		// while (enu.hasMoreElements()) {
		// String paraName = (String) enu.nextElement();
		// System.out.println(paraName + ": " + request.getParameter(paraName));
		// }
	}

	@AfterReturning("sysLogPoint()")
	public void doAfterReturning(JoinPoint joinPoint) {
		// 处理完请求，返回内容
		logger.info("耗时（毫秒） : " + (System.currentTimeMillis() - startTime.get()));
	}

}
