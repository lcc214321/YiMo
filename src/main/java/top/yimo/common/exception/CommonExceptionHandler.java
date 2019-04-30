package top.yimo.common.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import top.yimo.common.model.vo.ResponseVo;

/**
 * 统一异常处理
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年4月30日 下午4:09:26
 */
@ControllerAdvice
public class CommonExceptionHandler {
	/**
	*  拦截Exception类的异常
	* @param e
	* @return
	*/
	@ExceptionHandler(Exception.class)
	@ResponseBody
	public ResponseVo exceptionHandler(Exception e) {
		return ResponseVo.exception(e.getMessage());
	}
}
