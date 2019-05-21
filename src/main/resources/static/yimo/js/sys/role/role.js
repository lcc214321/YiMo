var prefix = ctx + "sys/role";
function load() {
	
	var options = {
	    tableId : 'RoleTable',
	    url : prefix + "/list",
	    columns : [ {
		    checkbox : true
	    }, {
	        field : 'roleId',
	        visible : false,
	        title : '角色编号'
	    }, {
	        field : 'roleName',
	        title : '角色名称'
	    }, {
	        field : 'roleSign',
	        title : '角色标识'
	    }, {
	        field : 'status',
	        title : '是否有效',
	        formatter : function(value, row, index) {
		        var dictData = $.YiMo.getDictData('Status', value);
		        return '<span class="label ' + dictData.dictDescribe + '">' + dictData.dictName + '</span>';
	        }
	    }, {
	        field : 'remark',
	        title : '备注'
	    }, {
	        title : '操作',
	        field : 'id',
	        align : 'center',
	        formatter : function(value, row, index) {
		        var e = '<a class="btn btn-primary btn-sm ' + s_edit_h + '" href="#" mce_href="#" title="编辑" onclick="edit(\'' + row.roleId + '\')"><i class="fa fa-edit"></i></a> ';
		        var d = '<a class="btn btn-warning btn-sm ' + s_remove_h + '" href="#" title="删除"  mce_href="#" onclick="remove(\'' + row.roleId + '\')"><i class="fa fa-remove"></i></a> ';
		        return e + d;
	        }
	    } ]
	}
	YiMo.BSTable.load(options);
}
// 刷新
function refresh() {
	$('#RoleTable').bootstrapTable('refresh');
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
// 删除
function remove(id) {
	layer.confirm('确定要删除选中的记录？', {
		btn : [ '确定', '取消' ]
	}, function(index) {
		layer.close(index);
		yimo.ajaxDelete({
		    url : prefix + "/remove",
		    data : {
			    'roleId' : id
		    },
		    refresh : true,
		});
	})
}
// 批量删除
function batchRemove() {
	var rows = $('#RoleTable').bootstrapTable('getSelections'); // 返回所有选择的行，当没有选择的记录时，返回一个空数组
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
			ids[i] = row['roleId'];
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
