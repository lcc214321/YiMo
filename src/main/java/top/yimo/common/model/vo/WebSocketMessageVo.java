package top.yimo.common.model.vo;

import lombok.Data;

/**
 * WebSocket消息
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年4月2日 上午11:51:24
 */
@Data
public class WebSocketMessageVo {
	private String msg;

	
	public static WebSocketMessageVo message(String msg) {
		return new WebSocketMessageVo(msg);
	}


	public WebSocketMessageVo(String msg) {
		this.msg = msg;
	}

	public WebSocketMessageVo() {
	}
}
