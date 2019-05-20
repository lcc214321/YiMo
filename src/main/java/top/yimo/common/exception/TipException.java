package top.yimo.common.exception;
/**
 * 
 * @author imTayle
 * @Email imTayle@126.com
 * @version 1.0 
 * @Time 2018-12-18 05:17:34
 */
public class TipException extends RuntimeException{
	/**   
	* @Fields serialVersionUID 
	*/   
	private static final long serialVersionUID = 7549577725563542972L;

	public TipException() {
    }

    public TipException(String message) {
        super(message);
    }

    public TipException(String message, Throwable cause) {
        super(message, cause);
    }

    public TipException(Throwable cause) {
        super(cause);
    }
}