package cn.tayle.sys.service;

import java.util.List;
import java.util.Map;

import cn.tayle.sys.domain.UserOnlineDO;

/**
 * 在线用户记录
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年03月12日 10:04:16
 */
public interface UserOnlineService {

	// 获取活跃的session信息
	UserOnlineDO getActive(String sessionId);

	UserOnlineDO get(String sessionId);

	List<UserOnlineDO> listByPage(Map<String, Object> map);

	int count(Map<String, Object> map);

	int save(UserOnlineDO userOnline);

	int kickout(String sessionId);

	public void syncStatu();
}
