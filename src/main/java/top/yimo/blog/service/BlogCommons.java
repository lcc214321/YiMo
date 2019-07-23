package top.yimo.blog.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.commonmark.Extension;
import org.commonmark.ext.gfm.tables.TablesExtension;
import org.commonmark.node.Node;
import org.commonmark.parser.Parser;
import org.commonmark.renderer.html.HtmlRenderer;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.vdurmont.emoji.EmojiParser;

import top.yimo.blog.config.BlogConfig;
import top.yimo.blog.domain.ContentDO;
import top.yimo.common.YiMoConfig;
import top.yimo.common.util.DateUtils;
import top.yimo.common.util.YiMoUtils;

/**
 * 公共资源类,用于blog页面使用
 * 
 * @author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2018-12-18 05:17:34
 */
@Service("commons")
public final class BlogCommons {

	public static String THEME = "themes/default/";
	public static final String prefix = "resource/";
	public static final List EMPTY = new ArrayList(0);

	public static final String BLOG = "/blog/";

	public static String getResourcePath(String url) {
		return getBlogPath() + prefix + url;
	}

	public static String getThemePath(String url) {
		return BLOG + THEME + url;
	}

	public static String getBlogPath() {
		return YiMoConfig.getContextPath() + BLOG;
	}

	/**
	 * 判断分页中是否有数据
	 *
	 * @param paginator
	 * @return
	 */
	public static boolean is_empty(PageInfo<?> paginator) {
		return paginator == null || (paginator.getList() == null) || (paginator.getList().size() == 0);
	}

	/**
	 * 网站链接
	 *
	 * @return
	 */
	public static String site_url() {
		return site_url("");
	}

	/**
	 * 返回网站链接下的全址
	 *
	 * @param sub 前面追加的地址
	 * @return
	 */
	public static String site_url(String sub) {
		return getBlogPath() + sub;
	}

	/**
	 * 网站标题
	 *
	 * @return
	 */
	public static String site_title() {
		return site_option("Tayle博客");
	}

	/**
	 * 网站配置项
	 *
	 * @param key
	 * @return
	 */
	public static String site_option(String key) {
		return site_option(key, "");
	}

	/**
	 * 网站配置项
	 *
	 * @param key
	 * @param defalutValue 默认值
	 * @return
	 */
	public static String site_option(String key, String defalutValue) {
		if (StringUtils.isBlank(key)) {
			return "";
		}
		String str = "";
		if (StringUtils.isNotBlank(str)) {
			return str;
		} else {
			return defalutValue;
		}
	}

	/**
	 * 截取字符串
	 *
	 * @param str
	 * @param len
	 * @return
	 */
	public static String substr(String str, int len) {
		if (str.length() > len) {
			return str.substring(0, len);
		}
		return str;
	}

	/**
	 * 返回主题URL
	 *
	 * @return
	 */
	public static String theme_url() {
		return site_url(BlogCommons.THEME);
	}

	/**
	 * 返回主题下的文件路径
	 *
	 * @param sub
	 * @return
	 */
	public static String theme_url(String sub) {
		return site_url(BlogCommons.THEME + sub);
	}

	/**
	 * 返回文章链接地址
	 *
	 * @param content
	 * @return
	 */
	public static String permalink(ContentDO content) {
		return permalink(content.getCid(), content.getSlug());
	}

	public static int randomImg(int max, String str) {
		return YiMoUtils.getRandomNumber(1, 19);
	}

	/**
	 * 返回文章链接地址
	 *
	 * @param cid
	 * @param slug
	 * @return
	 */
	public static String permalink(Integer cid, String slug) {
		return site_url("article/" + (StringUtils.isNotBlank(slug) ? slug : cid.toString()));
	}

	/**
	 * 返回评论对应文章连接地址
	 * 
	 * @param cid
	 * @param coid
	 * @return
	 */
	public static String commentlink(Integer cid, String coid) {
		return site_url("/article/" + cid + "#comment-" + coid);
	}

	/**
	 * 格式化unix时间戳为日期
	 *
	 * @param unixTime
	 * @return
	 */
	public static String fmtdate(Integer unixTime) {
		return fmtdate(unixTime, "yyyy-MM-dd");
	}

	/**
	 * 格式化unix时间戳为日期
	 *
	 * @param unixTime
	 * @param patten
	 * @return
	 */
	public static String fmtdate(Integer unixTime, String patten) {
		if (null != unixTime && StringUtils.isNotBlank(patten)) {
			return DateUtils.formatDateByUnixTime(unixTime, patten);
		}
		return "";
	}

	/**
	 * 显示分类
	 *
	 * @param categories
	 * @return
	 */
	public static String show_categories(String categories) throws UnsupportedEncodingException {
		if (StringUtils.isNotBlank(categories)) {
			String[] arr = categories.split(",");
			StringBuffer sbuf = new StringBuffer();
			for (String c : arr) {
				sbuf.append("<a href=\"" + getBlogPath() + "category/" + URLEncoder.encode(c, "UTF-8") + "\">" + c
						+ "</a>");
			}
			return sbuf.toString();
		}
		return show_categories("默认分类");
	}

	/**
	 * 显示标签
	 *
	 * @param tags
	 * @return
	 */
	public static String show_tags(String tags) throws UnsupportedEncodingException {
		if (StringUtils.isNotBlank(tags)) {
			String[] arr = tags.split(",");
			StringBuffer sbuf = new StringBuffer();
			for (String c : arr) {
				sbuf.append("<a href=\"/tag/" + URLEncoder.encode(c, "UTF-8") + "\">" + c + "</a>");
			}
			return sbuf.toString();
		}
		return "";
	}

	/**
	 * 截取文章摘要
	 *
	 * @param value 文章内容
	 * @param len   要截取文字的个数
	 * @return
	 */
	public static String intro(String value, int len) {
		int pos = value.indexOf("<!--more-->");
		if (pos != -1) {
			String html = value.substring(0, pos);
			return htmlToText(mdToHtml(html));
		} else {
			String text = htmlToText(mdToHtml(value));
			if (text.length() > len) {
				return text.substring(0, len);
			}
			return text;
		}
	}

	/**
	 * 显示文章内容，转换markdown为html
	 *
	 * @param value
	 * @return
	 */
	public static String article(String value) {
		if (StringUtils.isNotBlank(value)) {
			value = value.replace("<!--more-->", "\r\n");
			return mdToHtml(value);
		}
		return "";
	}

	/**
	 * 显示文章缩略图，顺序为：文章第一张图 -> 随机获取
	 *
	 * @return
	 */
	public static String show_thumb(ContentDO content) {
		int cid = content.getCid();
		int size = cid % 20;
		size = size == 0 ? 1 : size;
		return getResourcePath("img/rand/" + size + ".jpg");
	}

	/**
	 * An :grinning:awesome :smiley:string &#128516;with a few :wink:emojis!
	 * <p>
	 * 这种格式的字符转换为emoji表情
	 *
	 * @param value
	 * @return
	 */
	public static String emoji(String value) {
		return EmojiParser.parseToUnicode(value);
	}

//	/**
//	 * 获取文章第一张图片
//	 *
//	 * @return
//	 */
//	public static String show_thumb(String content) {
//		content = TaleUtils.mdToHtml(content);
//		if (content.contains("<img")) {
//			String img = "";
//			String regEx_img = "<img.*src\\s*=\\s*(.*?)[^>]*?>";
//			Pattern p_image = Pattern.compile(regEx_img, Pattern.CASE_INSENSITIVE);
//			Matcher m_image = p_image.matcher(content);
//			if (m_image.find()) {
//				img = img + "," + m_image.group();
//				// //匹配src
//				Matcher m = Pattern.compile("src\\s*=\\s*\'?\"?(.*?)(\'|\"|>|\\s+)").matcher(img);
//				if (m.find()) {
//					return m.group(1);
//				}
//			}
//		}
//		return "";
//	}

	private static final String[] ICONS = { "bg-ico-book", "bg-ico-game", "bg-ico-note", "bg-ico-chat", "bg-ico-code",
			"bg-ico-image", "bg-ico-web", "bg-ico-link", "bg-ico-design", "bg-ico-lock" };

	/**
	 * 显示文章图标
	 *
	 * @param cid
	 * @return
	 */
	public static String show_icon(int cid) {
		return ICONS[cid % ICONS.length];
	}

	/**
	 * 获取社交的链接地址
	 *
	 * @return
	 */
	public static Map<String, String> social() {
		Map<String, String> map = new HashMap<>();
		map.put("weibo", BlogConfig.getWeibo());
		map.put("zhihu", BlogConfig.getZhihu());
		map.put("github", BlogConfig.getGithub());
		map.put("twitter", BlogConfig.getTwitter());
		return map;
	}

	/**
	 * 返回随机头像地址
	 *
	 * @param email
	 * @return
	 */
	public static String gravatar() {
		return "/img/a" + YiMoUtils.getRandomNumber(1, 9) + ".jpg";
	}

	/**
	 * 最新文章
	 *
	 * @param limit
	 * @return
	 */
//	public List<ContentVo> recent_articles(int limit) {
//		if (null == siteService) {
//			return EMPTY;
//		}
//		return siteService.recentcontent(limit);
//	}

	/**
	 * 最新评论
	 *
	 * @param limit
	 * @return
	 */
//	public List<CommentVo> recent_comment(int limit) {
//		if (null == siteService) {
//			return EMPTY;
//		}
//		return siteService.recentcomment(limit);
//	}

	/**
	 * 获取评论信息
	 * 
	 * @param comment
	 * @return
	 */
//	public String comment_info(CommentVo comment) {
//		return comment.getAuthor() + ": " + comment.getContent();
//	}

	/**
	 * 提取html中的文字
	 *
	 * @param html
	 * @return
	 */
	public static String htmlToText(String html) {
		if (StringUtils.isNotBlank(html)) {
			return html.replaceAll("(?s)<[^>]*>(\\s*<[^>]*>)*", " ");
		}
		return "";
	}

	/**
	 * markdown转换为html
	 *
	 * @param markdown
	 * @return
	 */
	public static String mdToHtml(String markdown) {
		if (StringUtils.isBlank(markdown)) {
			return "";
		}
		java.util.List<Extension> extensions = Arrays.asList(TablesExtension.create());
		Parser parser = Parser.builder().extensions(extensions).build();
		Node document = parser.parse(markdown);
		HtmlRenderer renderer = HtmlRenderer.builder().extensions(extensions).build();
		String content = renderer.render(document);
		content = emoji(content);
		return content;
	}

}