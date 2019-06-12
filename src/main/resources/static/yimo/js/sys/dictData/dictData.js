var prefix = ctx + "sys/dictData";
function load() {
	var options = {
	    url : prefix + "/list/" + dictType, // 服务器数据的加载地址
	    columns : [
	            {
		            checkbox : true
	            },
	            {
	                field : 'dictType',
	                title : '字典类型'
	            },
	            {
	                field : 'dictNo',
	                title : '字典编码'
	            },
	            {
	                field : 'dictName',
	                title : '字典含义'
	            },
	            {
	                field : 'dictDescribe',
	                title : '字典描述'
	            },
	            {
	                field : 'status',
	                title : '状态',
	                halign : 'center',
	                width : '68px',
	                formatter : function(value, row, index) {
		                var dictData = $.YiMo.getDictData('Status', value);
		                return '<span class="label ' + dictData.dictDescribe + '">' + dictData.dictName + '</span>';
	                }
	            },
	            {
	                title : '操作',
	                field : 'id',
	                halign : 'center',
	                width : '128px',
	                formatter : function(value, row, index) {
		                var e = '<a class="btn btn-primary btn-sm ' + s_edit_h + '" href="#" mce_href="#" title="编辑" onclick="edit(\'' + row.dictType + '\',\'' + row.dictNo
		                        + '\')"><i class="fa fa-edit"></i></a> ';
		                var d = '<a class="btn btn-warning btn-sm ' + s_remove_h + '" href="#" title="删除"  mce_href="#" onclick="remove(\'' + row.dictType + '\',\'' + row.dictNo
		                        + '\')"><i class="fa fa-remove"></i></a> ';
		                return e + d;
	                }
	            } ],
	};
	YiMo.BSTable.load(options);
}
// 新增
function add() {
	YiMo.add({
		url : prefix + '/add/' + dictType
	});
}
// 编辑
function edit(dictType, dictNo) {
	YiMo.edit({
		url : prefix + '/edit/' + dictType + '/' + dictNo
	});
}
// 删除
function remove(dictType, dictNo) {
	YiMo.remove({
		url : prefix + '/remove/' + dictType + '/' + dictNo
	});
}
// 批量删除
function batchRemove() {
	var rows = $('#DictDataTable').bootstrapTable('getSelections'); // 返回所有选择的行，当没有选择的记录时，返回一个空数组
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
			ids[i] = row['dictNo'];
		});
		layer.close(index);
		YiMo.ajaxDelete({
		    data : {
		        "dictType" : dictType,
		        "ids" : ids
		    },
		    url : prefix + '/batchRemove',
		    refresh : true,
		});
	}, function() {
	});
}