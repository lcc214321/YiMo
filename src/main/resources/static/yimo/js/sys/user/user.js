var prefix = ctx + "sys/user"
$().ready(function() {
	load();
	getTreeData();
	validateRule();
	
});
function load() {
	$('#userTable')
			.bootstrapTable(
					{
						method : 'get', // 服务器数据的请求方式 get or post
						url : prefix + "/list", // 服务器数据的加载地址
						// showRefresh : true,
						// showToggle : true,
						// showColumns : true,
						iconSize : 'outline',
						toolbar : '#exampleToolbar',
						striped : true, // 设置为true会有隔行变色效果
						dataType : "json", // 服务器返回的数据类型
						pagination : true, // 设置为true会在底部显示分页条
						queryParamsType : "limit",
						// //设置为limit则会发送符合RESTFull格式的参数
						singleSelect : false, // 设置为true将禁止多选
						// contentType : "application/x-www-form-urlencoded",
						// //发送到服务器的数据编码类型
//						pageSize : 5, // 如果设置了分页，每页数据条数
//						pageNumber : 1, // 如果设置了分布，首页页码
						search : false, // 是否显示搜索框
						showColumns : false, // 是否显示内容下拉框（选择显示的列）
						sidePagination : "server", // 设置在哪里进行分页，可选值为"client" 或者
						// "server"
						queryParams : function(params) {
							return {
								// 说明：传入后台的参数包括offset开始索引，limit步长，sort排序列，order：desc或者,以及所有列的键值对
								limit : params.limit,
								offset : params.offset
							// name:$('#searchName').val(),
							// username:$('#searchName').val()
							};
						},
						columns : [
								{
									checkbox : true
								},
								{
									field : 'userName',
									title : '用户名'
								},
								{
									field : 'name',
									title : '姓名'
								},
//								{
//									field : 'password',
//									title : '密码'
//								},
//								{
//									field : 'deptId',
//									title : '部门ID'
//								},
//								{
//									field : 'email',
//									title : '邮箱'
//								},
								{
									field : 'mobile',
									title : '手机号'
								},
								{
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
								},
								{
									title : '操作',
									field : 'id',
									align : 'center',
									formatter : function(value, row, index) {
										var e = '<a class="btn btn-primary btn-sm '
												+ s_edit_h
												+ '" href="#" mce_href="#" title="编辑" onclick="edit(\''
												+ row.userId
												+ '\')"><i class="fa fa-edit"></i></a> ';
										var d = '<a class="btn btn-warning btn-sm '
												+ s_remove_h
												+ '" href="#" title="删除"  mce_href="#" onclick="remove(\''
												+ row.userId
												+ '\')"><i class="fa fa-remove"></i></a> ';
										var f = '<a class="btn btn-success btn-sm" href="#" title="重置密码"  mce_href="#" onclick="resetPwd(\''
												+ row.userId
												+ '\')"><i class="fa fa-key"></i></a> ';
										return e + d + f;
									}
								} ]
					});
}
function refresh() {
	$('#userTable').bootstrapTable('refresh');
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
	}, function() {
		yimo.ajaxDelete({
			url : prefix + "/remove",
			data : {
				'userId' : id
			},
		});
	})
}

function resetPwd(id) {
	yimo.ajaxPut({
		url : prefix + "/resetPwd/"+id,
	});
}

function update() {
	yimo.ajaxPut({
		url : prefix + "/update",
		data : $('#editForm').serialize(),// 你的formid

	});
}

function save() {
	yimo.ajaxPost({
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
	}, function() {
		var ids = new Array();
		// 遍历所有选择的行数据，取每条数据对应的ID
		$.each(rows, function(i, row) {
			ids[i] = row['userId'];
		});
		yimo.ajaxDelete({
			type : 'POST',
			data : {
				"ids" : ids
			},
			url : prefix + '/batchRemove',
		});
	}, function() {
	});
}

function validateRule() {
	var icon = "<i class='fa fa-times-circle'></i> ";
	$("#reset_pwd_Form").validate({
		rules : {
			password : {
				required : true,
				minlength : 6
			}
		},
		messages : {
			password : {
				required : icon + "请输入您的密码",
				minlength : icon + "密码必须6个字符以上"
			}
		}
	})
}

function dept(){
	$("body").toggleClass("mini-navbar");
    SmoothlyMenu();
}

function getTreeData() {
	$.ajax({
		type : "GET",
		url : ctx+"sys/dept/tree",
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
	if (data.selected == -1) {
		var opt = {
			query : {
				deptId : '',
			}
		}
		$('#userTable').bootstrapTable('refresh', opt);
	} else {
		var opt = {
			query : {
				deptId : data.selected[0],
			}
		}
		$('#userTable').bootstrapTable('refresh',opt);
	}

});