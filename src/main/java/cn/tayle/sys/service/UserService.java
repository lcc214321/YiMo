package cn.tayle.sys.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import cn.tayle.sys.domain.UserDO;

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
	 * 更新密码
	 */
	int updatePwd(UserDO user, String pwd) throws Exception;

	/**
	 * 判断user是否唯一
	 */
	boolean checkUserUnique(UserDO user);

	/**
	 * 导出用户数据
	 */
	List<UserDO> exportData(UserDO user);

	String importData(List<UserDO> userList, boolean isCover);

	boolean checkPwd(String pwd, UserDO user);

	String uploadImg(String avatar_data, UserDO user) throws IOException;

}
