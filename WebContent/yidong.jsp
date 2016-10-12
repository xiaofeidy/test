<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>小方块移动</title>
<script type="text/javascript" src="js/jquery.js"></script>
<style type="text/css">
#box {
	position: absolute;
	background-color : red;
	height: 100px;
	width: 100px;
	left : 100px;
	top : 100px;
}
</style>
<script type="text/javascript">
$(function(){
	 $("#box").mousedown(function(e){
		var m_left = e.pageX;
		var m_top = e.pageY;
		var old_top = $(this).position().top;
		var old_left = $(this).position().left;
		$(document).mousemove(function(ev){
			var m_n_left = ev.pageX;
			var m_n_top = ev.pageY;
			var diff_x = m_n_left - m_left;
			var diff_y = m_n_top - m_top;
			var new_left = old_left + diff_x;
			var new_top = old_top + diff_y;
			if (new_left<0) {
				new_left = 0;
			}
			if (new_top<0) {
				new_top = 0;
			}
			if(new_top > $(document).height()-$("#box").height()) {
				new_top = $(document).height()-$("#box").height();
			}
			if (new_left > $(document).width()-$("#box").width()) {
				new_left = $(document).width()-$("#box").width()
			}
			$("#box").css({"top":new_top+"px","left":new_left+"px"});
		})
	}) 
	$("#box").mouseup(function(){
		$(document).off(mousemove);
	})
})
</script>
</head>
<body>
<div id="box"></div>
</body>
</html>