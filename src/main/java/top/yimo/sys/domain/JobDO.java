package top.yimo.sys.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import top.yimo.common.domain.BaseDO;

/**
 * 定时任务调度表 表sys_job
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年03月25日 16:25:43
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class JobDO extends BaseDO {
	private static final long serialVersionUID = 1L;
	private String description;// 任务描述
	// 任务ID
	private Integer jobId;
	// 任务名称
	private String jobName;
	// 任务组名
	private String jobGroup;
	// 任务方法
	private String jobClassName;
	// 方法参数
	private String methodParams;
	// cron执行表达式
	private String cronExpression;
	// 计划执行错误策略（1立即执行 2执行一次 3放弃执行）
	private String misfirePolicy;
	// 状态（0正常 1暂停）
	private String status;
	// 备注信息
	private String remark;

	private String oldJobName;// 任务名称 用于修改
	private String oldJobGroup;// 任务分组 用于修改
}
