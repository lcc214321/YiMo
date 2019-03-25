package top.yimo.sys.dao;

import top.yimo.sys.domain.JobDO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

/**
 * 定时任务调度表
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年03月25日 16:25:43
 */
@Mapper
public interface JobDao {

	JobDO get(Integer jobId);
	
	List<JobDO> listByPage(Map<String,Object> map);
	
	int count(Map<String,Object> map);
	
	int save(JobDO job);
	
	int update(JobDO job);
	
	int remove(Integer job_id);
	
	int batchRemove(Integer[] jobIds);
}
