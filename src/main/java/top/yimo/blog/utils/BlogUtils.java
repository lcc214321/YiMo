package top.yimo.blog.utils;

import java.util.ArrayList;
import java.util.List;

import com.sun.syndication.feed.rss.Channel;
import com.sun.syndication.feed.rss.Content;
import com.sun.syndication.feed.rss.Item;
import com.sun.syndication.io.FeedException;
import com.sun.syndication.io.WireFeedOutput;

import top.yimo.blog.domain.ContentDO;
import top.yimo.blog.service.BlogCommons;
import top.yimo.common.util.DateUtils;

public class BlogUtils {
	/**
	 * 获取RSS输出
	 *
	 * @param articles
	 * @return
	 * @throws FeedException
	 */
	public static String getRssXml(List<ContentDO> articles) throws FeedException {
		Channel channel = new Channel("rss_2.0");
		channel.setTitle(BlogCommons.site_option("site_title"));
		channel.setLink(BlogCommons.site_url());
		channel.setDescription(BlogCommons.site_option("site_description"));
		channel.setLanguage("zh-CN");
		List<Item> items = new ArrayList<>();
		articles.forEach(article -> {
			Item item = new Item();
			item.setTitle(article.getTitle());
			Content content = new Content();
			content.setValue(BlogCommons.article(article.getContent()));
			item.setContent(content);
			item.setLink(BlogCommons.permalink(article.getCid(), article.getSlug()));
			item.setPubDate(DateUtils.parseDate(article.getCreated()));
			items.add(item);
		});
		channel.setItems(items);
		WireFeedOutput out = new WireFeedOutput();
		return out.outputString(channel);
	}
}
