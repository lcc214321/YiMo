package top.yimo.common.util;

import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 
 * @author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2018-12-18 05:17:34
 */
public class MapCache {

	/**
	 * 默认存储1024个缓存
	 */
	private static final int DEFAULT_CACHES = 1024;

	private static final MapCache INS = new MapCache();

	public static MapCache single() {
		return INS;
	}

	/**
	 * 缓存容器
	 */
	private Map<String, CacheObject> cachePool;

	public MapCache() {
		this(DEFAULT_CACHES);
	}

	public MapCache(int cacheCount) {
		cachePool = new ConcurrentHashMap<>(cacheCount);
	}

	/**
	 * 读取缓存
	 *
	 * @param key 缓存key
	 * @param     <T>
	 * @return
	 */
	private <T> T get(String key) {
		CacheObject cacheObject = cachePool.get(key);
		if (null != cacheObject) {
			long cur = System.currentTimeMillis() / 1000;
			// 未过期直接返回
			if (cacheObject.getExpired() <= 0 || cacheObject.getExpired() > cur) {
				Object result = cacheObject.getValue();
				return (T) result;
			}
			// 已过期删除
			if (cur > cacheObject.getExpired()) {
				cachePool.remove(key);
			}
		}
		return null;
	}

	/**
	 * 读取hash类型缓存
	 *
	 * @param key   缓存key
	 * @param field 缓存field
	 * @param       <T>
	 * @return
	 */
	public <T> T hget(String key, String field) {
		key = key + ":" + field;
		return this.get(key);
	}

	/**
	 * 设置缓存
	 *
	 * @param key   缓存key
	 * @param value 缓存value
	 */
	private void set(String key, Object value) {
		this.set(key, value, -1);
	}

	/**
	 * 设置 缓存并带过期时间
	 *
	 * @param key     缓存key
	 * @param value   缓存value
	 * @param expired 过期时间，单位为秒
	 */
	private void set(String key, Object value, long expired) {
		expired = expired > 0 ? System.currentTimeMillis() / 1000 + expired : expired;
		// cachePool大于800时，强制清空缓存池，这个操作有些粗暴会导致误删问题，后期考虑用redis替代MapCache优化
		if (cachePool.size() > 800) {
			cachePool.clear();
		}
		CacheObject cacheObject = new CacheObject(key, value, expired);
		cachePool.put(key, cacheObject);
	}

	/**
	 * 设置hash缓存
	 *
	 * @param key   缓存key
	 * @param field 缓存field
	 * @param value 缓存value
	 */
	public void hset(String key, String field, Object value) {
		this.hset(key, field, value, -1);
	}

	/**
	 * 设置hash缓存并带过期时间
	 *
	 * @param key     缓存key
	 * @param field   缓存field
	 * @param value   缓存value
	 * @param expired 过期时间，单位为秒
	 */
	public void hset(String key, String field, Object value, long expired) {
		key = key + ":" + field;
		expired = expired > 0 ? System.currentTimeMillis() / 1000 + expired : expired;
		CacheObject cacheObject = new CacheObject(key, value, expired);
		cachePool.put(key, cacheObject);
	}

	/**
	 * 根据key删除缓存
	 *
	 * @param key 缓存key
	 */
	public void del(String key) {
		cachePool.remove(key);
	}

	/**
	 * 根据key和field删除缓存
	 *
	 * @param key   缓存key
	 * @param field 缓存field
	 */
	public void hdel(String key, String field) {
		key = key + ":" + field;
		this.del(key);
	}

	/**
	 * 清空缓存
	 */
	public void clean() {
		cachePool.clear();
	}

	static class CacheObject {
		private String key;
		private Object value;
		private long expired;

		public CacheObject(String key, Object value, long expired) {
			this.key = key;
			this.value = value;
			this.expired = expired;
		}

		public String getKey() {
			return key;
		}

		public Object getValue() {
			return value;
		}

		public long getExpired() {
			return expired;
		}

		@Override
		public String toString() {
			return "CacheObject [key=" + key + ", value=" + value + ", expired=" + expired + "]";
		}
	}

	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer();
		Set<Entry<String, CacheObject>> entrySet = cachePool.entrySet();
		int i = 0;
		for (Entry<String, CacheObject> entry : entrySet) {
			CacheObject value = entry.getValue();
			sb.append("序号:").append(++i).append(value.toString()).append("\r\n");
		}
		return "MapCache [\r\n" + sb.toString() + "]";
	}

}