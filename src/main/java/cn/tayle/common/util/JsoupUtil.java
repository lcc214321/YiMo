package cn.tayle.common.util;

import org.apache.commons.lang3.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.safety.Whitelist;

public class JsoupUtil {
	// 使用自带的basicWithImages 白名单
	private static final Whitelist whitelist = Whitelist.basicWithImages();
	/** 配置过滤化参数,不对代码进行格式化 */
	private static final Document.OutputSettings outputSettings = new Document.OutputSettings().prettyPrint(false);

	static {
		// 富文本编辑时一些样式是使用style来进行实现的
		// 比如红色字体 style="color:red;"
		// 所以需要给所有标签添加style属性
		whitelist.addAttributes(":all", "style");
	}

	public static String clean(String content) {
		if (StringUtils.isNotBlank(content)) {
			content = content.trim();
		}
		return Jsoup.clean(content, "", whitelist, outputSettings);
	}
}
