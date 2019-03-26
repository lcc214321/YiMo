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

import top.yimo.sys.domain.JobDO;

/**
 * quartz服务管理类
 * 
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年3月26日 上午11:27:31
 */
@Service
public class QuartzManager {
	private final static Logger LOGGER = LoggerFactory.getLogger(QuartzManager.class);

	@Autowired
	private Scheduler scheduler;

	/**
	 * 新增job
	* 
	* @param @param quartz
	* @param @return    
	* @return String    
	* @throws
	 */
	@SuppressWarnings({"unchecked", "rawtypes"})
	public void save(JobDO quartz) {
		try {
			// 如果是修改 删除旧的任务
			if (quartz.getOldJobGroup() != null) {
				remove(quartz);
			}
			Class cls = Class.forName(quartz.getJobClassName());
			cls.newInstance();
			// 构建job信息
			JobDetail job = JobBuilder.newJob(cls).withIdentity(quartz.getJobName(), quartz.getJobGroup()).withDescription(quartz.getDescription()).build();
			// 触发时间点
			CronScheduleBuilder cronScheduleBuilder = CronScheduleBuilder.cronSchedule(quartz.getCronExpression());

			Trigger trigger = TriggerBuilder.newTrigger().withIdentity("trigger-" + quartz.getJobName(), "trigger-" + quartz.getJobGroup())
			        .withSchedule(cronScheduleBuilder).build();
			// 添加触发器监听
			TriggerListener listener = new MonitorTriggerListener();
			scheduler.getListenerManager().addTriggerListener(listener);
			// 交由Scheduler安排触发
			scheduler.scheduleJob(job, trigger);
			LOGGER.debug("新增任务成功,{}", job.getKey().getName());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 立即执行任务
	* 
	* @param @param quartz
	* @param @return    
	* @return String    
	* @throws
	 */
	public void trigger(JobDO quartz) {
		try {
			JobKey key = new JobKey(quartz.getJobName(), quartz.getJobGroup());
			scheduler.triggerJob(key);
			LOGGER.debug("立即执行任务,{}", key.getName());
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 暂停任务
	* 
	* @param @param quartz
	* @param @return    
	* @return String    
	* @throws
	 */
	public void pause(JobDO quartz) {
		try {
			JobKey key = new JobKey(quartz.getJobName(), quartz.getJobGroup());
			scheduler.pauseJob(key);
			LOGGER.debug("暂停任务成功,{}", key.getName());
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 恢复任务
	* 
	* @param @param quartz
	* @param @return    
	* @return String    
	* @throws
	 */
	public void resume(JobDO quartz) {
		try {
			JobKey key = new JobKey(quartz.getJobName(), quartz.getJobGroup());
			scheduler.resumeJob(key);
			LOGGER.debug("恢复任务成功,{}", key.getName());
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 删除任务
	* 
	* @param @param quartz
	* @param @return    
	* @return String    
	* @throws
	 */
	public void remove(JobDO quartz) {
		try {
			TriggerKey triggerKey = TriggerKey.triggerKey(quartz.getJobName(), quartz.getJobGroup());
			// 停止触发器
			scheduler.pauseTrigger(triggerKey);
			// 移除触发器
			scheduler.unscheduleJob(triggerKey);
			// 删除任务
			scheduler.deleteJob(JobKey.jobKey(quartz.getJobName(), quartz.getJobGroup()));
			LOGGER.debug("删除任务成功,{}", JobKey.jobKey(quartz.getJobName()));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
