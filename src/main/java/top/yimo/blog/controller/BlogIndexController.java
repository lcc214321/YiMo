package top.yimo.blog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.vdurmont.emoji.EmojiParser;

import lombok.extern.slf4j.Slf4j;
import top.yimo.blog.config.BlogConfig;
import top.yimo.blog.domain.CommentDO;
import top.yimo.blog.domain.ContentDO;
import top.yimo.blog.domain.MetaDO;
import top.yimo.blog.model.vo.ArchiveVo;
import top.yimo.blog.service.BlogCommons;
import top.yimo.blog.service.CommentService;
import top.yimo.blog.service.ContentService;
import top.yimo.blog.service.MetaService;
import top.yimo.blog.utils.BlogUtils;
import top.yimo.common.controller.BaseController;
import top.yimo.common.model.vo.ResponseVo;
import top.yimo.common.util.DateUtils;
import top.yimo.common.util.MapCache;
import top.yimo.common.util.VerifyUtils;
import top.yimo.common.util.YiMoUtils;
import top.yimo.sys.service.DictDataService;

/**
 * 
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年6月18日 下午2:59:33
 */
@Controller
@RequestMapping("/blog")
@Slf4j
public class BlogIndexController extends BaseController {
	private MapCache cache = MapCache.single();
	@Autowired
	ContentService contentService;

	@Autowired
	CommentService commentService;

	@Autowired
	DictDataService dictDataService;

	@Autowired
	MetaService metaService;

	/**
	 * 首页
	 * 
	 * @return
	 */
	@RequestMapping({"/", ""})
	public String index(Model model) {
		return index(model, 1);
	}

	/**
	 * 首页分页
	 *
	 * @param request
	 *            request
	 * @param p
	 *            第几页
	 * @return 主页
	 */
	@GetMapping(value = "page/{p}")
	public String index(Model model, @PathVariable int p) {
		p = p < 0 || p > BlogConfig.getPageMax() ? 1 : p;
		Map<String, Object> para = new HashMap<String, Object>();
		para.put("status", "publish");
		para.put("type", "article");
		PageHelper.startPage(p, BlogConfig.getArticlePageSize());
		List<ContentDO> articles = contentService.listByPage(para);
		PageInfo<ContentDO> page = new PageInfo<ContentDO>(articles);
		model.addAttribute("articles", page);
		return sendRedirect("index");
	}

	/**
	 * 文章页
	 *
	 * @param request
	 *            请求
	 * @param slug
	 *            文章对应页面
	 * @return
	 */
	@GetMapping(value = {"article/{slug}", "article/{slug}.html"})
	public String getArticle(HttpServletRequest request, Model model, @PathVariable String slug) {
		ContentDO content = contentService.getArticle(slug);
		if (null == content || !"publish".equals(content.getStatus())) {
			return sendRedirect404();
		}
		return redirectContent(request, model, true, "article", content);
	}

	/**
	 * 文章页(预览)
	 *
	 * @param request
	 *            请求
	 * @param cid
	 *            文章主键
	 * @return
	 */
	@GetMapping(value = {"article/{slug}/preview", "article/{slug}.html"})
	public String articlePreview(HttpServletRequest request, Model model, @PathVariable String slug) {
		return getArticle(request, model, slug);
	}

	/**
	 * 自定义页面,如关于的页面
	 */
	@GetMapping(value = "/{slug}")
	public String page(HttpServletRequest request, @PathVariable String slug, Model model) {
		ContentDO content = contentService.getPage(slug);
		if (null == content) {
			return sendRedirect404();
		}
		return redirectContent(request, model, false, "page", content);
	}

	/**
	 * 根据content内容跳转到指定页面
	 * 
	 */
	public String redirectContent(HttpServletRequest request, Model model, boolean is_post, String redirectUrl, ContentDO content) {
		model.addAttribute("article", content);
		model.addAttribute("is_post", is_post);
		completeArticle(request, model, content);
		if (!checkHitsFrequency(request, content.getCid())) {
			updateArticleHit(content.getCid(), content.getHits());
		}
		return sendRedirect(redirectUrl);
	}

	/**
	 * 获取文章下评论信息
	 *
	 * @param request
	 * @param content
	 */
	private void completeArticle(HttpServletRequest request, Model model, ContentDO content) {
		if ("1".equals(content.getAllowComment())) {
			String cp = request.getParameter("cp");// 获取评论中的分页信息
			if (StringUtils.isBlank(cp)) {
				cp = "1";
			}
			PageHelper.startPage(Integer.valueOf(cp), BlogConfig.getCommentPgaeSize());
			HashMap<String, Object> para = new HashMap<String, Object>();
			para.put("cid", content.getCid());
			para.put("status", "approved");
			List<CommentDO> comment = commentService.listByPage(para);
			PageInfo<CommentDO> page = new PageInfo<CommentDO>(comment);
			if (page.getSize() > 0) {
				model.addAttribute("comment", page);
			}
		}
	}

	/**
	 * 检查同一个ip地址是否在配置时间内访问同一文章
	 *
	 * @param request
	 * @param cid
	 * @return
	 */
	private boolean checkHitsFrequency(HttpServletRequest request, int cid) {
		String val = YiMoUtils.getIpAddr(request) + ":" + cid;
		String key = "yimo" + val + "hits";
		Integer count = cache.hget(key, val);
		if (null != count && count > 0) {
			return true;
		}
		cache.hset(key, val, 1, BlogConfig.getHitsLimitTime());
		return false;
	}

	/**
	 * 更新文章的点击率
	 *
	 * @param cid
	 * @param chits
	 */
	private void updateArticleHit(Integer cid, Integer chits) {
		Integer hits = cache.hget("article" + cid, "hits");
		if (chits == null) {
			chits = 0;
		}
		hits = null == hits ? 1 : hits + 1;
		if (hits >= BlogConfig.getHitExceed()) {
			ContentDO temp = new ContentDO();
			temp.setCid(cid);
			temp.setHits(chits + hits);
			contentService.update(temp);
			cache.hset("article" + cid, "hits", 1);
		} else {
			cache.hset("article" + cid, "hits", hits);
		}
	}

	/**
	 * feed页
	 *
	 * @return
	 */
	@GetMapping(value = {"feed", "feed.xml"}, produces = {"application/xml;charset=UTF-8"})
	@ResponseBody
	public String feed(HttpServletResponse response) {
		String xml = "";
		HashMap<String, Object> para = new HashMap<>();
		para.put("allowFeed", 1);
		para.put("status", "publish");
		para.put("type", "article");
		List<ContentDO> articlesofFeed = contentService.listByPage(para);// 获取允许订阅并且已发布的文章
		try {
			xml = BlogUtils.getRssXml(articlesofFeed);
		} catch (Exception e) {
			log.error("生成RSS失败", e);
		}
		return xml;

	}

	/**
	 * 评论操作
	 */
	@PostMapping(value = "/comment")
	@ResponseBody
	public ResponseVo comment(HttpServletRequest request, HttpServletResponse response, @RequestParam Integer cid, @RequestParam Integer coid,
	        @RequestParam String author, @RequestParam String mail, @RequestParam String url, @RequestParam String text) {

		if (null == cid || StringUtils.isBlank(text)) {
			return ResponseVo.fail("请输入完整后评论");
		}

		if (StringUtils.isNotBlank(author) && author.length() > 50) {
			return ResponseVo.fail("姓名过长");
		}

		if (StringUtils.isNotBlank(mail) && !VerifyUtils.isEmail(mail)) {
			return ResponseVo.fail("请输入正确的邮箱格式");
		}

		if (StringUtils.isNotBlank(url) && !VerifyUtils.isURL(url)) {
			return ResponseVo.fail("请输入正确的URL格式");
		}

		if (text.length() > 200) {
			return ResponseVo.fail("请输入200个字符以内的评论");
		}

		String val = YiMoUtils.getIpAddr(request) + ":" + cid;
		String key = val + "comment";
		Integer count = cache.hget(key, val);
		System.out.println(cache.toString());
		if (null != count && count > 0) {
			return ResponseVo.fail("您发表评论太快了，请过会再试");
		}

		author = EmojiParser.parseToAliases(author);
		text = EmojiParser.parseToAliases(text);
		CommentDO comment = new CommentDO();
		if (StringUtils.isBlank(author)) {
			author = "热心网友";
		}
		comment.setAuthor(author);
		comment.setAuthorImg(BlogCommons.gravatar());
		comment.setCid(cid);
		comment.setIp(YiMoUtils.getIpAddr(request));
		comment.setUrl(url);
		comment.setContent(text);
		comment.setMail(mail);
		comment.setParent(coid);
		comment.setCreated(DateUtils.getNow());
		comment.setStatus("not_audit");
		comment.setType("comment");
		if (commentService.save(comment) > 0) {
			// 设置对每个文章5秒可以评论一次
			cache.hset(key, val, 1, BlogConfig.getCommentLimitTime());
			return ResponseVo.ok("评论发布成功");
		} else {
			return ResponseVo.fail("评论发布失败");

		}
	}

	/**
	 * 文章分类
	 * 
	 * @return
	 */
	@GetMapping(value = "category/{keyword}")
	public String categories(Model model, @PathVariable String keyword) {
		return categories(model, keyword, 1, 0);
	}

	@GetMapping(value = "category/{keyword}/{page}")
	public String categories(Model model, @PathVariable String keyword, @PathVariable int page, int limit) {
		ContentDO content = new ContentDO();
		content.setCategories(keyword);
		return getArticles(model, page, limit, content, keyword);
	}

	/**
	 * 文章搜索
	 *
	 */
	@GetMapping(value = "search/{keyword}")
	public String search(Model model, @PathVariable String keyword) {
		return search(model, keyword, 1, 0);
	}

	@GetMapping(value = "search/{keyword}/{page}")
	public String search(Model model, @PathVariable String keyword, @PathVariable int page, int limit) {
		ContentDO content = new ContentDO();
		content.setContent(keyword);
		return getArticles(model, page, limit, content, keyword);
	}

	/**
	 * 文章标签
	 *
	 */
	@GetMapping(value = "tag/{keyword}")
	public String tags(Model model, @PathVariable String keyword) {
		return tags(model, keyword, 1, 0);
	}

	@GetMapping(value = "tag/{keyword}/{page}")
	public String tags(Model model, @PathVariable String keyword, @PathVariable int page, int limit) {
		ContentDO content = new ContentDO();
		content.setTags(keyword.trim());
		return getArticles(model, page, limit, content, keyword);
	}

	/**
	 * 根据传入的不同条件查询文章 返回分页数据
	 */
	public String getArticles(Model model, int page, int limit, ContentDO content, String keyword) {
		page = page < 0 || page > BlogConfig.getPageMax() ? 1 : page;
		limit = limit <= 0 ? BlogConfig.getArticlePageSize() : limit;
		PageHelper.startPage(page, limit);
		List<ContentDO> contents = contentService.getArticlesByKeyWord(content);
		PageInfo<ContentDO> articles = new PageInfo<ContentDO>(contents);
		model.addAttribute("articles", articles);
		model.addAttribute("title", keyword.trim());
		return sendRedirect("page-category");
	}

	/**
	 * 归档页面
	 *
	 * @return
	 */
	@GetMapping(value = "/archives")
	public String archives(Model model) {
		List<ArchiveVo> archives = contentService.getArchives();
		model.addAttribute("archives", archives);
		model.addAttribute("title", "文章归档");
		if (archives.size() > 0 && archives.get(0).getArticles().size() > 0) {
			model.addAttribute("keywords", archives.get(0).getArticles().get(0).getTags());
		}
		return sendRedirect("archives");
	}

	/**
	 * 友链页面
	 *
	 * @return
	 */
	@GetMapping(value = "links")
	public String links(Model model) {
		List<MetaDO> links = metaService.getMetas("link");
		model.addAttribute("links", links);
		return sendRedirect("links");
	}

	private String sendRedirect404() {
		return sendRedirect("error_404.html");
	}

	private String sendRedirect(String url) {
		return BlogCommons.getThemePath(url);
	}
}
