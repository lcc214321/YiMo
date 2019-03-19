package top.yimo.sys.service;

import java.util.List;
import java.util.Map;

import top.yimo.sys.domain.UserOnlineDO;

/**
 * 在线用户记录
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @version 1.0
 * @date 2019年03月12日 10:04:16
 */
public interface UserOnlineService {

	UserOnlineDO get(String sessionid);

	List<UserOnlineDO> listByPage(Map<String, Object> map);

	int count(Map<String, Object> map);

	int save(UserOnlineDO userOnline);

	int kickout(String sessionId);

}
