$('.toggle').toggles({
    on : true,
    text : {
        on : '开启',
        off : '关闭'
    }
});

var textarea = $('#text'), toolbar = $('<div class="markdown-editor" id="md-button-bar" />').insertBefore(textarea.parent())
preview = $('<div id="md-preview" class="md-hidetab" />').insertAfter('.markdown-editor');

markdown(textarea, toolbar, preview);

function allow_comment(obj) {
	var this_ = $(obj);
	var on = this_.find('.toggle-on.active').length;
	var off = this_.find('.toggle-off.active').length;
	if (on == 1) {
		$('#allow_comment').val(0);
	}
	if (off == 1) {
		$('#allow_comment').val(1);
	}
}

function allow_feed(obj) {
	var this_ = $(obj);
	var on = this_.find('.toggle-on.active').length;
	var off = this_.find('.toggle-off.active').length;
	if (on == 1) {
		$('#allow_feed').val(0);
	}
	if (off == 1) {
		$('#allow_feed').val(1);
	}
}

$('div.allow-false').toggles({
    off : true,
    text : {
        on : '开启',
        off : '关闭'
    }
});