// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function() {
console.log('turbolinks:load');
$(function() {
    $('.top-img').slick({
    	autoplay: true,
    	autoplaySpeed: 2500,
    	speed: 2000,
    	cssEase: 'ease-in-out',
    	draggable: false,
    	fade: true,
    	arrows: false,
    	infinite: true,
    	swipe: true,
        dots: false,
        arrows: true,
    });
});

});

$(document).on('turbolinks:load', function() {
console.log('turbolinks:load');
$(function() {
    $('.show-image').slick({
        dots: true,
    });
});

});


$(function(){
	$(window).on('load scroll',function (){
		$('.top-about-logo').each(function(){
			//ターゲットの位置を取得
			var target = $(this).offset().top;
			//スクロール量を取得
			var scroll = $(window).scrollTop();
			//ウィンドウの高さを取得
			var height = $(window).height();
			//ターゲットまでスクロールするとフェードインする
			if (scroll > target - height){
				//クラスを付与
				$(this).addClass('active');
			}

			if (scroll < 400) {
                $(this).removeClass("active");
            }
		});
	});
});

$(function(){
	$(window).on('load scroll',function (){
		$('.top-logo-child').each(function(){
			//ターゲットの位置を取得
			var target = $(this).offset().top;
			//スクロール量を取得
			var scroll = $(window).scrollTop();
			//ウィンドウの高さを取得
			var height = $(window).height();
			//ターゲットまでスクロールするとフェードインする
			if (scroll > target - height){
				//クラスを付与
				$(this).addClass('active1');
			}

			if (scroll < 400) {
                $(this).removeClass("active1");
            }
		});
	});
});

$(function(){
	$(window).on('load scroll',function (){
		$('.top-logo-child-2').each(function(){
			//ターゲットの位置を取得
			var target = $(this).offset().top;
			//スクロール量を取得
			var scroll = $(window).scrollTop();
			//ウィンドウの高さを取得
			var height = $(window).height();
			//ターゲットまでスクロールするとフェードインする
			if (scroll > target - height){
				//クラスを付与
				$(this).addClass('active2');
			}

			if (scroll < 400) {
                $(this).removeClass("active2");
            }
		});
	});
});


$(function(){
	$(window).on('load scroll',function (){
		$('.top-logo-child').each(function(){
			//ターゲットの位置を取得
			var target = $(this).offset().top;
			//スクロール量を取得
			var scroll = $(window).scrollTop();
			//ウィンドウの高さを取得
			var height = $(window).height();
			//ターゲットまでスクロールするとフェードインする
			if (scroll > target - height){
				//クラスを付与
				$(this).addClass('active1');
			}

			if (scroll < 400) {
                $(this).removeClass("active1");
            }
		});
	});
});

$(function(){
	$(window).on('load scroll',function (){
		$('.top-last-child').each(function(){
			//ターゲットの位置を取得
			var target = $(this).offset().top;
			//スクロール量を取得
			var scroll = $(window).scrollTop();
			//ウィンドウの高さを取得
			var height = $(window).height();
			//ターゲットまでスクロールするとフェードインする
			if (scroll > target - height){
				//クラスを付与
				$(this).addClass('active3');
			}

			if (scroll < 400) {
                $(this).removeClass("active3");
            }
		});
	});
});

$(function(){
	$(window).on('load scroll',function (){
		$('.top-last-child-2').each(function(){
			//ターゲットの位置を取得
			var target = $(this).offset().top;
			//スクロール量を取得
			var scroll = $(window).scrollTop();
			//ウィンドウの高さを取得
			var height = $(window).height();
			//ターゲットまでスクロールするとフェードインする
			if (scroll > target - height){
				//クラスを付与
				$(this).addClass('active4');
			}

			if (scroll < 400) {
                $(this).removeClass("active4");
            }
		});
	});
});