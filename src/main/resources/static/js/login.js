$(document).ready(function() {
		$("#login").on('click', function() {
			$("#loginForm").submit();
		});
		validateRule();
		$("body").keydown(keyDownLogon);
	});

	$.validator.setDefaults({
		submitHandler : function() {
			login();
		}
	});

	function login() {
		$.ajax({
		    type : "POST",
		    url : ctx + "login",
		    data : $('#loginForm').serialize(),
		    success : function(r) {
			    if (r.code == 0) {
			    	 var index = layer.load(1, {
				            shade : [ 0.1, '#fff' ]
			            //0.1透明度的白色背景
			            });
			            parent.location.href = ctx + 'index';
			    } else {
				    layer.msg(r.msg);
			    }
		    },
		});
	}

	function keyDownLogon() {
		if (event.keyCode == "13") {
			$("#login").trigger('click');
		}
	}

	function validateRule() {
		var icon = "<i class='fa fa-times-circle'></i> ";
		$("#loginForm").validate({
		    rules : {
		        username : {
			        required : true
		        },
		        password : {
			        required : true
		        }
		    },
		    messages : {
		        username : {
			        required : icon + "请输入您的用户名",
		        },
		        password : {
			        required : icon + "请输入您的密码",
		        }
		    }
		})
	}