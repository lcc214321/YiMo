package top.yimo.common.interceptor;

import java.sql.Connection;
import java.util.Map;
import java.util.Properties;

import org.apache.ibatis.executor.parameter.ParameterHandler;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.stereotype.Component;

/**
 * 分页拦截器,<b>目前只支持mysql， 用于理解分页思想，后续集成PageHelper
 * 
 * <li>type 拦截的类型 四大对象之一(
 * Executor,ResultSetHandler,ParameterHandler,StatementHandler)
 * <li>method 拦截的方法
 * <li>args 参数,高版本需要加个Integer.class参数,不然会报错
 * 
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年1月17日 上午11:11:04
 */
@Intercepts({@Signature(type = StatementHandler.class, method = "prepare", args = {Connection.class, Integer.class})})
@Component
public class PageInterceptor implements Interceptor {
	// 每页显示的条目数
	private int limit;
	// 当前现实的页数
	private int offset;

	@SuppressWarnings("unchecked")
	@Override
	public Object intercept(Invocation invocation) throws Throwable {
		// 获取StatementHandler，默认是RoutingStatementHandler
		StatementHandler statementHandler = (StatementHandler) invocation.getTarget();
		// 获取statementHandler包装类
		MetaObject MetaObjectHandler = SystemMetaObject.forObject(statementHandler);

		// 分离代理对象链
		while (MetaObjectHandler.hasGetter("h")) {
			Object obj = MetaObjectHandler.getValue("h");
			MetaObjectHandler = SystemMetaObject.forObject(obj);
		}

		while (MetaObjectHandler.hasGetter("target")) {
			Object obj = MetaObjectHandler.getValue("target");
			MetaObjectHandler = SystemMetaObject.forObject(obj);
		}

		// 获取连接对象
		// Connection connection = (Connection) invocation.getArgs()[0];

		// 获取查询接口映射的相关信息
		MappedStatement mappedStatement = (MappedStatement) MetaObjectHandler.getValue("delegate.mappedStatement");
		String mapId = mappedStatement.getId();

		// 拦截以.ByPage结尾的请求，分页功能的统一实现
		if (mapId.matches(".+ByPage$")) {
			// 获取进行数据库操作时管理参数的handler
			ParameterHandler parameterHandler = (ParameterHandler) MetaObjectHandler.getValue("delegate.parameterHandler");
			// 获取请求时的参数
			Map<String, Object> paraObject = (Map<String, Object>) parameterHandler.getParameterObject();
			// 参数名称和在service中设置到map中的名称一致
			offset =Integer.valueOf(paraObject.get("offset").toString());
			limit =Integer.valueOf(paraObject.get("limit").toString());
			String sql = (String) MetaObjectHandler.getValue("delegate.boundSql.sql");

			// 构建分页功能的sql语句
			String limitSql;
			sql = sql.trim();
			limitSql = sql + " limit " + offset   + "," + limit;
			// 将构建完成的分页sql语句赋值个体'delegate.boundSql.sql'，偷天换日
			MetaObjectHandler.setValue("delegate.boundSql.sql", limitSql);
		}
		// 调用原对象的方法，进入责任链的下一级
		return invocation.proceed();
	}

	@Override
	public Object plugin(Object o) {
		if (o instanceof StatementHandler) {
            return Plugin.wrap(o, this);
        }
		return o;
	}

	/**
	 * 设置代理对象的参数 limit 默认为10 数据为mysql
	 */
	@Override
	public void setProperties(Properties properties) {
//		String limit = properties.getProperty("limit", "10");
//		String offset = properties.getProperty("offset", "1");
//
//		this.limit = Integer.valueOf(limit);
//		this.offset =  Integer.valueOf(offset);
	}

}
