var prefix = ctx + "sys/dept"
function load() {
	$('#DeptTable').bootstrapTreeTable({
	    id : 'deptId',
	    code : 'deptId',
	    parentCode : 'parentId',
	    method : 'get', // 服务器数据的请求方式 get or post
	    url : prefix + "/list", // 服务器数据的加载地址
	    ajaxParams : {
		    sort : 'order_no'
	    }, // 请求数据的ajax的data属性
	    expandColumn : '2',// 在哪一列上面显示展开按钮
	    striped : true, // 是否各行渐变色
	    bordered : true, // 是否显示边框
	    expandAll : false, // 是否全部展开
	    columns : [ {
	        field : 'deptId',
	        title : '编号',
	        visible : false,
	    }, {
	        field : 'parentId',
	        title : '上级部门ID',
	        visible : false,
	    }, {
	        field : 'deptName',
	        title : '部门名称'
	    }, {
	        field : 'orderNo',
	        title : '排序'
	    }, {
	        field : 'status',
	        title : '状态',
	        formatter : function(value, row, index) {
		        if (value == '0') {
			        return '<span class="label label-danger">禁用</span>';
		        } else if (value == '1') {
			        return '<span class="label label-primary">正常</span>';
		        }
	        }
	    }, {
	        title : '操作',
	        field : 'id',
	        align : 'center',
	        formatter : function(value, row, index) {
		        var e = '<a class="btn btn-primary btn-sm ' + s_edit_h + '" href="#" mce_href="#" title="编辑" onclick="edit(\'' + row.deptId + '\')"><i class="fa fa-edit"></i></a> ';
		        var d = '<a class="btn btn-warning btn-sm ' + s_remove_h + '" href="#" title="删除"  mce_href="#" onclick="remove(\'' + row.deptId + '\')"><i class="fa fa-remove"></i></a> ';
		        var a = '<a class="btn btn-success btn-sm ' + s_add_h + '" href="#" title="添加下级部门"  mce_href="#" onclick="add(\'' + row.deptId + '\')"><i class="fa fa-plus-circle"></i></a> ';
		        return e + d + a;
	        }
	    } ]
	});
}
// 刷新
function refresh() {
	console.log("进入刷新");
	
	$('#DeptTable').bootstrapTreeTable('refresh');

}
// 新增
function add(id) {
	layer.open({
	    type : 2,
	    title : '增加',
	    maxmin : true,
	    shadeClose : false, // 点击遮罩关闭层
	    area : [ '800px', '520px' ],
	    content : prefix + '/add/' + id // iframe的url
	});
}
// 编辑
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
	}, function(index) {
		layer.close(index);
		yimo.ajaxDelete({
		    url : prefix + "/remove",
		    data : {
			    'deptId' : id
		    },
		    refresh : true,
		});
	});
}
