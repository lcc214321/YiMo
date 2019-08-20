package cn.tayle.sys.service;

import java.util.List;
import java.util.Map;

import cn.tayle.sys.domain.JobDO;

/**
 * 定时任务调度表
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年03月25日 16:25:43
 */
public interface JobService {

	JobDO get(Integer jobId);

	List<JobDO> listByPage(Map<String, Object> map);

	int count(Map<String, Object> map);

	int save(JobDO job);

	int update(JobDO job);

	int remove(Integer jobId);

	int batchRemove(Integer[] jobIds);

	void changeStatus(Integer jobId, String operation);

	String checkCronExpressionIsValid(String cronExpression);
}
