package cn.tayle.blog.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@ConfigurationProperties(prefix = "blog")
@Component
public class BlogConfig {
	public static int articlePageSize;
	public static int commentPgaeSize;
	public static int pageMax;
	public static String weibo;
	public static String zhihu;
	public static String github;
	public static String twitter;
	public static String gitee;

	public static int hitExceed;
	public static int hitsLimitTime;
	public static int commentLimitTime;
	public static String title;
	public static String description;
	public static String motto;
	public static String keywords;

	public static String getGitee() {
		return gitee;
	}

	public void setGitee(String gitee) {
		BlogConfig.gitee = gitee;
	}

	public static String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		BlogConfig.keywords = keywords;
	}

	public static String getMotto() {
		return motto;
	}

	public void setMotto(String motto) {
		BlogConfig.motto = motto;
	}

	public static String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		BlogConfig.title = title;
	}

	public static String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		BlogConfig.description = description;
	}

	public static int getCommentLimitTime() {
		return commentLimitTime;
	}

	public void setCommentLimitTime(int commentLimitTime) {
		BlogConfig.commentLimitTime = commentLimitTime;
	}

	public static int getHitExceed() {
		return hitExceed;
	}

	public void setHitExceed(int hitExceed) {
		BlogConfig.hitExceed = hitExceed;
	}

	public static int getHitsLimitTime() {
		return hitsLimitTime;
	}

	public void setHitsLimitTime(int hitsLimitTime) {
		BlogConfig.hitsLimitTime = hitsLimitTime;
	}

	public static int getArticlePageSize() {
		return articlePageSize;
	}

	public void setArticlePageSize(int articlePageSize) {
		BlogConfig.articlePageSize = articlePageSize;
	}

	public static int getCommentPgaeSize() {
		return commentPgaeSize;
	}

	public void setCommentPgaeSize(int commentPgaeSize) {
		BlogConfig.commentPgaeSize = commentPgaeSize;
	}

	public static int getPageMax() {
		return pageMax;
	}

	public void setPageMax(int pageMax) {
		BlogConfig.pageMax = pageMax;
	}

	public static String getWeibo() {
		return weibo;
	}

	public void setWeibo(String weibo) {
		BlogConfig.weibo = weibo;
	}

	public static String getZhihu() {
		return zhihu;
	}

	public void setZhihu(String zhihu) {
		BlogConfig.zhihu = zhihu;
	}

	public static String getGithub() {
		return github;
	}

	public void setGithub(String github) {
		BlogConfig.github = github;
	}

	public static String getTwitter() {
		return twitter;
	}

	public void setTwitter(String twitter) {
		BlogConfig.twitter = twitter;
	}

}
