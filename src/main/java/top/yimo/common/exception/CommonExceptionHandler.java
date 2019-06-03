package top.yimo.common.exception;

import lombok.extern.slf4j.Slf4j;

/**
 * 统一异常处理
 * 
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年4月30日 下午4:09:26
 */
//@ControllerAdvice
@Slf4j
public class CommonExceptionHandler {
	/**
	 * 拦截SessionOutException类的异常
	 * 
	 * @param e
	 * @return
	 * @throws IOException
	 */
//	@ExceptionHandler(SessionTimeOutException.class)
//	public void sessionOutExceptionHandler(SessionTimeOutException e, HttpServletRequest request,
//			HttpServletResponse response) throws IOException {
//		log.info("登录超时,强制跳转到登录界面");
//		e.printStackTrace();
//		WebUtils.issueRedirect(request, response, "/login");
//	}
}
