$(document).ready(function(){
	yzinit();
	var $container = $('#masonry');
	$container.imagesLoaded( function(){
	  $container.masonry({
		itemSelector : '.box',isAnimated: true
	  });
	});
	setTimeout(rem,1000);
	setTimeout(rem,3000);
	setTimeout(rem,5000);
});
function yzinit(){
	$(".flexible_img_col .box").each(function(h){
		if($(this).find("img.dno").length < 1) return;
		var i = $(this).find("a").attr("href");
		var j = "R400x0";
		var k = "mq";
		var d = $(this).find(".thumb img");
		var f = $(this).find(".thumb #str");
		var $t = $(this);
		$.ajax({
			url:i,
			dataType:"html",
			success:function(b){
				
				var tl = b.indexOf('<div class="entry-ccl"',0);
				if(tl < 0) tl = b.indexOf('<div class="another_category',0);
				if(tl < 0) tl = b.indexOf('<!-- article ed -->',0);
				if(tl < 0) tl = b.indexOf('</body',0);
				b = b.substring(b.indexOf('<div class="article">',0),tl);
				var a;
				var e = 'http://cfile';
				var g = '"';	
				if(b.match(e+"(.*?)"+g)!=null){
					a = b.match(e+"(.*?)"+g)[0];
					a = a.substring(0,a.length-1);
					d.removeClass("dno");
					a = a.replace("image",j);
					a = a.replace("C74x107",j);
					a = a.replace("S74x74",j);
					d.attr("src",a.replace('original',j));
					f.hide();
				}else{
					e = 'http://book.daum-img.net/';
					g = '"';
					if(b.match(e+"(.*?)"+g)!=null){
						a = b.match(e+"(.*?)"+g)[0];
						a = a.replace('"','');
						a = a.substring(0,a.length);
						a = a.replace("image",j);
						a = a.replace("R72x100",j);
						d.attr("src",a.replace('original',j));
						d.removeClass("dno");
						f.hide();
					}else{
						/*
						e = 'youtube.com/';
						var c = b.indexOf(e);
						if(c > 0){
							c = b.indexOf("/",c+13)+1;
							var l = b.indexOf("?",c);
							if(l<0||l-c>20){
								l = b.indexOf("&",c)
							}
							if(l<0||l-c>20){
								l = b.indexOf('"',c)
							}
							var idx = b.substring(c,l);
							d.removeClass("dno");
							d.attr("src","http://i2.ytimg.com/vi/"+idx+"/"+k+"default.jpg");
							f.hide();
							$t.addClass("youtube");
						}else{
						}
						*/
						$t.find(".thumb").remove();
						f.text("No Img")
					}
				}
			}
		});
	});
}

function rem(){
	$('#masonry').masonry('reload');
}