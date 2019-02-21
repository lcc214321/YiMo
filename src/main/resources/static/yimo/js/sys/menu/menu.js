var prefix = ctx+"sys/menu"
$(function() {
	load();
});

var load = function () {
    $('#MenuTable')
        .bootstrapTreeTable(
            {
                id: 'menuId',
                code: 'menuId',
                parentCode: 'parentId',
                type: "GET", // 请求数据的ajax类型
                url: prefix + '/list', // 请求数据的ajax的url
                ajaxParams: {sort:'order_no'}, // 请求数据的ajax的data属性
                expandColumn: '1',// 在哪一列上面显示展开按钮
                striped: true, // 是否各行渐变色
                bordered: true, // 是否显示边框
                expandAll: false, // 是否全部展开
                // toolbar : '#exampleToolbar',
                columns: [
                    {
                        title: '编号',
                        field: 'menuId',
                        visible: false,
                        align: 'center',
                        valign: 'center',
                        width: '5%'
                    },
                    {
                        title: '名称',
                        valign: 'center',
                        field: 'name',
                        width: '20%'
                    },

                    {
                        title: '图标',
                        field: 'icon',
                        align: 'center',
                        valign: 'center',
                        width : '5%',
                        formatter: function (value,item, index) {
                            return item.icon == null ? ''
                                : '<i class="' + item.icon
                                + ' fa-lg"></i>';
                        }
                    },
                    {
                        title: '类型',
                        field: 'type',
                        align: 'center',
                        valign: 'center',
                        width : '10%',
                        formatter: function (value,item, index) {
                            if (item.type === 0) {
                                return '<span class="label label-primary">目录</span>';
                            }
                            if (item.type === 1) {
                                return '<span class="label label-success">菜单</span>';
                            }
                            if (item.type === 2) {
                                return '<span class="label label-warning">按钮</span>';
                            }
                        }
                    },
                    {
                        title: '地址',
                        valign: 'center',
                        width : '20%',
                        field: 'url'
                    },
                    {
                        title: '权限标识',
                        valign: 'center',
                        width : '20%',
                        field: 'perms'
                    },
                    {
                        title: '操作',
                        field: 'id',
                        align: 'center',
                        valign: 'center',
                        formatter: function (value,item, index) {
                            var e = '<a class="btn btn-primary btn-sm '
                                + s_edit_h
                                + '" href="#" mce_href="#" title="编辑" onclick="edit(\''
                                + item.menuId
                                + '\')"><i class="fa fa-edit"></i></a> ';
                            var p = '<a class="btn btn-primary btn-sm '
                                + s_add_h
                                + '" href="#" mce_href="#" title="添加下级" onclick="add(\''
                                + item.menuId
                                + '\')"><i class="fa fa-plus"></i></a> ';
                            var d = '<a class="btn btn-warning btn-sm '
                                + s_remove_h
                                + '" href="#" title="删除"  mce_href="#" onclick="remove(\''
                                + item.menuId
                                + '\')"><i class="fa fa-remove"></i></a> ';
                            return e + d + p;
                        }
                    }]
            });
}


//刷新
function refresh() {
	$('#MenuTable').bootstrapTable('refresh');
}
//新增
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
//编辑
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
	},  function() {
		yimo.ajaxDelete({
			url : prefix + "/remove",
			data : {
				'userId' : id
			},
		});
	})
}
//批量删除
function batchRemove() {
	var rows = $('#MenuTable').bootstrapTable('getSelections'); // 返回所有选择的行，当没有选择的记录时，返回一个空数组
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


function save() {
	yimo.ajaxPost({
		url : prefix + "/save",
		data : $('#MenuForm').serialize(),
	});
}

function update() {
	yimo.ajaxPut({
		url : prefix + "/update",
		data : $('#MenuForm').serialize(),// 你的formid

	});
}