package top.yimo.sys.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import top.yimo.common.constant.WebConstant;
import top.yimo.common.quartz.QuartzManager;
import top.yimo.sys.dao.JobDao;
import top.yimo.sys.domain.JobDO;
import top.yimo.sys.service.JobService;

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
		return jobDao.save(job);
	}

	@Override
	public int update(JobDO job) {
		return jobDao.update(job);
	}

	@Override
	public int remove(Integer jobId) {
		return jobDao.remove(jobId);
	}

	@Override
	public int batchRemove(Integer[] jobIds) {
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
		update(job);
	}

}
