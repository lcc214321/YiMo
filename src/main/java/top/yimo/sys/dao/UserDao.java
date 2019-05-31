package top.yimo.sys.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import top.yimo.sys.domain.UserDO;

/**
 * 
 * @author imTayle
 * @email imTayle@126.com
 * @date 2019年41月16日 17:41:03
 */
@Mapper
public interface UserDao {

	UserDO get(Long userId);

	UserDO findByUserName(String userName);

	List<UserDO> listByPage(Map<String, Object> map);

	int count(Map<String, Object> map);

	int save(UserDO user);

	int update(UserDO user);

	int remove(Long user_id);

	int batchRemove(Long[] userIds);

	List<UserDO> exportData(UserDO user);

	UserDO checkUserUnique(UserDO user);
}
