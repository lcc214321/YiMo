package top.yimo.common.util;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.NumberFormat;

import org.apache.commons.lang3.StringUtils;

/**
 * 数据转换工具类
 * 
 * @author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2018-12-18 05:17:34
 */
public class DataConvert {
	public static int iChange = 1;

	public DataConvert() {
	}

	public static String toString(Object object) {
		return toString(object, "");
	}

	/**
	 * 当object为空时，返回paramString2
	 * @param object
	 * @param paramString2
	 * @return
	 */
	public static String toString(Object object, String paramString2) {
		if (object == null) {
			return paramString2;
		}
		return toString(object.toString(), "");
	}
	public static String toString(String paramString) {
		return toString(paramString, "");
	}
	/**
	 * paramString1为空或者为null时返回paramString2
	 */
	public static String toString(String paramString1, String paramString2) {
		if (paramString1 == null || (paramString1.equals(""))) {
			return paramString2;
		}
		return paramString1;
	}

	public static String toHTMLString(String paramString) {
		return toString(paramString, "&nbsp;");
	}

	public static String toHTMLMoney(String paramString) {
		if ((paramString == null) || (paramString.equals(""))) {
			return "&nbsp;";
		}
		return toMoney(paramString);
	}

	public static String toString(Short paramShort) {
		if (paramShort == null) {
			return "";
		}
		return String.valueOf(paramShort);
	}

	public static String toString(Double paramDouble) {
		if (paramDouble == null) {
			return "";
		}
		return String.valueOf(paramDouble);
	}

	public static String toString(BigDecimal paramBigDecimal) {
		if (paramBigDecimal == null) {
			return "";
		}
		return String.valueOf(paramBigDecimal);
	}

	public static String toMoney(String paramString) {
		try {
			if ((paramString == null) || (paramString == "") || (paramString.equalsIgnoreCase("Null"))) {
				return "";
			}
			return toMoney(Double.valueOf(paramString).doubleValue());
		} catch (Exception localException) {
		}
		return paramString;
	}

	public static String toMoney(Double paramDouble) {
		if (paramDouble == null) {
			return "";
		}
		return toMoney(paramDouble.doubleValue());
	}

	public static String toMoney(double paramDouble) {
		NumberFormat localNumberFormat = NumberFormat.getInstance();
		localNumberFormat.setMinimumFractionDigits(2);
		localNumberFormat.setMaximumFractionDigits(2);
		return localNumberFormat.format(paramDouble);
	}

	public static String toMoney(BigDecimal paramBigDecimal) {
		return toMoney(String.valueOf(paramBigDecimal));
	}
	/**
	 * xxxx年xx月xx日
	 */
	public static String toDate_YMD(String paramString) {
		String str1 = paramString.substring(0, 4);
		String str2 = paramString.substring(4, 6);
		String str3 = paramString.substring(6, 8);
		String str4 = str1 + "年" + str2 + "月" + str3 + "日";
		return str4;
	}
	/**
	 * xxxx年xx月xx日至xxxx年xx月xx日
	 */
	public static String toDate_YMD2(String paramString1, String paramString2) {
		String str1 = paramString1.substring(0, 4);
		String str2 = paramString2.substring(0, 4);
		String str3 = paramString1.substring(4, 6);
		String str4 = paramString2.substring(4, 6);
		String str5 = paramString1.substring(6, 8);
		String str6 = paramString2.substring(6, 8);
		String str7 = str1 + "年" + str3 + "月" + str5 + "日至" + str2 + "年" + str4 + "月" + str6 + "日";
		return str7;
	}
	public static String toDate_YM(String paramString) {
		String str1 = paramString.substring(0, 4);
		String str2 = paramString.substring(4, 6);
		String str3 = str1 + "年" + str2 + "月";
		return str3;
	}

	public static String toDate_Y(String paramString) {
		String str1 = paramString.substring(0, 4);
		String str2 = str1 + "年";
		return str2;
	}

	public static String toDate_YMD0(String paramString) {
		String str1 = paramString.substring(0, 4);
		String str2 = paramString.substring(4, 6);
		String str3 = paramString.substring(6, 8);
		String str4 = "-";
		String str5 = str1 + str4 + str2 + str4 + str3;
		return str5;
	}

	public static String toRealString_old(String paramString) {
		try {
			String str = paramString;
			if (str != null) {
				str = new String(str.getBytes(), "ISO8859_1");
			}
			return str;
		} catch (UnsupportedEncodingException localUnsupportedEncodingException) {
		}
		return paramString;
	}

	public static String toRealString(String paramString) {
		return toRealString(iChange, paramString);
	}

	public static String toRealString(int paramInt, String paramString) {
		if (paramString == null) {
			return null;
		}
		try {
			String str = paramString;
			if (paramInt == 1) {
				return str;
			}
			if (str != null) {
				if (paramInt == 0) {
					str = new String(str.getBytes(), "ISO8859_1");
				}
				if (paramInt == 2) {
					str = new String(str.getBytes("ISO8859_1"), "GBK");
				}
				if (paramInt == 3) {
					str = new String(str.getBytes("GBK"), "ISO8859_1");
				}
				if (paramInt == 5) {
					str = decode(str, "GBK");
				}
			}
			return str;
		} catch (UnsupportedEncodingException localUnsupportedEncodingException) {
			return paramString;
		} catch (Exception localException) {
		}
		return paramString;
	}

	public static String decode(String paramString1, String paramString2) throws Exception {
		if (paramString1 == null) {
			return paramString1;
		}
		StringBuffer localStringBuffer = new StringBuffer();
		for (int i = 0; i < paramString1.length(); i++) {
			char c = paramString1.charAt(i);
			switch (c) {
				case '+' :
					localStringBuffer.append(' ');
					break;
				case '%' :
					try {
						localStringBuffer.append((char) Integer.parseInt(paramString1.substring(i + 1, i + 3), 16));
					} catch (NumberFormatException localNumberFormatException) {
						throw new IllegalArgumentException();
					}
					i += 2;
					break;
				default :
					localStringBuffer.append(c);
			}
		}
		String str = localStringBuffer.toString();
		byte[] arrayOfByte = str.getBytes("8859_1");
		return new String(arrayOfByte, paramString2);
	}

	public static double toDouble(String paramString) {
		if ((paramString == null) || (paramString.equals(""))) {
			return 0.0D;
		}
		// 支持科学计数法
		return new BigDecimal(paramString.trim()).doubleValue();
	}

	public static double toDouble(Object object) {
		return toDouble(toString(object));
	}

	/**
	 * 转换为BigDecimal<br>
	 * 如果给定的值为空，或者转换失败，返回默认值<br>
	 * 转换失败不会报错
	 * 
	 * @param value 被转换的值
	 * @param defaultValue 转换错误时的默认值
	 * @return 结果
	 */
	public static BigDecimal toBigDecimal(Object value, BigDecimal defaultValue) {
		if (value == null) {
			return defaultValue;
		}
		if (value instanceof BigDecimal) {
			return (BigDecimal) value;
		}
		if (value instanceof Long) {
			return new BigDecimal((Long) value);
		}
		if (value instanceof Double) {
			return new BigDecimal((Double) value);
		}
		if (value instanceof Integer) {
			return new BigDecimal((Integer) value);
		}
		final String valueStr = toString(value, null);
		if (StringUtils.isEmpty(valueStr)) {
			return defaultValue;
		}
		try {
			return new BigDecimal(valueStr);
		} catch (Exception e) {
			return defaultValue;
		}
	}
	public static BigDecimal toBigDecimal(Object object) {
		return toBigDecimal(object, null);
	}
	/**
	* 转换为Float<br>
	* 如果给定的值为空，或者转换失败，返回默认值<br>
	* 转换失败不会报错
	* @param value 被转换的值
	* @param defaultValue 转换错误时的默认值
	* @return 结果
	*/
	public static Float toFloat(Object value, Float defaultValue) {
		if (value == null) {
			return defaultValue;
		}
		if (value instanceof Float) {
			return (Float) value;
		}
		if (value instanceof Number) {
			return ((Number) value).floatValue();
		}
		final String valueStr = toString(value, null);
		if (StringUtils.isEmpty(valueStr)) {
			return defaultValue;
		}
		try {
			return Float.parseFloat(valueStr.trim());
		} catch (Exception e) {
			return defaultValue;
		}
	}

	/**
	     * 转换为Float<br>
	     * 如果给定的值为空，或者转换失败，返回默认值<code>null</code><br>
	     * 转换失败不会报错
	     * 
	     * @param value 被转换的值
	     * @return 结果
	     */
	public static Float toFloat(Object value) {
		return toFloat(value, null);
	}

	public static Long toLong(Object object) {
		return toLong(toString(object));
	}

	public static long toLong(String paramString) {
		if ((paramString == null) || (paramString.equals(""))) {
			return 0;
		}
		return new BigDecimal(paramString.trim()).longValue();
	}

	public static int toInt(String paramString) {
		if ((paramString == null) || (paramString.equals(""))) {
			return 0;
		}
		return Integer.parseInt(paramString);
	}

	public static int toInt(Object attribute) {
		if (attribute == null) {
			return 0;
		}
		return toInt(attribute.toString());
	}

	/**
	 * 驼峰转下划线
	 * @param object
	 * @return
	 */
	public static String camelToUnderScore(Object object) {
		if (object == null) {
			return "";
		}
		return camelToUnderScore(object.toString());
	}

	public static String camelToUnderScore(String str) {
		if (str == null) {
			return "";
		}
		StringBuilder sb = new StringBuilder();
		// 前置字符是否大写
		boolean preCharIsUpperCase = true;
		// 当前字符是否大写
		boolean curreCharIsUpperCase = true;
		// 下一字符是否大写
		boolean nexteCharIsUpperCase = true;
		for (int i = 0; i < str.length(); i++) {
			char c = str.charAt(i);
			if (i > 0) {
				preCharIsUpperCase = Character.isUpperCase(str.charAt(i - 1));
			} else {
				preCharIsUpperCase = false;
			}
			curreCharIsUpperCase = Character.isUpperCase(c);
			if (i < (str.length() - 1)) {
				nexteCharIsUpperCase = Character.isUpperCase(str.charAt(i + 1));
			}
			if (preCharIsUpperCase && curreCharIsUpperCase && !nexteCharIsUpperCase) {
				sb.append("_");
			} else if ((i != 0 && !preCharIsUpperCase) && curreCharIsUpperCase) {
				sb.append("_");
			}
			sb.append(Character.toLowerCase(c));
		}
		return sb.toString();
	}
}