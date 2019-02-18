$.extend({
	yimo : function() {
	}
});
var yimo = new $.yimo();
$.yimo.prototype.ajax = function(options) {
	$.ajax({
		type : options.type,
		url : options.url,
		data : options.data || {},
		async : options.async || false,
		dataType : 'json',
		error : function() {
			parent.layer.alert("处理失败");
		},
		success : function(data) {
			if (data.success == true) {
				parent.layer.msg(data.msg, {
					time : 2000
				// 2s后自动关闭
				});
				parent.refresh();
				var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
				parent.layer.close(index);
			} else {
				options.success && options.success(data);
			}
		}
	});
};

$.yimo.prototype.ajaxPost = function(options) {
	options.type = "POST";
	yimo.ajax(options);
}

$.yimo.prototype.ajaxDelete = function(options) {
	options.type = "DELETE";
	yimo.ajax(options);
}
$.yimo.prototype.ajaxGet = function(options) {
	options.type = "GET";
	yimo.ajax(options);
}
$.yimo.prototype.ajaxPut = function(options) {
	options.type = "PUT";
	yimo.ajax(options);
}