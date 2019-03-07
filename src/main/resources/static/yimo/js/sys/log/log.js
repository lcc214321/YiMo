var prefix = ctx+"sys/log"
function load() {
	$('#LogTable')
			.bootstrapTable(
					{
						method : 'get', // 服务器数据的请求方式 get or post
						url : prefix + "/list", // 服务器数据的加载地址
						iconSize : 'outline',
						toolbar : '#exampleToolbar',
						striped : true, // 设置为true会有隔行变色效果
						dataType : "json", // 服务器返回的数据类型
						pagination : true, // 设置为true会在底部显示分页条
						queryParamsType : "limit",
						// 设置为limit则会发送符合RESTFull格式的参数
						singleSelect : false, // 设置为true将禁止多选
						pageSize : 10, // 如果设置了分页，每页数据条数
						pageNumber : 1, // 如果设置了分布，首页页码
						search : false, // 是否显示搜索框
						showColumns : false, // 是否显示内容下拉框（选择显示的列）
						sidePagination : "server", // 设置在哪里进行分页，可选值为"client" 或者 "server"
						queryParams : function(params) {
							return {
								limit : params.limit,
								offset : params.offset
							};
						},
						columns : [
								{
									checkbox : true
								},
																{
									field : 'id', 
									title : '' 
								},
																{
									field : 'userId', 
									title : '用户id' 
								},
																{
									field : 'userName', 
									title : '用户名' 
								},
																{
									field : 'operation', 
									title : '用户操作' 
								},
																{
									field : 'time', 
									title : '响应时间' 
								},
																{
									field : 'method', 
									title : '请求方法' 
								},
																{
									field : 'params', 
									title : '请求参数' 
								},
																{
									field : 'ip', 
									title : 'IP地址' 
								},
																{
									field : 'createTime', 
									title : '创建时间' 
								},]
					});
}
//刷新
function refresh() {
	$('#LogTable').bootstrapTable('refresh');
}
