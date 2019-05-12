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
						parent.toastr.success(data.msg);
						if (data.success == true) {
							options.success && options.success(data);
							if (options.parentRefresh == true) {
								parent.refresh();
							}
							if (options.refresh == true) {
								refresh();
							}
							if (options.needClose == true) {
								var index = parent.layer.getFrameIndex(window.name);
								parent.layer.close(index);
							}
						} else if (data.code == 666) {
							window.location.reload(true);
						}
					},
				});
			},

			ajaxPost : function(options) {
				options.type = "POST";
				yimo.ajax(options);
			},
			ajaxDelete : function(options) {
				options.type = "DELETE";
				yimo.ajax(options);
			},
			ajaxGet : function(options) {
				options.type = "GET";
				yimo.ajax(options);
			},
			ajaxPut : function(options) {
				options.type = "PUT";
				yimo.ajax(options);
			},
			/* 获取数据字典名称 */
			getDictData : function(type, no) {
				var dictData;
				$.ajax({
					type : 'GET',
					url : ctx + 'sys/dictData/getDictDataName',
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
			/* 封装bootstrap-table */
			BSTable : {
				load : function(options) {
					$('#bootstrap-table').bootstrapTable({
						method : options.method || 'get',// 服务器数据的请求方式
						url : options.url,// 服务器数据的加载地址
						showRefresh : options.showRefresh || true,// 是否显示刷新按钮
						cache : false,// 是否使用缓存
						showToggle : options.showToggle || true, // 是否显示详细视图和列表视图的切换按钮
						showExport : options.showExport || true, // 是否支持导出文件
						showFooter : options.showFooter || false,// 是否显示表尾
						search : options.search || false,// 是否显示搜索框
						showSearch : options.showSearch || true,// 是否显示检索信息
						showColumns : options.showColumns || true,// 是否显示内容下拉框（选择显示的列）

						iconSize : options.iconSize || 'outline',// 图标大小：undefined默认的按钮尺寸 xs超小按钮sm小按钮lg大按钮
						toolbar : options.toolbar || '#toolbar', // 指定工作栏
						striped : options.striped || true,// 设置为true会有隔行变色效果
						sortable : options.sortable || true, // 是否启用排序
						sortStable : true,
						sortOrder : options.sortOrder || 'desc', // 排序方式 asc
						// 或者 desc
						dataType : options.dataType || "json",// 服务器返回的数据类型
						pagination : options.pagination || true,// 设置为true会在底部显示分页条
						queryParamsType : options.queryParamsType || "limit",// 设置为limit则会发送符合RESTFull格式的参数
						singleSelect : options.singleSelect || false,// 设置为true将禁止多选
						contentType : options.contentType || "application/x-www-form-urlencoded",// 发送到服务器的数据编码类型
						pagination : options.pagination || true, // 是否显示分页（*）
						pageSize : options.pageSize || 5,// 如果设置了分页，每页数据条数
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
		},
		/** 通用数据转化函数* */
		DataConvert : {
			toString : function(value, defaultValue) {
				if (value == null || this.trim(value) == "") {
					return defaultValue;
				}
				return value;
			},
		}
	});
})(jQuery);
var YiMo = $.YiMo;
