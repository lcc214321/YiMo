var prefix = ctx + "sys/log";
function load() {
	$('#LogTable').bootstrapTable({
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
	    columns : [ {
		    checkbox : true
	    }, {
	        field : 'id',
	        title : '',
	        visible : false
	    }, {
	        field : 'userId',
	        title : '用户id'
	    }, {
	        field : 'userName',
	        title : '用户名'
	    }, {
	        field : 'operationType',
	        title : '用户操作类型'
	    }, {
	        field : 'title',
	        title : '标题'
	    }, {
	        field : 'describe',
	        title : '日志描述'
	    },{
	        field : 'url',
	        title : 'url'
	    }, {
	        field : 'time',
	        title : '响应时间'
	    },  {
	        field : 'createTime',
	        title : '操作时间'
	    } ]
	});
}
// 批量删除
function batchRemove() {
	var rows = $('#LogTable').bootstrapTable('getSelections'); // 返回所有选择的行，当没有选择的记录时，返回一个空数组
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
			ids[i] = row['id'];
		});
		layer.close(index);
		YiMo.ajaxDelete({
		    data : {
			    "ids" : ids
		    },
		    url : prefix + '/batchRemove',
		    refresh : true,
		});
	}, function() {
	});
}
