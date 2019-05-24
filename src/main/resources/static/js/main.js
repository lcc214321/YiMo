//菜单
$(document).ready(function() {

	// MetsiMenu
	$('#side-menu').metisMenu();

	// 打开右侧边栏
	$('.right-sidebar-toggle').click(function() {
		$('#right-sidebar').toggleClass('sidebar-open');
	});

	// 右侧边栏使用slimscroll
	$('.sidebar-container').slimScroll({
	    height : '100%',
	    railOpacity : 0.4,
	    wheelStep : 10
	});

	// 打开聊天窗口
	$('.open-small-chat').click(function() {
		$(this).children().toggleClass('fa-comments').toggleClass('fa-remove');
		$('.small-chat-box').toggleClass('active');
	});

	// 聊天窗口使用slimscroll
	$('.small-chat-box .content').slimScroll({
	    height : '234px',
	    railOpacity : 0.4
	});

	// Small todo handler
	$('.check-link').click(function() {
		var button = $(this).find('i');
		var label = $(this).next('span');
		button.toggleClass('fa-check-square').toggleClass('fa-square-o');
		label.toggleClass('todo-completed');
		return false;
	});

	// 固定菜单栏
	$(function() {
		$('.sidebar-collapse').slimScroll({
		    height : '100%',
		    railOpacity : 0.9,
		    alwaysVisible : false
		});
	});

	// 菜单切换
	$('.navbar-minimalize').click(function() {
		$("body").toggleClass("mini-navbar");
		SmoothlyMenu();
	});

	// 侧边栏高度
	function fix_height() {
		var heightWithoutNavbar = $("body > #wrapper").height() - 61;
		$(".sidebard-panel").css("min-height", heightWithoutNavbar + "px");
	}
	fix_height();

	$(window).bind("load resize click scroll", function() {
		if (!$("body").hasClass('body-small')) {
			fix_height();
		}
	});

	// 侧边栏滚动
	$(window).scroll(function() {
		if ($(window).scrollTop() > 0 && !$('body').hasClass('fixed-nav')) {
			$('#right-sidebar').addClass('sidebar-top');
		} else {
			$('#right-sidebar').removeClass('sidebar-top');
		}
	});

	$('.full-height-scroll').slimScroll({
		height : '100%'
	});

	$('#side-menu>li').click(function() {
		if ($('body').hasClass('mini-navbar')) {
			NavToggle();
		}
	});
	$('#side-menu>li li a').click(function() {
		if ($(window).width() < 769) {
			NavToggle();
		}
	});

	$('.nav-close').click(NavToggle);

	// ios浏览器兼容性处理
	if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
		$('#content-main').css('overflow-y', 'auto');
	}
});

// 浏览器宽度适应
$(window).bind("load resize", function() {
	if ($(this).width() < 769) {
		$('body').addClass('mini-navbar');
		$('.navbar-static-side').fadeIn();
	}
});

/** iframe中打开一个新的tab* */
function openPage(url, title) {
	var nav = $(window.parent.document).find('.J_menuTabs .page-tabs-content ');
	$(window.parent.document).find('.J_menuTabs .page-tabs-content ').find(".J_menuTab.active").removeClass("active");
	$(window.parent.document).find('.J_mainContent').find("iframe").css("display", "none");
	var iframe = '<iframe class="J_iframe" name="iframe10000" width="100%" height="100%" src="' + url + '" frameborder="0" data-id="' + url + '" seamless="" style="display: inline;"></iframe>';
	$(window.parent.document).find('.J_menuTabs .page-tabs-content ').append(' <a href="javascript:;" class="J_menuTab active" data-id="' + url + '">' + title + ' <i class="fa fa-times-circle"></i></a>');
	$(window.parent.document).find('.J_mainContent').append(iframe);
}

function NavToggle() {
	$('.navbar-minimalize').trigger('click');
}

function SmoothlyMenu() {
	if (!$('body').hasClass('mini-navbar')) {
		$('#side-menu').hide();
		setTimeout(function() {
			$('#side-menu').fadeIn(500);
		}, 100);
	} else if ($('body').hasClass('fixed-sidebar')) {
		$('#side-menu').hide();
		setTimeout(function() {
			$('#side-menu').fadeIn(500);
		}, 300);
	} else {
		$('#side-menu').removeAttr('style');
	}
}

// 主题设置
$(function() {

	// 顶部菜单固定
	$('#fixednavbar').click(function() {
		if ($('#fixednavbar').is(':checked')) {
			$(".navbar-static-top").removeClass('navbar-static-top').addClass('navbar-fixed-top');
			$("body").removeClass('boxed-layout');
			$("body").addClass('fixed-nav');
			$('#boxedlayout').prop('checked', false);

			if (localStorageSupport) {
				localStorage.setItem("boxedlayout", 'off');
			}

			if (localStorageSupport) {
				localStorage.setItem("fixednavbar", 'on');
			}
		} else {
			$(".navbar-fixed-top").removeClass('navbar-fixed-top').addClass('navbar-static-top');
			$("body").removeClass('fixed-nav');

			if (localStorageSupport) {
				localStorage.setItem("fixednavbar", 'off');
			}
		}
	});

	// 收起左侧菜单
	$('#collapsemenu').click(function() {
		if ($('#collapsemenu').is(':checked')) {
			$("body").addClass('mini-navbar');
			SmoothlyMenu();

			if (localStorageSupport) {
				localStorage.setItem("collapse_menu", 'on');
			}

		} else {
			$("body").removeClass('mini-navbar');
			SmoothlyMenu();

			if (localStorageSupport) {
				localStorage.setItem("collapse_menu", 'off');
			}
		}
	});

	// 固定宽度
	$('#boxedlayout').click(function() {
		if ($('#boxedlayout').is(':checked')) {
			$("body").addClass('boxed-layout');
			$('#fixednavbar').prop('checked', false);
			$(".navbar-fixed-top").removeClass('navbar-fixed-top').addClass('navbar-static-top');
			$("body").removeClass('fixed-nav');
			if (localStorageSupport) {
				localStorage.setItem("fixednavbar", 'off');
			}

			if (localStorageSupport) {
				localStorage.setItem("boxedlayout", 'on');
			}
		} else {
			$("body").removeClass('boxed-layout');

			if (localStorageSupport) {
				localStorage.setItem("boxedlayout", 'off');
			}
		}
	});

	// 默认主题
	$('.s-skin-0').click(function() {
		$("body").removeClass("skin-1");
		$("body").removeClass("skin-2");
		$("body").removeClass("skin-3");
		return false;
	});

	// 蓝色主题
	$('.s-skin-1').click(function() {
		$("body").removeClass("skin-2");
		$("body").removeClass("skin-3");
		$("body").addClass("skin-1");
		return false;
	});

	// 黄色主题
	$('.s-skin-3').click(function() {
		$("body").removeClass("skin-1");
		$("body").removeClass("skin-2");
		$("body").addClass("skin-3");
		return false;
	});

	if (localStorageSupport) {
		var collapse = localStorage.getItem("collapse_menu");
		var fixednavbar = localStorage.getItem("fixednavbar");
		var boxedlayout = localStorage.getItem("boxedlayout");

		if (collapse == 'on') {
			$('#collapsemenu').prop('checked', 'checked')
		}
		if (fixednavbar == 'on') {
			$('#fixednavbar').prop('checked', 'checked')
		}
		if (boxedlayout == 'on') {
			$('#boxedlayout').prop('checked', 'checked')
		}
	}

	if (localStorageSupport) {

		var collapse = localStorage.getItem("collapse_menu");
		var fixednavbar = localStorage.getItem("fixednavbar");
		var boxedlayout = localStorage.getItem("boxedlayout");

		var body = $('body');

		if (collapse == 'on') {
			if (!body.hasClass('body-small')) {
				body.addClass('mini-navbar');
			}
		}

		if (fixednavbar == 'on') {
			$(".navbar-static-top").removeClass('navbar-static-top').addClass('navbar-fixed-top');
			body.addClass('fixed-nav');
		}

		if (boxedlayout == 'on') {
			body.addClass('boxed-layout');
		}
	}
});

// 判断浏览器是否支持html5本地存储
function localStorageSupport() {
	return (('localStorage' in window) && window['localStorage'] !== null)
}

// contabs页签控制
$(function() {
	// 计算元素集合的总宽度
	function calSumWidth(elements) {
		var width = 0;
		$(elements).each(function() {
			width += $(this).outerWidth(true);
		});
		return width;
	}
	// 滚动到指定选项卡
	function scrollToTab(element) {
		var marginLeftVal = calSumWidth($(element).prevAll()), marginRightVal = calSumWidth($(element).nextAll());
		// 可视区域非tab宽度
		var tabOuterWidth = calSumWidth($(".content-tabs").children().not(".J_menuTabs"));
		// 可视区域tab宽度
		var visibleWidth = $(".content-tabs").outerWidth(true) - tabOuterWidth;
		// 实际滚动宽度
		var scrollVal = 0;
		if ($(".page-tabs-content").outerWidth() < visibleWidth) {
			scrollVal = 0;
		} else if (marginRightVal <= (visibleWidth - $(element).outerWidth(true) - $(element).next().outerWidth(true))) {
			if ((visibleWidth - $(element).next().outerWidth(true)) > marginRightVal) {
				scrollVal = marginLeftVal;
				var tabElement = element;
				while ((scrollVal - $(tabElement).outerWidth()) > ($(".page-tabs-content").outerWidth() - visibleWidth)) {
					scrollVal -= $(tabElement).prev().outerWidth();
					tabElement = $(tabElement).prev();
				}
			}
		} else if (marginLeftVal > (visibleWidth - $(element).outerWidth(true) - $(element).prev().outerWidth(true))) {
			scrollVal = marginLeftVal - $(element).prev().outerWidth(true);
		}
		$('.page-tabs-content').animate({
			marginLeft : 0 - scrollVal + 'px'
		}, "fast");
	}
	// 查看左侧隐藏的选项卡
	function scrollTabLeft() {
		var marginLeftVal = Math.abs(parseInt($('.page-tabs-content').css('margin-left')));
		// 可视区域非tab宽度
		var tabOuterWidth = calSumWidth($(".content-tabs").children().not(".J_menuTabs"));
		// 可视区域tab宽度
		var visibleWidth = $(".content-tabs").outerWidth(true) - tabOuterWidth;
		// 实际滚动宽度
		var scrollVal = 0;
		if ($(".page-tabs-content").width() < visibleWidth) {
			return false;
		} else {
			var tabElement = $(".J_menuTab:first");
			var offsetVal = 0;
			while ((offsetVal + $(tabElement).outerWidth(true)) <= marginLeftVal) {// 找到离当前tab最近的元素
				offsetVal += $(tabElement).outerWidth(true);
				tabElement = $(tabElement).next();
			}
			offsetVal = 0;
			if (calSumWidth($(tabElement).prevAll()) > visibleWidth) {
				while ((offsetVal + $(tabElement).outerWidth(true)) < (visibleWidth) && tabElement.length > 0) {
					offsetVal += $(tabElement).outerWidth(true);
					tabElement = $(tabElement).prev();
				}
				scrollVal = calSumWidth($(tabElement).prevAll());
			}
		}
		$('.page-tabs-content').animate({
			marginLeft : 0 - scrollVal + 'px'
		}, "fast");
	}
	// 查看右侧隐藏的选项卡
	function scrollTabRight() {
		var marginLeftVal = Math.abs(parseInt($('.page-tabs-content').css('margin-left')));
		// 可视区域非tab宽度
		var tabOuterWidth = calSumWidth($(".content-tabs").children().not(".J_menuTabs"));
		// 可视区域tab宽度
		var visibleWidth = $(".content-tabs").outerWidth(true) - tabOuterWidth;
		// 实际滚动宽度
		var scrollVal = 0;
		if ($(".page-tabs-content").width() < visibleWidth) {
			return false;
		} else {
			var tabElement = $(".J_menuTab:first");
			var offsetVal = 0;
			while ((offsetVal + $(tabElement).outerWidth(true)) <= marginLeftVal) {// 找到离当前tab最近的元素
				offsetVal += $(tabElement).outerWidth(true);
				tabElement = $(tabElement).next();
			}
			offsetVal = 0;
			while ((offsetVal + $(tabElement).outerWidth(true)) < (visibleWidth) && tabElement.length > 0) {
				offsetVal += $(tabElement).outerWidth(true);
				tabElement = $(tabElement).next();
			}
			scrollVal = calSumWidth($(tabElement).prevAll());
			if (scrollVal > 0) {
				$('.page-tabs-content').animate({
					marginLeft : 0 - scrollVal + 'px'
				}, "fast");
			}
		}
	}

	// 通过遍历给菜单项加上data-index属性
	$(".J_menuItem").each(function(index) {
		if (!$(this).attr('data-index')) {
			$(this).attr('data-index', index);
		}
	});

	function menuItem() {
		// 获取标识数据
		var dataUrl = $(this).attr('href'), dataIndex = $(this).data('index'), menuName = $.trim($(this).text()), flag = true;
		if (dataUrl == undefined || $.trim(dataUrl).length == 0)
			return false;

		// 选项卡菜单已存在
		$('.J_menuTab').each(function() {
			if ($(this).data('id') == dataUrl) {
				if (!$(this).hasClass('active')) {
					$(this).addClass('active').siblings('.J_menuTab').removeClass('active');
					scrollToTab(this);
					// 显示tab对应的内容区
					$('.J_mainContent .J_iframe').each(function() {
						if ($(this).data('id') == dataUrl) {
							$(this).show().siblings('.J_iframe').hide();
							return false;
						}
					});
				}
				flag = false;
				return false;
			}
		});

		// 选项卡菜单不存在
		if (flag) {
			var str = '<a href="javascript:;" class="active J_menuTab" data-id="' + dataUrl + '">' + menuName + ' <i class="fa fa-times-circle"></i></a>';
			$('.J_menuTab').removeClass('active');

			// 添加选项卡对应的iframe
			var str1 = '<iframe class="J_iframe" name="iframe' + dataIndex + '" width="100%" height="100%" src="' + dataUrl + '" frameborder="0" data-id="' + dataUrl + '" seamless></iframe>';
			$('.J_mainContent').find('iframe.J_iframe').hide().parents('.J_mainContent').append(str1);

			// 显示loading提示
			var loading = layer.load(1, {
				shade : [ 0.1, '#fff' ]
			// 0.1透明度的白色背景
			});
			$('.J_mainContent iframe:visible').load(function() {
				// iframe加载完成后隐藏loading提示
				layer.close(loading);
			});
			// 添加选项卡
			$('.J_menuTabs .page-tabs-content').append(str);
			scrollToTab($('.J_menuTab.active'));
		}
		return false;
	}

	$('.J_menuItem').on('click', menuItem);

	// 关闭选项卡菜单
	function closeTab() {
		var closeTabId = $(this).parents('.J_menuTab').data('id');
		var currentWidth = $(this).parents('.J_menuTab').width();

		// 当前元素处于活动状态
		if ($(this).parents('.J_menuTab').hasClass('active')) {

			// 当前元素后面有同辈元素，使后面的一个元素处于活动状态
			if ($(this).parents('.J_menuTab').next('.J_menuTab').size()) {

				var activeId = $(this).parents('.J_menuTab').next('.J_menuTab:eq(0)').data('id');
				$(this).parents('.J_menuTab').next('.J_menuTab:eq(0)').addClass('active');

				$('.J_mainContent .J_iframe').each(function() {
					if ($(this).data('id') == activeId) {
						$(this).show().siblings('.J_iframe').hide();
						return false;
					}
				});

				var marginLeftVal = parseInt($('.page-tabs-content').css('margin-left'));
				if (marginLeftVal < 0) {
					$('.page-tabs-content').animate({
						marginLeft : (marginLeftVal + currentWidth) + 'px'
					}, "fast");
				}

				// 移除当前选项卡
				$(this).parents('.J_menuTab').remove();

				// 移除tab对应的内容区
				$('.J_mainContent .J_iframe').each(function() {
					if ($(this).data('id') == closeTabId) {
						$(this).remove();
						return false;
					}
				});
			}

			// 当前元素后面没有同辈元素，使当前元素的上一个元素处于活动状态
			if ($(this).parents('.J_menuTab').prev('.J_menuTab').size()) {
				var activeId = $(this).parents('.J_menuTab').prev('.J_menuTab:last').data('id');
				$(this).parents('.J_menuTab').prev('.J_menuTab:last').addClass('active');
				$('.J_mainContent .J_iframe').each(function() {
					if ($(this).data('id') == activeId) {
						$(this).show().siblings('.J_iframe').hide();
						return false;
					}
				});

				// 移除当前选项卡
				$(this).parents('.J_menuTab').remove();

				// 移除tab对应的内容区
				$('.J_mainContent .J_iframe').each(function() {
					if ($(this).data('id') == closeTabId) {
						$(this).remove();
						return false;
					}
				});
			}
		}
		// 当前元素不处于活动状态
		else {
			// 移除当前选项卡
			$(this).parents('.J_menuTab').remove();

			// 移除相应tab对应的内容区
			$('.J_mainContent .J_iframe').each(function() {
				if ($(this).data('id') == closeTabId) {
					$(this).remove();
					return false;
				}
			});
			scrollToTab($('.J_menuTab.active'));
		}
		return false;
	}

	$('.J_menuTabs').on('click', '.J_menuTab i', closeTab);

	// 关闭其他选项卡
	function closeOtherTabs() {
		$('.page-tabs-content').children("[data-id]").not(":first").not(".active").each(function() {
			$('.J_iframe[data-id="' + $(this).data('id') + '"]').remove();
			$(this).remove();
		});
		$('.page-tabs-content').css("margin-left", "0");
	}
	$('.J_tabCloseOther').on('click', closeOtherTabs);

	// 滚动到已激活的选项卡
	function showActiveTab() {
		scrollToTab($('.J_menuTab.active'));
	}
	$('.J_tabShowActive').on('click', showActiveTab);

	// 点击选项卡菜单
	function activeTab() {
		if (!$(this).hasClass('active')) {
			var currentId = $(this).data('id');
			// 显示tab对应的内容区
			$('.J_mainContent .J_iframe').each(function() {
				if ($(this).data('id') == currentId) {
					$(this).show().siblings('.J_iframe').hide();
					return false;
				}
			});
			$(this).addClass('active').siblings('.J_menuTab').removeClass('active');
			scrollToTab(this);
		}
	}

	$('.J_menuTabs').on('click', '.J_menuTab', activeTab);

	// 刷新iframe
	function refreshTab() {
		var currentId = $('.page-tabs-content').find('.active').attr('data-id');
		var target = $('.J_iframe[data-id="' + currentId + '"]');
		var url = target.attr('src');
		// 显示loading提示
		var index = layer.load(1, {
			shade : [ 0.1, '#fff' ]
		// 0.1透明度的白色背景
		});
		target.attr('src', url).load(function() {
			// 关闭loading提示
			layer.close(index);
		});
	}

	$('.J_menuTabs').on('dblclick', '.J_menuTab', refreshTab);

	$('.J_refreshTab').on('click', refreshTab);

	// 左移按扭
	$('.J_tabLeft').on('click', scrollTabLeft);

	// 右移按扭
	$('.J_tabRight').on('click', scrollTabRight);

	// 关闭全部
	$('.J_tabCloseAll').on('click', function() {
		$('.page-tabs-content').children("[data-id]").not(":first").each(function() {
			$('.J_iframe[data-id="' + $(this).data('id') + '"]').remove();
			$(this).remove();
		});
		$('.page-tabs-content').children("[data-id]:first").each(function() {
			$('.J_iframe[data-id="' + $(this).data('id') + '"]').show();
			$(this).addClass("active");
		});
		$('.page-tabs-content').css("margin-left", "0");
	});
});

// ibox content区域控制
var $parentNode = window.parent.document;

function $childNode(name) {
	return window.frames[name]
}

// tooltips
$('.tooltip-demo').tooltip({
    selector : "[data-toggle=tooltip]",
    container : "body"
});

// 使用animation.css修改Bootstrap Modal
$('.modal').appendTo("body");

$("[data-toggle=popover]").popover();

// 折叠ibox
$('.collapse-link').click(function() {
	var ibox = $(this).closest('div.ibox');
	var button = $(this).find('i');
	var content = ibox.find('div.ibox-content');
	content.slideToggle(200);
	button.toggleClass('fa-chevron-up').toggleClass('fa-chevron-down');
	ibox.toggleClass('').toggleClass('border-bottom');
	setTimeout(function() {
		ibox.resize();
		ibox.find('[id^=map-]').resize();
	}, 50);
});

// 关闭ibox
$('.close-link').click(function() {
	var content = $(this).closest('div.ibox');
	content.remove();
});

// //判断当前页面是否在iframe中
// if (top == this) {
// var gohome = '<div class="gohome"><a class="animated bounceInUp"
// href="index.html?v=4.0" title="返回首页"><i class="fa fa-home"></i></a></div>';
// $('body').append(gohome);
// }

// animation.css
function animationHover(element, animation) {
	element = $(element);
	element.hover(function() {
		element.addClass('animated ' + animation);
	}, function() {
		// 动画完成之前移除class
		window.setTimeout(function() {
			element.removeClass('animated ' + animation);
		}, 2000);
	});
}

// 拖动面板
function WinMove() {
	var element = "[class*=col]";
	var handle = ".ibox-title";
	var connect = "[class*=col]";
	$(element).sortable({
	    handle : handle,
	    connectWith : connect,
	    tolerance : 'pointer',
	    forcePlaceholderSize : true,
	    opacity : 0.8,
	}).disableSelection();
};

// 全站ajax加载提示
(function($) {
	// //登录过期，shiro返回登录页面
	// $.ajaxSetup({
	// complete: function (xhr, status,dataType) {
	// if('text/html;charset=UTF-8'==xhr.getResponseHeader('Content-Type')){
	// top.location.href =ctx+ 'login';
	// }
	// }
	// });
})(jQuery);