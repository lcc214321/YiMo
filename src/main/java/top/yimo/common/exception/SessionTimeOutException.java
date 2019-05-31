package top.yimo.common.exception;

public class SessionTimeOutException extends RuntimeException {

	/**
	 * @Fields serialVersionUID
	 */
	private static final long serialVersionUID = -5466190342765773531L;

	public SessionTimeOutException() {
	}

	public SessionTimeOutException(String message) {
		super(message);
	}
}
