var prefix = ctx + "sys/role";
function load() {
	var options = {
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
	        title : '状态',
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
// 新增
function add() {
	YiMo.add({
	    url : prefix + '/add' // iframe的url
	});
}
// 编辑
function edit(id) {
	YiMo.edit({
	    url : prefix + '/edit/' + id // iframe的url
	});
}
//删除
function remove(id) {
	YiMo.remove({
	    url : prefix + "/remove/"+id,
	});
}
//批量删除
function batchRemove() {
	YiMo.batchRemove({
	    primaryKey : 'roleId',
	    url : prefix + "/batchRemove",
	});
}

function exportData() {
	YiMo.exportData({
		url : prefix + "/exportData",
	});
}
function importData() {
	YiMo.importData({
	    url : prefix + "/importData",
	    modalName : "角色",
	});
}
function importTemplate() {
	YiMo.importTemplate({
		url : prefix + "/importTemplate",
	});
}