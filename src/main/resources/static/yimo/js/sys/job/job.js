var prefix = ctx + "sys/job";
function load() {
	$('#JobTable').bootstrapTable(
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
	            sidePagination : "server", // 设置在哪里进行分页，可选值为"client" 或者
											// "server"
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
//	                    {
//	                        field : 'jobId',
//	                        title : '任务ID'
//	                    },
	                    {
	                        field : 'jobName',
	                        title : '任务名称'
	                    },
	                    {
	                        field : 'jobGroup',
	                        title : '任务组名'
	                    },
	                    {
	                        field : 'jobClassName',
	                        title : '任务方法'
	                    },
	                    {
	                        field : 'description',
	                        title : '任务描述'
	                    },
	                    {
	                        field : 'cronExpression',
	                        title : 'cron执行表达式'
	                    },
//	                    {
//	                        field : 'misfirePolicy',
//	                        title : '计划执行策略',
//	                        align : 'center',
//	                        formatter : function(value, row, index) {
//		                        // console.log(row );
//		                        if (value == '1') {
//			                        return '<span class="label label-danger">立即执行</span>';
//		                        } else if (value == '2') {
//			                        return '<span class="label label-primary">执行一次</span>';
//		                        } else if (value == '3') {
//			                        return '<span class="label label-primary">默认策略</span>';
//		                        }
//	                        }
//	                    },
	                    {
	                        field : 'status',
	                        title : '任务状态',
	                        align : 'center',
	                        formatter : function(value, row, index) {
		                        if (value == '0') {
			                        return '<a class="fa fa-toggle-off text-info fa-2x" title="启动任务" onclick="resume(\'' + row.jobId + '\')"></a>';
		                        } else if (value == '1') {
			                        return '<a class="fa fa-toggle-on text-info fa-2x" title="暂停任务" onclick="pause(\'' + row.jobId + '\')"></a> ';
		                        }
	                        }
	                    },
	                    {
	                        title : '操作',
	                        field : 'id',
	                        align : 'center',
	                        formatter : function(value, row, index) {
		                        var e = '<a class="btn btn-primary btn-sm ' + s_edit_h + '" href="#" mce_href="#" title="编辑" onclick="edit(\'' + row.jobId + '\',\'' + row.status
		                                + '\')"><i class="fa fa-edit"></i></a> ';
		                        var d = '<a class="btn btn-warning btn-sm ' + s_remove_h + '" href="#" title="删除"  mce_href="#" onclick="remove(\'' + row.jobId + '\',\'' + row.status
		                                + '\')"><i class="fa fa-remove"></i></a> ';
		                        return e + d;
	                        }
	                    } ]
	        });
}

function pause(id) {
	layer.confirm("确认要停止任务吗?", {
		btn : [ '确定', '取消' ]
	}, function(index) {
		layer.close(index);
		yimo.ajaxPost({
		    url : prefix + "/pause",
		    data : {
			    'jobId' : id,
		    },
		    refresh : true,
		});
	})
}

function resume(id) {
	layer.confirm("确认要恢复任务吗？", {
		btn : [ '确定', '取消' ]
	}, function(index) {
		layer.close(index);
		yimo.ajaxPost({
		    url : prefix + "/resume",
		    data : {
			    'jobId' : id,
		    },
		    refresh : true,
		});
	})
}

// 刷新
function refresh() {
	$('#JobTable').bootstrapTable('refresh');
}

function runCheck(status) {
	if (status == '1') {
		layer.msg('运行中的任务不允许操作，请先暂停任务', {
			time : 2000
		// 2s后自动关闭
		});
		return true;
	}
}

// 新增
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
// 编辑
function edit(id, status) {
	if (runCheck(status)){
		return;
	}
	layer.open({
	    type : 2,
	    title : '编辑',
	    maxmin : true,
	    shadeClose : false, // 点击遮罩关闭层
	    area : [ '800px', '520px' ],
	    content : prefix + '/edit/' + id // iframe的url
	});
}
// 删除
function remove(id,status) {
	if (runCheck(status)){
		return;
	}
	layer.confirm('确定要删除选中的记录？', {
		btn : [ '确定', '取消' ]
	}, function(index) {
		layer.close(index);
		yimo.ajaxDelete({
		    url : prefix + "/remove",
		    data : {
			    'jobId' : id
		    },
		    refresh : true,
		});
	})
}
// 批量删除
function batchRemove() {
	var rows = $('#JobTable').bootstrapTable('getSelections'); // 返回所有选择的行，当没有选择的记录时，返回一个空数组
	if (rows.length == 0) {
		layer.msg("请选择要删除的数据");
		return;
	}
	layer.confirm("确认要删除选中的'" + rows.length + "'条数据吗?", {
		btn : [ '确定', '取消' ]
	// 按钮
	}, function(index) {
		var ids = new Array();
		// 遍历所有选择的行数据，取每条数据对应的ID
		$.each(rows, function(i, row) {
			ids[i] = row['jobId'];
		});
		layer.close(index);
		yimo.ajaxDelete({
		    data : {
			    "ids" : ids
		    },
		    url : prefix + '/batchRemove',
		    refresh : true,
		});
	}, function() {
	});
}
