var prefix = ctx+"sys/log"
$(function() {
	load();
	validateRule();
});

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
								},
																{
									title : '操作',
									field : 'id',
									align : 'center',
									formatter : function(value, row, index) {
										var e = '<a class="btn btn-primary btn-sm '+s_edit_h+'" href="#" mce_href="#" title="编辑" onclick="edit(\''
												+ row.id
												+ '\')"><i class="fa fa-edit"></i></a> ';
										var d = '<a class="btn btn-warning btn-sm '+s_remove_h+'" href="#" title="删除"  mce_href="#" onclick="remove(\''
												+ row.id
												+ '\')"><i class="fa fa-remove"></i></a> ';
										return e + d ;
									}
								} ]
					});
}
//刷新
function refresh() {
	$('#LogTable').bootstrapTable('refresh');
}
//新增
function add() {
	layer.open({
		type : 2,
		title : '增加',
		maxmin : true,
		shadeClose : false, // 点击遮罩关闭层
		area : [ '800px', '520px' ],
		content : prefix + '/add' // iframe的url
	});
}
//编辑
function edit(id) {
	layer.open({
		type : 2,
		title : '编辑',
		maxmin : true,
		shadeClose : false, // 点击遮罩关闭层
		area : [ '800px', '520px' ],
		content : prefix + '/edit/' + id // iframe的url
	});
}
//删除
function remove(id) {
	layer.confirm('确定要删除选中的记录？', {
		btn : [ '确定', '取消' ]
	},  function() {
		yimo.ajaxDelete({
			url : prefix + "/remove",
			data : {
				'userId' : id
			},
		});
	})
}
//批量删除
function batchRemove() {
	var rows = $('#LogTable').bootstrapTable('getSelections'); // 返回所有选择的行，当没有选择的记录时，返回一个空数组
	if (rows.length == 0) {
		layer.msg("请选择要删除的数据");
		return;
	}
	layer.confirm("确认要删除选中的'" + rows.length + "'条数据吗?", {
		btn : [ '确定', '取消' ]
	// 按钮
	}, function() {
		var ids = new Array();
		// 遍历所有选择的行数据，取每条数据对应的ID
		$.each(rows, function(i, row) {
			ids[i] = row['userId'];
		});
		yimo.ajaxDelete({
			type : 'POST',
			data : {
				"ids" : ids
			},
			url : prefix + '/batchRemove',
		});
	}, function() {
	});
}


function save() {
	yimo.ajaxPost({
		url : prefix + "/save",
		data : $('#LogForm').serialize(),
	});
}

function update() {
	yimo.ajaxPut({
		url : prefix + "/update",
		data : $('#LogForm').serialize(),// 你的formid

	});
}