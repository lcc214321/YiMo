var prefix = ctx + "sys/user"

function load() {
	var options = {
		tableId : 'userTable',
		url : prefix + "/list",
		queryParams : function(params) { // 传递参数（*）
			return {
				limit : params.limit,
				offset : params.offset,
				sort : params.sort,
				order : params.order,
				deptId : $('#deptId').val()  //增加自定义参数部门id
			};
		},
		columns : [
				{
					checkbox : true
				},
				{
					field : 'userName',
					title : '用户名',
					sortable : true
				},
				{
					field : 'name',
					title : '昵称',
					sortable : true
				},
				{
					field : 'mobile',
					title : '手机号'
				},
				{
					field : 'status',
					title : '状态',
					align : 'center',
					formatter : function(value, row, index) {
						var dictData = yimo.getDictData('Status', value);
						return '<span class="label ' + dictData.dictDescribe + '">' + dictData.dictName + '</span>';
					}
				},
				{
					title : '操作',
					field : 'id',
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
function remove(id) {
	layer.confirm('确定要删除选中的记录？', {
		btn : [ '确定', '取消' ]
	}, function(index) {
		layer.close(index);
		YiMo.ajaxDelete({
			url : prefix + "/remove",
			data : {
				'userId' : id
			},
			refresh : true,
		});
	})
}

function resetPwd(id) {
	YiMo.ajaxPut({
		url : prefix + "/resetPwd/" + id,
		refresh : true,
	});
}

function save() {
	YiMo.ajaxPost({
		url : prefix + "/save",
		data : $('#userForm').serialize(),
	});
}

function batchRemove() {
	var rows = $('#userTable').bootstrapTable('getSelections'); // 返回所有选择的行，当没有选择的记录时，返回一个空数组
	if (rows.length == 0) {
		layer.msg("请选择要删除的数据");
		return;
	}
	layer.confirm("确认要删除选中的'" + rows.length + "'条数据吗?", {
		btn : [ '确定', '取消' ]
	// 按钮
	}, function(index) {
		layer.close(index);
		var ids = new Array();
		// 遍历所有选择的行数据，取每条数据对应的ID
		$.each(rows, function(i, row) {
			ids[i] = row['userId'];
		});
		YiMo.ajaxDelete({
			type : 'POST',
			data : {
				"ids" : ids
			},
			url : prefix + '/batchRemove',
			refresh : true,
		});
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
	// "plugins" : [ "search" ]
	});
	$('#jstree').jstree().open_all();
}
$('#jstree').on("changed.jstree", function(e, data) {
	$('#deptId').val(data.node.id);
	YiMo.BSTable.search();
});
