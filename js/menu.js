$('ul#nav li a').click(function(){
	
	$('a').removeClass('selected');
	$(this).parent().addClass('selected');
	
});