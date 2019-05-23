var prefix = ctx + "sys/dict";
function load() {
	var options = {
	    url : prefix + "/list", // 服务器数据的加载地址
	    columns : [ {
		    checkbox : true
	    }, {
	        field : 'dictType',
	        title : '字典类型',
	        formatter : function(value, row, index) {
		        return '<a href="#" onclick="detail(\'' + row.dictType + '\')">' + value + '</a>';
	        }
	    }, {
	        field : 'dictDescribe',
	        title : '字典名称'
	    }, {
	        field : 'status',
	        title : '状态',
	        align : 'center',
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
		        var e = '<a class="btn btn-primary btn-sm ' + s_edit_h + '" href="#" mce_href="#" title="编辑" onclick="edit(\'' + row.dictType + '\')"><i class="fa fa-edit"></i></a> ';
		        var d = '<a class="btn btn-warning btn-sm ' + s_remove_h + '" href="#" title="删除"  mce_href="#" onclick="remove(\'' + row.dictType + '\')"><i class="fa fa-remove"></i></a> ';
		        return e + d;
	        }
	    } ]
	};
	YiMo.BSTable.load(options);
}
// 刷新
function refresh() {
	$('#DictTable').bootstrapTable('refresh');
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

// 编辑对应字典数据
function detail(dictType) {
	openPage(prefix + 'Data/' + dictType, '数据字典【' + dictType + '】编辑');
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
			    'dictType' : id
		    },
		    refresh : true,
		});
	})
}
// 批量删除
function batchRemove() {
	var rows = $('#DictTable').bootstrapTable('getSelections'); // 返回所有选择的行，当没有选择的记录时，返回一个空数组
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
			ids[i] = row['dictType'];
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
