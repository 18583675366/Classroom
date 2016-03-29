<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include.inc.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--<base href="http://classroom.sicnu.edu.cn:80/">-->
<base href=".">

<meta http-equiv="X-UA-Compatible" content="IE=100">
<!-- IE8 mode -->
<title>教室查询</title>
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/front/js/publicAjax.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/front/js/unlogin_indexquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/front/My97DatePicker/WdatePicker.js"></script>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/front/css/reset.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/front/css/global.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/front/css/footer.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/front/css/publicbutton.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/front/css/stu_common.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/front/css/apply_order.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/front/css/jbox.css">
	<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/front/css/new_message.css">
<script type="text/javascript">
$(function(){
	$("input[type='button']").each(function(){
		$(this).addClass("current");
	});
	$("input[type='submit']").each(function(){
		$(this).addClass("current");
	});
});
</script>

<!-- 特殊界面处理，需要调用插件集合 -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/front/css/unlogin_index.css">
<script type="text/javascript">
	var room="${pageContext.request.contextPath}/img/kx.png";
	var state1="${pageContext.request.contextPath}/img/kx.png";//正常
	var state3="${pageContext.request.contextPath}/img/kx.png"; //占用维护使用
	$(document).ready(function(){
	});
	</script>
</head>
<body>
<div id="content-wrap">
		<div id="header">
			<div>
				<ul>
					<li menu="loginout" style="cursor: pointer;"><a
						href="/login/loginout.action">安全退出</a></li>
					<!-- <li id="exit"><a href="login/loginout.action"></a></li> -->
					<li id="user"><a href="javascript:void(0)">${user.u_account}</a></li>

					<!-- <li id="thrame"><a href="#"></a></li> -->
				</ul>
			</div>
		</div>
	<div id="body-wrap">
			<div id="left-box">
				<p class="title">新消息</p>
				
				<div class="msg">
					<a href="http://classroom.sicnu.edu.cn/message/get.action?message.id=MID1418115555741"><p>任务：的教室 07206 通过审批！    </p></a><p class="timestamp">2014-12-9 16:59:15</p>
				</div>
				
				<div class="msg">
					<a href="http://classroom.sicnu.edu.cn/message/get.action?message.id=MID1427937147608"><p>任务：的教室 03102 通过审批！    </p></a><p class="timestamp">2015-4-2 9:12:27</p>
				</div>
				
			</div>
    		<div id="side_menu_wrap">
	    		<ul>
	    			<li><a href="http://classroom.sicnu.edu.cn/message/queryNew.action"><span id="msg" class="ico"></span><span>新消息</span><span id="newMsgNum" class="num">0</span></a></li>
	    			<li><a href="http://classroom.sicnu.edu.cn/classroomApplyForm/queryByUser.action?classroomApplyForm.status=3"><span id="wait" class="ico"></span><span>申请通过的教室</span><span class="num">0</span></a></li>
	    			<li><a href="http://classroom.sicnu.edu.cn/classroomApplyForm/queryByUser.action?classroomApplyForm.status=1"><span id="hold" class="ico"></span><span>审批中的申教室</span><span class="num">0</span></a></li>
	    			
	    			<li><a href="http://classroom.sicnu.edu.cn/usercenter/stu_apply.jsp"><span id="hold" class="ico"></span><span>申请教室</span></a></li>
	    			<li><a href="http://classroom.sicnu.edu.cn/unlogin/unlogin_indexquery.jsp"><span id="hold" class="ico"></span><span>教室查询</span></a></li>
	    		</ul>
    		</div>
			<div style="clear:both;"></div>
		</div>
</body>
</html>