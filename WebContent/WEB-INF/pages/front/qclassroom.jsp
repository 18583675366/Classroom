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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/front/js/unlogin_indexquery.js"></script>
<script type="text/javascript">
	var room="/unlogin/img/room.png";
	var state1="/unlogin/img/kx.png";//正常
	var state3="/unlogin/img/zy.png"; //占用维护使用
	
	$(document).ready(function(){
		$("li#user").click(function(){
			window.location.href = "/user/login";
		});
	});
	</script>

</head>

<body>

	<div id="content-wrap">
		<div id="header-wrap">
			<div id="header">
				<div>
					<ul>
						<!-- <li id="exit"></li>  -->
						<li id="user"><a
							href="${pageContext.request.contextPath}/front/user/login">
								登录 </a></li>
						<!-- <li id="thrame"></li> -->
					</ul>
				</div>
			</div>
			<div id="main">
				<select id="zxsj" style="display: none">
					<option value="1">08:10:00-08:55:00</option>
					<option value="2">09:00:00-09:45:00</option>
					<option value="3">10:10:00-10:55:00</option>
					<option value="4">11:00:00-11:45:00</option>
					<option value="5">11:50:00-12:35:00</option>
					<option value="6">12:45:00-14:00:00</option>
					<option value="7">14:10:00-14:55:00</option>
					<option value="8">15:00:00-15:45:00</option>
					<option value="9">16:10:00-16:55:00</option>
					<option value="10">17:00:00-17:45:00</option>
					<option value="11">17:50:00-18:35:00</option>
					<option value="12">19:10:00-19:55:00</option>
					<option value="13">20:00:00-20:45:00</option>
					<option value="14">20:50:00-21:35:00</option>
					<option value="16">18:45:00-19:00:00</option>
				</select>
				<div id="classRoom">
					<div id="search">
						<form
							action="${pageContext.request.contextPath}/classroom/queryclassroom"
							method="post" id="form_query">
							<div class="querydiv">
								<input type="text" name="cr_id" class="inputtext" value="教室编号">
							</div>
							<div class="showmore">
								<a href="" class="more">更多查询条件+</a>
							</div>
							<div class="tiaoj" style="display: none;">
								<hr style="border: 1px dotted gainsboro; width: 100%;">
								&nbsp;&nbsp;校区： <select name="iq.zone" class="place">
									<option value="">--请选择--</option>
									<option value="1">郫县</option>
									<option value="2">成都</option>
								</select> &nbsp;&nbsp;教学楼： <select name="cr_location" class="place">
									<option value="">--请选择--</option>
									<option value="01">第一教学楼</option>
									<option value="02">第二教学楼</option>
									<option value="03">第三教学楼</option>
									<option value="04">第四教学楼</option>
									<option value="05">第五教学楼</option>
									<option value="06">第六教学楼</option>
									<option value="07">第七教学楼</option>
									<option value="08">第八教学楼</option>
									<option value="09">第九教学楼</option>
									<option value="10">第十教学楼</option>
								</select> &nbsp;&nbsp; 日期：<input type="text" name="cr_usertime"
									id="date1"
									onclick="WdatePicker({dateFmt:&#39;yyyy-MM-dd&#39;,readOnly:true,onpicked:getWeak})"
									style="width: 80px;"> 从： <select id="startkj"
									name="cr_timestart" class="place">
									<option value="">--请选择--</option>
									<option value="1">第一节</option>
									<option value="2">第二节</option>
									<option value="3">第三节</option>
									<option value="4">第四节</option>
									<option value="5">第五节</option>
									<option value="6">中午</option>
									<option value="7">第六节</option>
									<option value="8">第七节</option>
									<option value="9">第八节</option>
									<option value="10">第九节</option>
									<option value="11">第十节</option>
									<option value="12">第十一节</option>
									<option value="13">第十二节</option>
									<option value="14">第十三节</option>
									<option value="16">晚上</option>
								</select>到 <select id="endkj" name="cr_timeend" class="place">
									<option value="">--请选择--</option>
									<option value="1">第一节</option>
									<option value="2">第二节</option>
									<option value="3">第三节</option>
									<option value="4">第四节</option>
									<option value="5">第五节</option>
									<option value="6">中午</option>
									<option value="7">第六节</option>
									<option value="8">第七节</option>
									<option value="9">第八节</option>
									<option value="10">第九节</option>
									<option value="11">第十节</option>
									<option value="12">第十一节</option>
									<option value="13">第十二节</option>
									<option value="14">第十三节</option>
									<option value="16">晚上</option>
								</select> <span class="showxq"></span> <input type="hidden" name="iq.xq"
									id="xq" readonly="readonly"
									style="width: 100px; background-color: #ccc">
							</div>
							<div class="searchButton">
								<input type="image" id="query" align="absmiddle"
									src="${pageContext.request.contextPath}/front/img/index_submit.png"
									onclick="javascript:void(0)">&nbsp;&nbsp; <input
									type="image" id="resetBtn" align="absmiddle"
									src="${pageContext.request.contextPath}/front/img/index_result.png">
								&nbsp;&nbsp;&nbsp;
							</div>
						</form>
						<div style="clear: both"></div>

					</div>

					<!-- 教室列表 -->
					<div id="classRoomList" style="opacity: 0.99;">
						<div class="room">
							<input type="hidden" value="000001">
							<ul class="roomul">
								<c:forEach items="${qclassrooms}" var="qr">
									<li class="limg"
										style="background-image: url(${pageContext.request.contextPath}/front/img/kx.png);"><div
											class="lf rn" style="margin-left: 65px;">${qr.cr_id}</div></li>

								</c:forEach>

							</ul>
						</div>
					</div>


					<div id="indexPage">

						当前页<span class="showpage">1/1</span>&nbsp;&nbsp; <input
							type="image" id="indexpage" align="absmiddle"
							src="${pageContext.request.contextPath}/front/img/index_page.png">&nbsp;&nbsp;
						<input type="image" id="uppage" align="absmiddle"
							src="${pageContext.request.contextPath}/front/img/index_pageup.png">&nbsp;&nbsp;
						<input type="image" id="downpage" align="absmiddle"
							src="${pageContext.request.contextPath}/front/img/index_pagedown.png">&nbsp;&nbsp;
						<input type="image" id="lastpage" align="absmiddle"
							src="${pageContext.request.contextPath}/front/img/index_lastdown.png">&nbsp;&nbsp;
					</div>

				</div>


			</div>

		</div>
		<div style="clear: both"></div>
	</div>
</body>
</html>