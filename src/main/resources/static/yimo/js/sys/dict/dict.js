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
	        halign : 'center',
	        width : '68px',
	        formatter : function(value, row, index) {
		        var dictData = $.YiMo.getDictData('Status', value);
		        return '<span class="label ' + dictData.dictDescribe + '">' + dictData.dictName + '</span>';
	        }
	    }, {
	        title : '操作',
	        field : 'id',
	        halign : 'center',
	        width : '128px',
	        formatter : function(value, row, index) {
		        var e = '<a class="btn btn-primary btn-sm ' + s_edit_h + '" href="#" mce_href="#" title="编辑" onclick="edit(\'' + row.dictType + '\')"><i class="fa fa-edit"></i></a> ';
		        var d = '<a class="btn btn-warning btn-sm ' + s_remove_h + '" href="#" title="删除"  mce_href="#" onclick="remove(\'' + row.dictType + '\')"><i class="fa fa-remove"></i></a> ';
		        return e + d;
	        }
	    } ]
	};
	YiMo.BSTable.load(options);
}

// 编辑对应字典数据
function detail(dictType) {
	openPage(prefix + 'Data/' + dictType, '数据字典【' + dictType + '】编辑');
}

// 新增
function add() {
	YiMo.add({
		url : prefix + '/add'
	});
}
// 编辑
function edit(id) {
	YiMo.edit({
		url : prefix + '/edit/' + id
	});
}
// 删除
function remove(id) {
	YiMo.remove({
		url : prefix + "/remove/" + id,
	});
}
