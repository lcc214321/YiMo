var prefix = ctx + "sys/menu"
var load = function() {
	options = {
	    code : 'menuId',
	    url : prefix + '/list', // 请求数据的ajax的url
	    ajaxParams : {
		    sort : 'order_no'
	    }, // 请求数据的ajax的data属性
	    columns : [ {
	        title : '编号',
	        field : 'menuId',
	        visible : false,
	        align : 'left',
	        valign : 'center',
	        width : '5%'
	    }, {
	        title : '名称',
	        align : 'left',
	        field : 'name',
	        width : '20%'
	    }, {
	        title : '图标',
	        field : 'icon',
	        align : 'left',
	        valign : 'center',
	        width : '5%',
	        formatter : function(value, item, index) {
		        return item.icon == null ? '' : '<i class="' + item.icon + ' fa-lg"></i>';
	        }
	    }, {
	        title : '类型',
	        field : 'type',
	        align : 'left',
	        valign : 'center',
	        width : '10%',
	        formatter : function(value, item, index) {
	        	var dictData = $.YiMo.getDictData('MenuType', value);
		        return '<span class="label ' + dictData.dictDescribe + '">' + dictData.dictName + '</span>';
	        }
	    }, {
	        title : '地址',
	        valign : 'center',
	        width : '10%',
	        field : 'url'
	    }, {
	        title : '权限标识',
	        valign : 'center',
	        width : '15%',
	        field : 'perms'
	    }, {
	        title : '排序号',
	        valign : 'center',
	        width : '10%',
	        field : 'orderNo'
	    },{
	        field : 'status',
	        title : '状态',
	        align : 'left',
	        formatter : function(value, row, index) {
	        	var dictData = $.YiMo.getDictData('Status', value);
		        return '<span class="label ' + dictData.dictDescribe + '">' + dictData.dictName + '</span>';
	        }
	    }, {
	        title : '操作',
	        field : 'id',
	        align : 'center',
	        valign : 'center',
	        formatter : function(value, item, index) {
		        var e = '<a class="btn btn-primary btn-sm ' + s_edit_h + '" href="#" mce_href="#" title="编辑" onclick="edit(\'' + item.menuId + '\')"><i class="fa fa-edit"></i></a> ';
		        var p = '<a class="btn btn-success btn-sm ' + s_edit_h + '" href="#" mce_href="#" title="添加下级" onclick="add(\'' + item.menuId + '\')"><i class="fa fa-plus-circle"></i></a> ';
		        var d = '<a class="btn btn-warning btn-sm ' + s_remove_h + '" href="#" title="删除"  mce_href="#" onclick="remove(\'' + item.menuId + '\')"><i class="fa fa-remove"></i></a> ';
		        return e + d + p;
	        }
	    } ]
	};
	$.YiMo.BSTreeTable.load(options);
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
