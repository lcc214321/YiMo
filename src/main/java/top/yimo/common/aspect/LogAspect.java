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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import top.yimo.common.YiMoConfig;
import top.yimo.common.annotation.Log;
import top.yimo.common.util.DateUtils;
import top.yimo.common.util.ShiroUtils;
import top.yimo.common.util.WebUtils;
import top.yimo.sys.domain.LogDO;
import top.yimo.sys.domain.UserDO;
import top.yimo.sys.service.LogService;

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
	private String createTime = "";
	@Autowired
	LogService logService;

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
	public void doBefore(JoinPoint joinPoint) throws Throwable {
		startTime.set(System.currentTimeMillis());
		createTime = DateUtils.getNow();
	}

	@AfterReturning("sysLogPoint()")
	public void doAfter(JoinPoint joinPoint) {
		// 执行时长(毫秒)
		long time = System.currentTimeMillis() - startTime.get();
		LogDO log = new LogDO();
		log.setTime(time);
		// 接收到请求，记录请求内容
		HttpServletRequest request = WebUtils.getHttpServletRequest();
		MethodSignature signature = (MethodSignature) joinPoint.getSignature();
		Method method = signature.getMethod();
		Log syslog = method.getAnnotation(Log.class);
		boolean saveArgs = false;
		if (syslog != null) {
			log.setOperationType(syslog.operatorType().name());
			log.setDescribe(syslog.describe());
			log.setTitle(syslog.title());
			saveArgs = syslog.isSaveArgs();
		}
		log.setIp(request.getRemoteAddr());
		if (saveArgs) {
			log.setParams(Arrays.toString(joinPoint.getArgs()));
		}
		log.setMethod(joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName());
		log.setUrl(request.getRequestURL().toString());

		UserDO user = ShiroUtils.getCurrentUser();
		if (user != null) {
			log.setUserId(user.getUserId());
			log.setUserName(user.getName());
		}
		log.setCreateTime(createTime);
		String logModel = YiMoConfig.getLogModel();
		if ("db".equalsIgnoreCase(logModel)) {
			logService.save(log);
		} else {
			logger.info("操作日志{}", log.toString());
		}
	}
}
