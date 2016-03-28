<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include.inc.jsp"%>
<!DOCTYPE html>
<!-- saved from url=(0030)http://classroom.sicnu.edu.cn/ -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--<base href="http://classroom.sicnu.edu.cn:80/">-->
<base href=".">

<title>教室管理系统</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/front/css/jbox.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/front/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/front/js/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/front/js/jquery.jBox-zh-CN.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/front/js/lookRC.js"></script>

<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/front/css/reset.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/front/css/global.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/front/css/footer.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/front/css/publicbutton.css">
<script type="text/javascript">
	$(function() {
		$("input[type='button']").each(function() {
			$(this).addClass("current");
		});
		$("input[type='submit']").each(function() {
			$(this).addClass("current");
		});
	});
</script>
<style type="text/css">
body {
	background-image: url(${pageContext.request.contextPath}/front/img/htmlbg.png);
}

#wraper {
	margin: 0 auto;
	width: 900px;
	height: 500px;
	background-image: url(${pageContext.request.contextPath}/front/img/bg.png);
	background-repeat: no-repeat;
}

#query1 img {
	cursor: pointer;
}

#query_note1 {
	display: none;
	width: 189px;
	background-color: #4D4D4D;
	color: #FFFFFF;
	font-size: 16px;
	display: none;
	line-height: normal;
	text-align: left;
}

#apply1 img {
	cursor: pointer;
}

#apply_note1 {
	display: none;
	width: 189px;
	background-color: #4D4D4D;
	color: #FFFFFF;
	font-size: 16px;
	display: none;
	text-align: left;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		var windowWidth = $(window).width();
		var windowHeight = $(window).height();

		$("#query1 img").hover(function() {
			$("#query_note1").slideToggle();
		}, function() {
			$("#query_note1").slideToggle();
		});
		$("#apply1 img").hover(function() {
			$("#apply_note1").slideToggle();
		}, function() {
			$("#apply_note1").slideToggle();
		});

		$("#query1 img").click(function() {
			window.location.href = "classroom/queryclassroom";
		});
		$("#apply1 img").click(function() {
			window.location.href = "user/login";
		});

	});
</script>
</head>

<body>
	<div id="wraper">
		<div id="logo—box" style="height: 145px; overflow: hidden;">
		
			<div
				style="float: left; margin-left: 10px; margin-top: 10px; font-size: 45px; color: #000000; width: 300px;">
				 <span style="font-size: 25px; color: #4D4D4D;">教室综合管理系统</span>
			</div>
		</div>
		<div
			style="margin-top: 70px; height: 80px; width: 100%; overflow: hidden;">
			<div id="query1"
				style="display: inline; float: left; margin-left: 110px">
				<img
					src="${pageContext.request.contextPath}/front/img/btn_query.png">
			</div>
			<div id="apply1"
				style="display: inline; float: right; margin-right: 110px">
				<img
					src="${pageContext.request.contextPath}/front/img/btn_apply.png">
			</div>
		</div>
		<div style="height: 150px; width: 100%; overflow: hidden;">
			<div id="query_note1"
				style="float: left; margin-left: 115px; display: none;">
				<p style="margin: 10px 5px;">空闲教室查询和排课数据查询。</p>
			</div>
			<div id="apply_note1" style="float: right; margin-right: 115px">
				<p style="margin: 10px 5px;">申请教室，需要登录才可申请。</p>
			</div>

		</div>
	</div>


<!-- 
	<div id="_my97DP"
		style="position: absolute; top: -1970px; left: -1970px;">
		<iframe style="width: 186px; height: 198px;"
			src="./四川师范大学教室管理系统_files/My97DatePicker.html" frameborder="0"
			border="0" scrolling="no"></iframe>
	</div> -->
</body>
</html>