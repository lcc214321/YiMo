package top.yimo.sys.service;

import java.util.List;
import java.util.Map;

import top.yimo.sys.domain.UserDO;

/**
 * 
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @date 2019年41月16日 17:41:03
 */
public interface UserService {

	UserDO get(Long userId);

	UserDO findByUserName(String userName);

	List<UserDO> listByPage(Map<String, Object> map);

	int count(Map<String, Object> map);

	int save(UserDO user);

	int update(UserDO user);

	int remove(Long userId);

	int batchRemove(Long[] userIds);

	/**
	 * 重置密码
	 */
	int resetPwd(Long userId) throws Exception;

	/**
	 * 判断userName是否唯一
	 */
	boolean checkUserNameUnique(String userName);
}
