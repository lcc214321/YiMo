var prefix = ctx + "sys/user"

function load() {
	var options = {
		url : prefix + "/list",
		pageSize : 5,
		queryParams : function(params) { // 传递参数（*）
			return {
				limit : params.limit,
				offset : params.offset,
				sort : params.sort,
				order : params.order,
				deptId : $('#deptId').val()
			// 增加自定义参数部门id
			};
		},
		columns : [
				{
					checkbox : true
				},
				{
					field : 'userName',
					title : '用户名',
					halign : 'center',
					sortable : true,
					clickToSelect : true
				},
				{
					field : 'name',
					title : '昵称',
					halign : 'center',
					sortable : true
				},
				{
					field : 'deptName',
					halign : 'center',
					title : '部门'
				},
				{
					field : 'mobile',
					halign : 'center',
					title : '手机号',

				},
				{
					field : 'birth',
					halign : 'center',
					title : '生日',
					visible : false,
				},
				{
					field : 'status',
					title : '状态',
					halign : 'center',
					formatter : function(value, row, index) {
						var dictData = $.YiMo.getDictData('Status', value);
						return '<span class="label ' + dictData.dictDescribe + '">' + dictData.dictName + '</span>';
					}
				},
				{
					title : '操作',
					field : 'id',
					width : '128px',
					halign : 'center',
					formatter : function(value, row, index) {
						var e = '<a class="btn btn-primary btn-sm ' + s_edit_h + '" href="#" mce_href="#" title="编辑" onclick="edit(\'' + row.userId
								+ '\')"><i class="fa fa-edit"></i></a> ';
						var d = '<a class="btn btn-warning btn-sm ' + s_remove_h + '" href="#" title="删除"  mce_href="#" onclick="remove(\'' + row.userId
								+ '\')"><i class="fa fa-remove"></i></a> ';
						var f = '<a class="btn btn-success btn-sm ' + s_resetPwd_h + '" href="#" title="重置密码"  mce_href="#" onclick="resetPwd(\'' + row.userId
								+ '\')"><i class="fa fa-key"></i></a> ';
						return e + d + f;
					}
				} ]
	}
	YiMo.BSTable.load(options);
}

function exportData() {
	YiMo.exportData({
		url : prefix + "/exportData",
	});
}
function importData() {
	YiMo.importData({
		url : prefix + "/importData",
		modalName : "用户",
	});
}
function importTemplate() {
	YiMo.importTemplate({
		url : prefix + "/importTemplate",
	});
}

function add() {
	YiMo.add({
		url : prefix + "/add",
	});
}
function edit(id) {
	YiMo.edit({
		url : prefix + "/edit/" + id,
	});
}

function resetPwd(id) {
	YiMo.ajaxPut({
		url : prefix + "/resetPwd/" + id,
		refresh : true,
	});
}
function remove(id) {
	YiMo.remove({
		url : prefix + "/remove/" + id,
	});
}

function batchRemove() {
	YiMo.batchRemove({
		primaryKey : 'userId',
		url : prefix + "/batchRemove",
	});
}

function getTreeData() {
	$.ajax({
		type : "GET",
		url : ctx + "sys/dept/tree",
		success : function(tree) {
			loadTree(tree);
		}
	});
}
function loadTree(tree) {
	$('#jstree').jstree({
		'core' : {
			'data' : tree
		},
		"plugins" : [ "search" ]
	});
	$('#jstree').jstree().open_all();
}
$('#jstree').on("changed.jstree", function(e, data) {
	$('#deptId').val(data.node.id);
	YiMo.BSTable.search();
});
