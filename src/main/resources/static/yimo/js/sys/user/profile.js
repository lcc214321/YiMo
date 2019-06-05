var prefix = ctx + "/sys/user";
$(document).ready(function() {
	validateRule();
	
	// 更改省份后的操作
	$("select[name='province']").change(function() {
		var provCode = $("select[name='province']").val();
		getCity(provCode);

	});

	// 更改城市后的操作
	$("select[name='city']").change(function() {
		var cityCode = $("select[name='city']").val();
		getArea(cityCode);
	});

	$('#hobby').html(YiMo.getDictDatas('hobby', '[[${user.hobby}]]'));

});

/*用户管理-基本信息*/
function updateUserInfo() {
	$("#hobby").val(getCheckedHobbys());
	YiMo.ajaxPut({
		url : ctx + "sys/user/update",
		data : $('#form-user-edit').serialize(),
		needClose : true,
		refreshTab : true,
	});
}
/*用户管理-密码*/
function updatePassword() {
	YiMo.ajaxPut({
		url : prefix + "/updatePwd",
		data : $('#form-user-resetPwd').serialize(),
		needClose : true,
		refreshTab : true,
	});
}
function getCheckedHobbys() {
	var ids = "";
	$("input:checkbox[name=hobby]:checked").each(function(i) {
		if (0 == i) {
			ids = $(this).val();
		} else {
			ids += ("," + $(this).val());
		}
	});
	return ids;
}

/*表单校验*/
function validateRule() {
	$("#form-user-edit").validate({
		onkeyup : false,
		rules : {
			userName : {
				required : true,
			},
			email : {
				required : true,
				email : true,
				remote : {
					url : prefix + "/checkEmailUnique",
					type : "post",
					dataType : "json",
					data : {
						"email" : function() {
							return $("#email").val();
						},
						"userId" : function() {
							return $("#userId").val();
						},
					},
					dataFilter : function(data, type) {
						if (data == "true")
							return true;
						else
							return false;
					}
				}
			},
			mobile : {
				required : true,
				minlength : 11,
				maxlength : 11,
				remote : {
					url : prefix + "/checkMobileUnique",
					type : "post",
					dataType : "json",
					data : {
						"mobile" : function() {
							return $("#mobile").val();
						},
						"userId" : function() {
							return $("#userId").val();
						},
					},
					dataFilter : function(data, type) {
						if (data == "true")
							return true;
						else
							return false;
					}
				}
			},
		},
		messages : {
			"userName" : {
				required : "请输入用户名称",
			},
			"email" : {
				required : "请输入邮箱",
				remote : "Email已经存在"
			},
			"mobile" : {
				required : "请输入手机号码",
				remote : "手机号码已经存在",
			}
		},
		focusCleanup : true
	});
	$("#form-user-resetPwd").validate({
		onkeyup : false,
		rules : {
			oldPassword : {
				required : true,
			},
			newPassword : {
				required : true,
				minlength : 6,
				maxlength : 20
			},
			confirmPassword : {
				required : true,
				equalTo : "#newPassword"
			}
		},
		messages : {
			oldPassword : {
				required : "请输入原密码",
				remote : "原密码错误"
			},
			newPassword : {
				required : "请输入新密码",
				minlength : "密码不能小于6个字符",
				maxlength : "密码不能大于20个字符"
			},
			confirmPassword : {
				required : "请再次输入新密码",
				equalTo : "两次密码输入不一致"
			}

		},
		focusCleanup : true
	});
}

/**头像更换**/
var initCropperInModal = function(img, input, modal) {
	var $image = img;
	var $inputImage = input;
	var $modal = modal;
	var options = {
		aspectRatio : 1, // 纵横比
		viewMode : 2,
		preview : '.img-preview' // 预览图的class名
	};
	// 模态框隐藏后需要保存的数据对象
	var saveData = {};
	var URL = window.URL || window.webkitURL;
	var blobURL;
	$modal.on('show.bs.modal', function() {
		// 				如果打开模态框时没有选择文件就点击“打开图片”按钮
		if (!$inputImage.val()) {
			$inputImage.click();
		}
	}).on('shown.bs.modal', function() {
		// 重新创建
		$image.cropper($.extend(options, {
			ready : function() {
				// 当剪切界面就绪后，恢复数据
				if (saveData.canvasData) {
					$image.cropper('setCanvasData', saveData.canvasData);
					$image.cropper('setCropBoxData', saveData.cropBoxData);
				}
			}
		}));
	}).on('hidden.bs.modal', function() {
		// 保存相关数据
		saveData.cropBoxData = $image.cropper('getCropBoxData');
		saveData.canvasData = $image.cropper('getCanvasData');
		// 销毁并将图片保存在img标签
		$image.cropper('destroy').attr('src', blobURL);
	});
	if (URL) {
		$inputImage.change(function() {
			var files = this.files;
			var file;
			if (!$image.data('cropper')) {
				return;
			}
			if (files && files.length) {
				file = files[0];
				if (/^image\/\w+$/.test(file.type)) {
					if (blobURL) {
						URL.revokeObjectURL(blobURL);
					}
					blobURL = URL.createObjectURL(file);
					// 重置cropper，将图像替换
					$image.cropper('reset').cropper('replace', blobURL);
					// 选择文件后，显示和隐藏相关内容
					$('.img-container').removeClass('hidden');
					$('.img-preview-box').removeClass('hidden');
					$('#avatar .disabled').removeAttr('disabled').removeClass('disabled');
					$('#avatar .tip-info').addClass('hidden');
				} else {
					window.alert('请选择一个图像文件！');
				}
			}
		});
	} else {
		$inputImage.prop('disabled', true).addClass('disabled');
	}
}

var sendPhoto = function() {
	// 			$('#photo').cropper('getCroppedCanvas', {
	// 				width : 300,
	// 				height : 300
	// 			}).toBlob(function(blob) {
	// 				// 转化为blob后更改src属性，隐藏模态框
	// 				$('#user-photo').attr('src', URL.createObjectURL(blob));
	// 				$('#avatar').modal('hide');
	// 			});
	// 得到PNG格式的dataURL
	var photo = $('#photo').cropper('getCroppedCanvas', {
		width : 300,
		height : 300
	}).toDataURL('image/png');

	$("#imgData").val(photo);
	
	$.ajax({
		url : prefix + '/uploadImg', // 要上传的地址
		type : 'post',
		data : $("#imgForm").serializeArray(),
		dataType : 'json',
		success : function(data) {
			if (data.success == true) {
				// 将上传的头像的地址填入，为保证不载入缓存加个随机数
// 						$('#user-avatar').attr('src', '头像地址?t=' + Math.random());
				$('#avatar').modal('hide');
				alert(data.msg);
			} else {
				alert(data);
			}
		}
	});
}

$(function() {
	initCropperInModal($('#photo'), $('#photoInput'), $('#avatar'));
});

//获取对应城市列表（里面包括获取第一个城市的区县列表）
function getCity(provCode) {

	var firstCityCode;

	// ajax请求所有市级单位
	$.ajax({
        type : 'GET',
        url : ctx + 'sys/dictData/getNextCitys',
        data : {
            'dictType' : 'AreaCode',
            'dictNo' : provCode,
            'dictDescribe' : 'city'
        },
        async : false,
        dataType : 'json',
        success : function(data) {

			// 先清空城市下拉框
			$("select[name='city']").empty();
	
			$.each(data, function(i, d) {
				$("select[name='city']").append(
						"<option value='"+d.dictNo+"'>" + d.dictName
								+ "</option>");
			});
	        // 获取第一个城市的code
	        firstCityCode = data[0].dictNo;
	        // 根据第一个城市code获取对应区县列表
	        getArea(firstCityCode);
        
        },
    });
		
}

function getArea(cityCode) {

	// ajax请求所有区县单位
	$.ajax({
        type : 'GET',
        url : ctx + 'sys/dictData/getNextCitys',
        data : {
        	'dictType' : 'AreaCode',
            'dictNo' : cityCode,
            'dictDescribe' : 'area'
        },
        async : false,
        dataType : 'json',
        success : function(data) {

			// 先清空城市下拉框
			$("select[name='district']").empty();
	
			$.each(data, function(i, d) {
				$("select[name='district']").append(
						"<option value='"+d.dictNo+"'>" + d.dictName
								+ "</option>");
			});
        },
    });
}




