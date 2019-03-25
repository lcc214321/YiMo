package top.yimo.common.quartz;

import org.quartz.CronScheduleBuilder;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.TriggerKey;
import org.quartz.TriggerListener;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import top.yimo.sys.domain.JobDO;

@Service
public class QuartzManager {
	private final static Logger LOGGER = LoggerFactory.getLogger(QuartzManager.class);

	@Autowired
	private Scheduler scheduler;

	@SuppressWarnings({"unchecked", "rawtypes"})
	public String add(JobDO quartz) {
		LOGGER.info("新增任务");
		try {
			// 如果是修改 展示旧的 任务
			if (quartz.getOldJobGroup() != null) {
				JobKey key = new JobKey(quartz.getOldJobName(), quartz.getOldJobGroup());
				scheduler.deleteJob(key);
			}
			Class cls = Class.forName(quartz.getJobClassName());
			cls.newInstance();
			// 构建job信息
			JobDetail job = JobBuilder.newJob(cls).withIdentity(quartz.getJobName(), quartz.getJobGroup()).withDescription(quartz.getDescription()).build();
			// 触发时间点
			CronScheduleBuilder cronScheduleBuilder = CronScheduleBuilder.cronSchedule(quartz.getCronExpression());
			Trigger trigger = TriggerBuilder.newTrigger().withIdentity("trigger" + quartz.getJobName(), quartz.getJobGroup()).startNow()
			        .withSchedule(cronScheduleBuilder).build();
			// 添加触发器监听
			TriggerListener listener = new MonitorTriggerListener();
			scheduler.getListenerManager().addTriggerListener(listener);
			// 交由Scheduler安排触发
			scheduler.scheduleJob(job, trigger);
		} catch (Exception e) {
			e.printStackTrace();
			// return Result.error();
			return "新增失败";
		}
		return "新增成功";
	}

	@RequestMapping("/trigger")
	public String trigger(JobDO quartz) {
		LOGGER.info("触发任务");
		try {
			JobKey key = new JobKey(quartz.getJobName(), quartz.getJobGroup());
			scheduler.triggerJob(key);
		} catch (SchedulerException e) {
			e.printStackTrace();
			return "触发失败";
		}
		return "触发成功";
	}

	public String pause(JobDO quartz) {
		LOGGER.info("停止任务");
		try {
			JobKey key = new JobKey(quartz.getJobName(), quartz.getJobGroup());
			scheduler.pauseJob(key);
		} catch (SchedulerException e) {
			e.printStackTrace();
			return "停止任务失败";
		}
		return "停止任务成功";
	}

	@RequestMapping("/resume")
	public String resume(JobDO quartz) {
		LOGGER.info("恢复任务");
		try {
			JobKey key = new JobKey(quartz.getJobName(), quartz.getJobGroup());
			scheduler.resumeJob(key);
		} catch (SchedulerException e) {
			e.printStackTrace();
			return "恢复任务失败";
		}
		return "恢复任务成功";
	}

	@RequestMapping("/remove")
	public String remove(JobDO quartz) {
		LOGGER.info("移除任务");
		try {
			TriggerKey triggerKey = TriggerKey.triggerKey(quartz.getJobName(), quartz.getJobGroup());
			// 停止触发器
			scheduler.pauseTrigger(triggerKey);
			// 移除触发器
			scheduler.unscheduleJob(triggerKey);
			// 删除任务
			scheduler.deleteJob(JobKey.jobKey(quartz.getJobName(), quartz.getJobGroup()));
			System.out.println("removeJob:" + JobKey.jobKey(quartz.getJobName()));
		} catch (Exception e) {
			e.printStackTrace();
			return "移除失败";
		}
		return "移除成功";
	}
}
