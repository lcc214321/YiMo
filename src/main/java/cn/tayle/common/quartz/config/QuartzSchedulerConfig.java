package cn.tayle.common.quartz.config;

import org.springframework.boot.autoconfigure.quartz.SchedulerFactoryBeanCustomizer;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
/**
 * Quartz配置类
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年3月22日 下午5:37:46
 */
@Configuration
public class QuartzSchedulerConfig implements SchedulerFactoryBeanCustomizer {

	@Override
	public void customize(SchedulerFactoryBean schedulerFactoryBean) {
		schedulerFactoryBean.setStartupDelay(2);
		schedulerFactoryBean.setAutoStartup(true);
		schedulerFactoryBean.setOverwriteExistingJobs(true);
	}
}
