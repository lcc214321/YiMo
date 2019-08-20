package cn.tayle.sys.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.tayle.common.constant.WebConstant;
import cn.tayle.common.quartz.QuartzManager;
import cn.tayle.common.util.CronUtils;
import cn.tayle.sys.dao.JobDao;
import cn.tayle.sys.domain.JobDO;
import cn.tayle.sys.service.JobService;

@Service
@Transactional(rollbackFor = Exception.class)
public class JobServiceImpl implements JobService {
	@Autowired
	private JobDao jobDao;
	@Autowired
	private QuartzManager quartzManager;

	@Override
	public JobDO get(Integer jobId) {
		return jobDao.get(jobId);
	}

	@Override
	public List<JobDO> listByPage(Map<String, Object> map) {
		return jobDao.listByPage(map);
	}

	@Override
	public int count(Map<String, Object> map) {
		return jobDao.count(map);
	}

	@Override
	public int save(JobDO job) {
		System.out.println(job.toString());

		quartzManager.save(job);
		return jobDao.save(job);
	}

	@Override
	public int update(JobDO job) {
		quartzManager.save(job);
		return jobDao.update(job);
	}

	@Override
	public int remove(Integer jobId) {
		JobDO job = get(jobId);
		quartzManager.remove(job);
		return jobDao.remove(jobId);
	}

	@Override
	public int batchRemove(Integer[] jobIds) {
		for (Integer jobId : jobIds) {
			JobDO job = get(jobId);
			quartzManager.remove(job);
		}
		return jobDao.batchRemove(jobIds);
	}

	@Override
	public void changeStatus(Integer jobId, String operation) {
		JobDO job = get(jobId);
		if (job == null) {
			return;
		}
		job.setStatus(operation);
		if (WebConstant.STATUS_RUNNING_STOP.equals(operation)) {
			quartzManager.pause(job);
		} else {
			quartzManager.resume(job);
		}
		jobDao.update(job);
	}

	/**
	 * 校验cron表达式是否正确 返回中文含义
	 */
	@Override
	public String checkCronExpressionIsValid(String cronExpression) {
		String translateToChinese = CronUtils.translateToChinese(cronExpression);
		return translateToChinese;
	}

}
