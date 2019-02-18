package top.yimo.common.enums;

/**
 * 操作类型
 * @Author imTayle
 * @Email imTayle@126.com
 * @version 1.0
 * @Time 2019年1月18日 下午3:56:43
 */

public enum OperatorType {
	/**
     * 退出
     */
    LOGOUT,
	/**
     * 登陆
     */
    LOGIN,
    /**
     * 强退
     */
    FORCE,
	/**
     * 其它
     */
    OTHER,

    /**
     * 新增
     */
    INSERT,

    /**
     * 删除
     */
    DELETE,
    
    /**
     * 修改
     */
    UPDATE,
    
    /**
     * 查询
     */
    QUERY,
    
    /**
     * 授权
     */
    GRANT,

    /**
     * 导出
     */
    EXPORT,

    /**
     * 导入
     */
    IMPORT,

    /**
     * 生成代码
     */
    GENCODE,
    
    /**
     * 清空数据
     */
    CLEAN,
    /**
     * 
     */
    resetPwd,
}
