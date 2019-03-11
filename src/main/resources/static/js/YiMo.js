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
//	    error : function() {
//		    parent.layer.alert("处理失败");
//	    },
	    success : function(data) {
		    if (data.success == true) {
			    parent.layer.msg(data.msg, {
				    time : 2000
			    // 2s后自动关闭
			    });
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
		    }else if(data.success == false && data.code==666){
		    	parent.layer.msg(data.msg, {
				    time : 2000
			    // 2s后自动关闭
			    });
		    	window.location.reload(true);
		    }
	    },
	    
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