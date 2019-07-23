package top.yimo.blog.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import top.yimo.common.annotation.Excel;
import top.yimo.common.domain.BaseDO;

/**
 * 内容表 - b_content
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年06月17日 16:02:33
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class ContentDO extends BaseDO {
	private static final long serialVersionUID = 1L;

	// post表主键
	@Excel(name = "post表主键", orderNum = 1)
	private Integer cid;
	// 内容标题
	@Excel(name = "内容标题", orderNum = 2)
	private String title;
	// 内容缩略名
	@Excel(name = "内容缩略名", orderNum = 3)
	private String slug;
	// 内容生成时间
	@Excel(name = "内容生成时间", orderNum = 4)
	private String created;
	// 内容更改时间
	@Excel(name = "内容更改时间", orderNum = 5)
	private String modified;
	// 内容文字
	@Excel(name = "内容文字", orderNum = 6)
	private String content;
	// 内容所属用户id
	@Excel(name = "内容所属用户id", orderNum = 7)
	private Long authorId;
	// 内容类别
	@Excel(name = "内容类别", orderNum = 8)
	private String type;
	// 内容状态
	@Excel(name = "内容状态", orderNum = 9)
	private String status;
	// 标签列表
	@Excel(name = "标签列表", orderNum = 10)
	private String tags;
	// 分类列表
	@Excel(name = "分类列表", orderNum = 11)
	private String categories;
	// 点击次数
	@Excel(name = "点击次数", orderNum = 12)
	private Integer hits;
	// 内容所属评论数
	@Excel(name = "内容所属评论数", orderNum = 13)
	private Integer commentNum;
	// 是否允许评论
	@Excel(name = "是否允许评论", orderNum = 14)
	private String allowComment;
	// 是否允许ping
	@Excel(name = "是否允许ping", orderNum = 15)
	private String allowPing;
	// 允许出现在聚合中
	@Excel(name = "允许出现在聚合中", orderNum = 16)
	private String allowFeed;
}
