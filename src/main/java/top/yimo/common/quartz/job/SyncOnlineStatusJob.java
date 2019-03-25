package top.yimo.common.quartz.job;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.QuartzJobBean;

import top.yimo.sys.service.UserOnlineService;

public class SyncOnlineStatusJob extends QuartzJobBean {
	@Autowired
	UserOnlineService userOnlineService;

	@Override
	protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
		userOnlineService.syncStatu();
	}

}
