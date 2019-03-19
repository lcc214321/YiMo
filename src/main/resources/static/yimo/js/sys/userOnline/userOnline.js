var prefix = ctx + "sys/userOnline";
function load() {
	$('#UserOnlineTable').bootstrapTable({
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
	        field : 'sessionId',
	        title : 'sessionId'
	    }, {
	        field : 'userId',
	        title : '登录账号ID'
	    }, {
	        field : 'userName',
	        title : '登录账号'
	    }, {
	        field : 'deptName',
	        title : '部门名称'
	    }, {
	        field : 'ip',
	        title : '登录IP地址'
	    }, {
	        field : 'loginLocation',
	        title : '登录地点'
	    }, {
	        field : 'browser',
	        title : '浏览器类型'
	    }, {
	        field : 'os',
	        title : '操作系统'
	    }, {
	        field : 'status',
	        title : '在线状态',
	        formatter : function(value, row, index) {
		        if (value == 'on_line') {
			        return '<span class="label label-primary">在线</span>';
		        } else if (value == 'off_line') {
			        return '<span class="label label-danger">离线</span>';
		        }
	        }
	    }, {
	        field : 'beginTime',
	        title : 'session创建时间'
	    }, {
	        field : 'endTime',
	        title : 'session最后访问时间'
	    }, {
	        title : '操作',
	        field : 'id',
	        align : 'center',
	        formatter : function(value, row, index) {
		        var d = '<a class="btn btn-warning btn-sm ' + s_kickout_h + '" href="#" title="删除"  mce_href="#" onclick="kickout(\'' + row.sessionId + '\')"><i class="fa fa-remove"></i></a> ';
		        return d;
	        }
	    } ]
	});
}
// 刷新
function refresh() {
	$('#UserOnlineTable').bootstrapTable('refresh');
}
function kickout(id) {
	layer.confirm('确定要踢选中用户下线吗？', {
		btn : [ '确定', '取消' ]
	}, function(index) {
		layer.close(index);
		yimo.ajaxDelete({
		    url : prefix + "/kickout",
		    data : {
			    'sessionId' : id
		    },
		    refresh : true,
		});
	})
}
