package cn.tayle.sys.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import cn.tayle.sys.domain.UserOnlineDO;

/**
 * 在线用户记录
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年03月12日 10:04:16
 */
@Mapper
public interface UserOnlineDao {

	UserOnlineDO getActive(String sessionid);

	UserOnlineDO get(String sessionid);

	List<UserOnlineDO> listByPage(Map<String, Object> map);

	int count(Map<String, Object> map);

	int save(UserOnlineDO userOnline);

	int update(UserOnlineDO userOnline);

	int remove(String sessionId);

	int batchRemove(String[] sessionids);

	List<UserOnlineDO> getActives();
}
