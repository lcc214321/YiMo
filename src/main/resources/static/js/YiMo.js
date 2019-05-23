/**
 * js方法封装处理 Copyright (c) 2019 YiMo
 */
(function($) {
	$.extend({
	    /* 框架常用功能简单封装 */
	    YiMo : {
	        /* 简单封装ajax请求 */
	        ajax : function(options) {
		        $.ajax({
		            type : options.type,
		            url : options.url,
		            data : options.data || {},
		            async : options.async || false,
		            dataType : 'json',
		            success : function(data) {
			            console.log("操作成功返回:" + data);
			            if (data.success == true) {
				            parent.toastr.success(data.msg);
				            options.success && options.success(data);
				            if (options.parentRefresh == true) {
					            if (parent.$("#bootstrap-tree-table").length > 0) {
						            parent.$.YiMo.BSTreeTable.refresh();
					            } else {
						            parent.$.YiMo.BSTable.refresh();
					            }
				            }
				            if (options.refresh == true) {
					            if ($("#bootstrap-tree-table").length > 0) {
						            $.YiMo.BSTreeTable.refresh();
					            } else {
						            $.YiMo.BSTable.refresh();
					            }
				            }
				            if (options.needClose == true) {
					            var index = parent.layer.getFrameIndex(window.name);
					            parent.layer.close(index);
				            }
			            } else if (data.code == 666) {
				            window.location.reload(true);
			            } else {
				            parent.toastr.error(data.msg);
			            }
		            },
		        });
	        },

	        ajaxPost : function(options) {
		        options.type = "POST";
		        this.ajax(options);
	        },
	        ajaxDelete : function(options) {
		        options.type = "DELETE";
		        this.ajax(options);
	        },
	        ajaxGet : function(options) {
		        options.type = "GET";
		        this.ajax(options);
	        },
	        ajaxPut : function(options) {
		        options.type = "PUT";
		        this.ajax(options);
	        },
	        /* 获取数据字典名称 */
	        getDictData : function(type, no) {
		        var dictData;
		        $.ajax({
		            type : 'GET',
		            url : ctx + 'sys/dictData/getDictData',
		            data : {
		                'dictType' : type,
		                'dictNo' : no
		            },
		            async : false,
		            dataType : 'json',
		            success : function(data) {
			            dictData = data;
		            },
		        });
		        return dictData;
	        },
	        /** 简单封装bootstrap-table * */
	        BSTable : {
	            load : function(options) {
		            $('#bootstrap-table').bootstrapTable({
		                method : options.method || 'get',// 服务器数据的请求方式
		                url : options.url,// 服务器数据的加载地址
		                showRefresh : options.showRefresh || true,// 是否显示刷新按钮
		                cache : false,// 是否使用缓存
		                showToggle : options.showToggle || true, // 是否显示详细视图和列表视图的切换按钮
		                showFooter : options.showFooter || false,// 是否显示表尾
		                search : options.search || false,// 是否显示搜索框
		                showSearch : options.showSearch || true,// 是否显示搜索按钮
		                showColumns : options.showColumns || true,// 是否显示内容下拉框（选择显示的列）
		                iconSize : options.iconSize || 'outline',// 图标大小：undefined默认的按钮尺寸
		                // xs超小按钮sm小按钮lg大按钮
		                toolbar : options.toolbar || '#toolbar', // 指定工作栏
		                striped :  options.striped ||true,// 设置为true会有隔行变色效果
		                sortable : options.sortable || true, // 是否启用排序
		                sortStable : true,
		                sortOrder : options.sortOrder || 'desc', // 排序方式
		                dataType : options.dataType || "json",// 服务器返回的数据类型
		                pagination : options.pagination || true,// 设置为true会在底部显示分页条
		                queryParamsType : options.queryParamsType || "limit",// 设置为limit则会发送符合RESTFull格式的参数
		                singleSelect : options.singleSelect || false,// 设置为true将禁止多选
		                contentType : options.contentType || "application/x-www-form-urlencoded",// 发送到服务器的数据编码类型
		                pagination : options.pagination || true, // 是否显示分页（*）
		                pageSize : options.pageSize || 10,// 如果设置了分页，每页数据条数
		                pageNumber : options.pageNumber || 1,// 如果设置了分布，首页页码
		                pageList : options.pageList || [ 10, 25, 50, 75, 100 ], // 可供选择的每页的行数（*）
		                sidePagination : options.sidePagination || "server",// 设置在哪里进行分页，可选值为"client"或者"server"
		                columns : options.columns,// 显示列信息（*）
		                queryParams : options.queryParams || this.queryParams,
		            });
	            },
	            queryParams : function(params) { // 传递参数（*）
		            return {
		                // 说明：传入后台的参数包括offset开始索引，limit步长，sort排序列，order：desc或者,以及所有列的键值对
		                // 这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
		                limit : params.limit,
		                offset : params.offset,
		                sort : params.sort,
		                order : params.order
		            };
	            },

	            // 刷新表格 静默方式
	            refresh : function() {
		            $("#bootstrap-table").bootstrapTable('refresh', {
			            silent : true
		            });
	            },
	            // 自定义搜索方法，默认获取search-form的所有字段作为查询参数
	            search : function(formId) {
		            var searchFormId = formId || 'search-form';
		            var search = {};
		            $.each($("#" + searchFormId).serializeArray(), function(i, field) {
			            search[field.name] = field.value;
		            });
		            $("#bootstrap-table").bootstrapTable('refresh', {
			            query : search
		            });
	            },
	            searchShow : function() {
		            $("#search-form").parents(".ibox").show();
	            },
	            searchHide : function() {
		            $("#search-form").parents(".ibox").hide();
	            },

	        },
	        /** 简单封装bootstrap-treetable* */
	        _treeTable : {},
	        BSTreeTable : {
	            _option : {},
	            // 加载表格
	            load : function(options) {
		            $.YiMo.BSTreeTable._option = options;
		            var treeTable = $('#bootstrap-tree-table').bootstrapTreeTable({
		                code : options.code, // 用于设置父子关系
		                parentCode : options.parentCode || 'parentId', // 用于设置父子关系
		                type : 'get', // 请求方式（*）
		                url : options.url, // 请求后台的URL（*）
		                ajaxParams : options.ajaxParams || {}, // 请求数据的ajax的data属性
		                expandColumn : options.expandColumn || '1', // 在哪一列上面显示展开按钮
		                striped : options.striped || false, // 是否显示行间隔色
		                bordered : true, // 是否显示边框
		                toolbar : '#toolbar', // 指定工作栏
		                showRefresh : options.showRefresh || true, // 是否显示刷新按钮
		                showColumns : options.showColumns || false, // 是否显示隐藏某列下拉框
		                expandAll : options.expandAll || false, // 是否全部展开
		                expandFirst : options.expandFirst || false, // 是否默认第一级展开--expandAll为false时生效
		                columns : options.columns
		            });
		            $.YiMo._treeTable = treeTable;
	            },
	            // 条件查询
	            search : function(formId) {
		            var searchFormId = formId || 'search-form';
		            var search = {};
		            $.each($("#" + searchFormId).serializeArray(), function(i, field) {
			            search[field.name] = field.value;
		            });
		            $._treeTable.bootstrapTreeTable('refresh', search);
	            },
	            // 刷新
	            refresh : function() {
		            $('#bootstrap-tree-table').bootstrapTreeTable('refresh');
	            },
	        },
	        // 新增
	        add : function(option) {
		        layer.open({
		            type : 2,
		            title : '增加',
		            maxmin : true,
		            shadeClose : false, // 点击遮罩关闭层
		            area : [ '800px', '520px' ],
		            content : option.url,// iframe的url
		        });
	        },
	        // 编辑
	        edit : function(option) {
		        layer.open({
		            type : 2,
		            title : '编辑',
		            maxmin : true,
		            shadeClose : false, // 点击遮罩关闭层
		            area : [ '800px', '520px' ],
		            content : option.url, // iframe的url
		        });
	        },
	        // 删除
	        remove : function(option, primaryKey) {
		        layer.confirm('确定要删除选中的记录？', {
			        btn : [ '确定', '取消' ]
		        }, function(index) {
			        layer.close(index);
			        $.YiMo.ajaxDelete({
			            url : option.url,
			            refresh : true,
			        });
		        })
	        },

	        // 批量删除
	        batchRemove : function(option) {
		        var rows = $('#bootstrap-table').bootstrapTable('getSelections'); // 返回所有选择的行，当没有选择的记录时，返回一个空数组
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
				        ids[i] = row[option.primaryKey];
			        });
			        YiMo.ajaxDelete({
			            data : {
				            "ids" : ids,
			            },
			            url : option.url,
			            refresh : true,
			        });
		        });
	        },
	        // 导出数据
	        exportData : function(option) {
		        var exportFormId = option.formId || 'export-form';
		        var ii = layer.load("正在导出数据，请稍后...");
		        $.post(option.url, $("#" + exportFormId).serializeArray(), function(data) {
			        if (data.success == true) {
				        window.location.href = ctx + "common/download?fileName=" + data.msg + "&delete=" + true;
			        } else {
				        layer.msg(data.msg);
			        }
			        layer.close(ii);
		        });
		        setTimeout(function() {
			        layer.close(ii)
		        }, 1000);
	        },
	        // 下载模板
	        importTemplate : function(option) {
		        $.get(option.url, function(data) {
			        if (data.success == true) {
				        window.location.href = ctx + "common/download?fileName=" + data.msg + "&delete=" + true;
			        } else {
				        layer.msg(data.msg);
			        }
		        });
	        },
	        // 导入数据
	        importData : function(option) {
		        var contentId = option.formid || 'importForm';
		        $('#' + contentId)[0].reset();
		        layer.open({
		            type : 1,
		            area : [ '400px', '230px' ],
		            // fix: false,
		            // 不固定
		            maxmin : true,
		            // shade: 0.3,
		            title : '导入' + option.modalName + '数据',
		            content : $('#' + contentId),
		            btn : [ '<i class="fa fa-check"></i> 导入', '<i class="fa fa-remove"></i> 取消' ],
		            // 弹层外区域关闭
		            shadeClose : true,
		            btn1 : function(index, layero) {
			            var file = layero.find('#file').val();
			            if (file == '' || (!$.common.endWith(file, '.xls') && !$.common.endWith(file, '.xlsx'))) {
				            toastr.warning("请选择后缀为 “xls”或“xlsx”的文件。");
				            return false;
			            }
			            var index = layer.load(2, {
				            shade : false
			            });
			            var formData = new FormData();
			            formData.append("file", $('#file')[0].files[0]);
			            formData.append("isCover", $("input[name='isCover']").is(':checked'));
			            $.ajax({
			                url : option.url,
			                data : formData,
			                cache : false,
			                contentType : false,
			                processData : false,
			                type : 'POST',
			                success : function(data) {
				                layer.close(index);
				                if (data.success == true) {
					                parent.$.YiMo.BSTable.refresh();
					                toastr.success(data.msg);
				                } else {
					                toastr.error(data.msg);
				                }
			                }
			            });
		            }
		        });
	        },
	    },

	    /** 通用数据转化函数* */
	    DataConvert : {
		    toString : function(value, defaultValue) {
			    if (value == null || this.trim(value) == "") {
				    return defaultValue;
			    }
			    return value;
		    },
	    },
	    /** 常用的js工具函数* */
	    common : {
	        /**
			 * 一个值如果是null或者''返回-
			 * 
			 * @param value
			 *            需要处理的值
			 * @param length
			 *            需要截取的字符的长度的值,未指定的时候返回全部
			 * @returns {*} 处理过的值
			 */
	        replaceNull : function(value, length) {
		        // 判断截取的值是否为空
		        if (value == null || value == undefined || value == "" || value == 'undefined') {
			        return "-";
		        }
		        // 判断长度是否为空
		        if (length == null || length == '') {
			        return value;
		        }
		        return value.toString().substr(0, length);
	        },

	        /**
			 * 校验只要是数字（包含正负整数，0以及正负浮点数）就返回true
			 */
	        isNumber : function(val) {
		        var regPos = /^\d+(\.\d+)?$/; // 非负浮点数
		        var regNeg = /^(-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*)))$/; // 负浮点数
		        if (regPos.test(val) || regNeg.test(val)) {
			        return true;
		        } else {
			        return false;
		        }
	        },
	        /** 以字符串开始* */
	        startWith : function(value, start) {
		        var reg = new RegExp("^" + start);
		        return reg.test(value)
	        },
	        /** 以字符串结束* */
	        endWith : function(value, end) {
		        var reg = new RegExp(end + "$");
		        return reg.test(value)
	        }
	    }
	});
})(jQuery);
var YiMo = $.YiMo;
