var prefix = ctx + "sys/dept"
function load() {
	$.YiMo.BSTreeTable.load({
	    code : 'deptId',
	    url : prefix + "/list", // 服务器数据的加载地址
	    ajaxParams : {
		    sort : 'order_no'
	    }, // 请求数据的ajax的data属性
	    expandColumn : '2',// 在哪一列上面显示展开按钮
        expandFirst :  true, // 是否默认第一级展开--expandAll为false时生效
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
//新增
function add(id) {
	YiMo.add({
	    url : prefix + '/add/'+id, 
	});
}
// 编辑
function edit(id) {
	YiMo.edit({
	    url : prefix + '/edit/' + id 
	});
}
//删除
function remove(id) {
	YiMo.remove({
	    url : prefix + "/remove/"+id,
	});
}
