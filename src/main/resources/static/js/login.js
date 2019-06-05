$(document).ready(function() {
	$("body").keydown(keyDownLogon);
});

function login() {
	$.ajax({
	    type : "POST",
	    url : ctx + "login",
	    data : $('#loginForm').serialize(),
	    success : function(data) {
		    if (data.success == true) {
			    parent.location.href = ctx + 'index';
		    } else {
			    layer.msg(data.msg);
		    }
	    },
	});
}

function keyDownLogon() {
	if (event.keyCode == "13") {
		$("#login").trigger('click');
	}
}
