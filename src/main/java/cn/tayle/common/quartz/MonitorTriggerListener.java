package cn.tayle.common.quartz;

import org.quartz.JobExecutionContext;
import org.quartz.Trigger;
import org.quartz.Trigger.CompletedExecutionInstruction;
import org.quartz.TriggerListener;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MonitorTriggerListener implements TriggerListener {
	private static final Logger log = LoggerFactory.getLogger(MonitorTriggerListener.class);

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return "MonitorTriggerListener";
	}

	@Override
	public void triggerFired(Trigger trigger, JobExecutionContext context) {
		log.info("Trigger 被触发了，此时job上的execute()方法将要被执行");

	}

	@Override
	public boolean vetoJobExecution(Trigger trigger, JobExecutionContext context) {
		// TODO Auto-generated method stub
		log.info("trigger被触发后，job将要被执行时Scheduler调用该方法，如返回true则job此次将不被执行");
		return false;
	}

	@Override
	public void triggerMisfired(Trigger trigger) {
		log.info("当前Trigger触发错过了");

	}

	@Override
	public void triggerComplete(Trigger trigger, JobExecutionContext context, CompletedExecutionInstruction triggerInstructionCode) {
		log.info("Trigger被触发并且完成了job的执行，此方法被调用");

	}
}
