package top.yimo.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期处理工具类
 * 
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年1月21日 下午2:36:19
 */
public class DateUtils extends org.apache.commons.lang3.time.DateUtils {
	/**
	 * 时间格式(yyyy-MM-dd)
	 */
	public final static String DATE_PATTERN = "yyyy-MM-dd";
	/**
	 * 时间格式(yyyy-MM-dd HH:mm:ss)
	 */
	public final static String DATE_TIME_PATTERN = "yyyy-MM-dd HH:mm:ss";

	/**
	 * 时间格式( HH:mm:ss)
	 */
	public final static String TIME_PATTERN = "HH:mm:ss";

	public static String format(Date date) {
		return format(date, DATE_PATTERN);
	}

	/**
	 * 获取指定格式日期
	 * 
	 * @param @param date
	 * @param @param pattern
	 * @param @return
	 * @return String
	 */
	public static String format(Date date, String pattern) {
		if (date != null) {
			SimpleDateFormat df = new SimpleDateFormat(pattern);
			return df.format(date);
		}
		return null;
	}

	/**
	 * 计算距离现在多久，非精确
	 *
	 * @param date
	 * @return
	 */
	public static String getTimeBefore(Date date) {
		Date now = new Date();
		long l = now.getTime() - date.getTime();
		long day = l / (24 * 60 * 60 * 1000);
		long hour = (l / (60 * 60 * 1000) - day * 24);
		long min = ((l / (60 * 1000)) - day * 24 * 60 - hour * 60);
		long s = (l / 1000 - day * 24 * 60 * 60 - hour * 60 * 60 - min * 60);
		String r = "";
		if (day > 0) {
			r += day + "天";
		} else if (hour > 0) {
			r += hour + "小时";
		} else if (min > 0) {
			r += min + "分";
		} else if (s > 0) {
			r += s + "秒";
		}
		r += "前";
		return r;
	}

	/**
	 * 计算距离现在多久，精确
	 *
	 * @param date
	 * @return
	 */
	public static String getTimeBeforeAccurate(Date date) {
		Date now = new Date();
		long l = now.getTime() - date.getTime();
		long day = l / (24 * 60 * 60 * 1000);
		long hour = (l / (60 * 60 * 1000) - day * 24);
		long min = ((l / (60 * 1000)) - day * 24 * 60 - hour * 60);
		long s = (l / 1000 - day * 24 * 60 * 60 - hour * 60 * 60 - min * 60);
		String r = "";
		if (day > 0) {
			r += day + "天";
		}
		if (hour > 0) {
			r += hour + "小时";
		}
		if (min > 0) {
			r += min + "分";
		}
		if (s > 0) {
			r += s + "秒";
		}
		r += "前";
		return r;
	}

	/**
	 * 获得当前的日期毫秒
	 * 
	 * @return
	 */
	public static long nowTimeMillis() {
		return System.currentTimeMillis();
	}

	/**
	 * HH:mm:ss 当前时间
	 * 
	 * @return
	 */
	public static String getNowTime() {
		return new SimpleDateFormat(TIME_PATTERN).format(new Date());
	}

	/**
	 * yyyy-MM-dd HH:mm:ss 当前时间
	 * 
	 * @return
	 */
	public static String getNow() {
		return new SimpleDateFormat(DATE_TIME_PATTERN).format(new Date());
	}

	/**
	 * yyyy-MM-dd 当前日期
	 */
	public static String getNowDate() {
		return new SimpleDateFormat(DATE_PATTERN).format(new Date());
	}
}
