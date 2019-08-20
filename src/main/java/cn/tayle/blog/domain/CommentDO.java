package cn.tayle.blog.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import cn.tayle.common.annotation.Excel;
import cn.tayle.common.domain.BaseDO;

/**
 * 评论 - b_comment
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年06月17日 16:02:33
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class CommentDO extends BaseDO {
	private static final long serialVersionUID = 1L;

	// comment表主键
	@Excel(name = "comment表主键", orderNum = 1)
	private Integer coid;
	// post表主键,关联字段
	@Excel(name = "post表主键,关联字段", orderNum = 2)
	private Integer cid;
	// 评论生成时的GMT unix时间戳
	@Excel(name = "评论生成时的GMT unix时间戳", orderNum = 3)
	private String created;
	// 评论作者
	@Excel(name = "评论作者", orderNum = 4)
	private String author;
	// 评论所属用户id
	@Excel(name = "评论所属用户id", orderNum = 5)
	private Integer authorId;
	// 评论所属内容作者id
	@Excel(name = "评论所属内容作者id", orderNum = 6)
	private Integer ownerId;
	// 评论者邮件
	@Excel(name = "评论者邮件", orderNum = 7)
	private String mail;
	// 评论者网址
	@Excel(name = "评论者网址", orderNum = 8)
	private String url;
	// 评论者ip地址
	@Excel(name = "评论者ip地址", orderNum = 9)
	private String ip;
	// 评论者客户端
	@Excel(name = "评论者客户端", orderNum = 10)
	private String agent;
	// 评论内容
	@Excel(name = "评论内容", orderNum = 11)
	private String content;
	// 评论类型
	@Excel(name = "评论类型", orderNum = 12)
	private String type;
	// 评论状态
	@Excel(name = "评论状态", orderNum = 13)
	private String status;
	// 父级评论
	@Excel(name = "父级评论", orderNum = 14)
	private Integer parent;
	@Excel(name = "评论作者头像", orderNum = 15)
	private String authorImg;
}
