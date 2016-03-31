<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include.inc.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教室管理系统</title>

<meta http-equiv="X-UA-Compatible" content="IE=100">

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
	src="${pageContext.request.contextPath}/front/js/classroom_apply.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/front/js/stu_center.js"></script>
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
	href="${pageContext.request.contextPath}/front/css/jbox.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/front/css/classroom_apply.css">
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
</head>

<body>
	<script type="text/javascript">
		var bg = "/usercenter/img/classroom.png";
		$(function() {
			var d = new Date();
			var month = d.getMonth() + 1;
			if (month < 10) {
				month = "0" + month;
			}
			var newDate = d.getFullYear() + "-" + (month) + "-" + d.getDate();
			$("#useDate").val(newDate);
			//加载时间
			var $timeOption = $("#zxsj").find("option");
			var $start = $("#startClassNum").find("option");
			;
			$("#startClassNum").find("option").last().remove();
			var $end = $("#endClassNum").find("option");
			$("#endClassNum").find("option").last().remove();

			$timeOption.each(function(i) {
				if (i > 0 && i < 15) {
					var tt = $(this).text();
					var jc = $($start.get(i)).text();
					$($start.get(i)).text(jc + "(" + tt + ")");
					$($end.get(i)).text(jc + "(" + tt + ")");
				}
			});
		});
	</script>
	<!-- 头部签 -->
			<%@include file="../../header.jsp" %>
			<!-- 内容区域 -->
			<div id="content">
				<div id="classroom_apply_box">
					<div class="stepbox" style="display: block;">
						<p>
							第1步：填写必要的信息&nbsp;&nbsp;[<a href="javascript:void(0);"
								class="apply_rule">教室申请规则</a>]
						</p>
						<form id="applyForm"
							action="#"
							method="post">
							<div><c:if test="${info!=null} ">

											${info}
										</c:if></div>
							<table>
								<div>
									<input type="hidden" name="u_Id" value="${user.u_Id}">
								</div>
								<tbody>
									<tr>

										<td class="label">使用时间：</td>
										<td><select id="zxsj" style="display: none">
												<option value="-1">--请选择--</option>
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
										</select> - <select id="useDate" name="cr_usertime"
											style="width: 120px; height: 25px;"
											class="textbox form_element_size">
												<option value="2016-03-27">2016-03-27</option>
												<option value="2016-03-28">2016-03-28</option>
												<option value="2016-03-29">2016-03-29</option>
												<option value="2016-03-30">2016-03-30</option>
												<option value="2016-03-31">2016-03-31</option>
												<option value="2016-04-01">2016-04-01</option>
												<option value="2016-04-02">2016-04-02</option>
										</select> 从&nbsp;<select id="startClassNum" name="cr_timestart"
											class="classtime">
												<option value="-1">--请选择--</option>
												<option value="1">第一节(08:10:00-08:55:00)</option>
												<option value="2">第二节(09:00:00-09:45:00)</option>
												<option value="3">第三节(10:10:00-10:55:00)</option>
												<option value="4">第四节(11:00:00-11:45:00)</option>
												<option value="5">第五节(11:50:00-12:35:00)</option>
												<option value="6">中午(12:45:00-14:00:00)</option>
												<option value="7">第六节(14:10:00-14:55:00)</option>
												<option value="8">第七节(15:00:00-15:45:00)</option>
												<option value="9">第八节(16:10:00-16:55:00)</option>
												<option value="10">第九节(17:00:00-17:45:00)</option>
												<option value="11">第十节(17:50:00-18:35:00)</option>
												<option value="12">第十一节(19:10:00-19:55:00)</option>
												<option value="13">第十二节(20:00:00-20:45:00)</option>
												<option value="14">第十三节(20:50:00-21:35:00)</option>

										</select> 到&nbsp;<select id="endClassNum" name="cr_timeend"
											class="classtime">
												<option value="-1">--请选择--</option>
												<option value="1">第一节(08:10:00-08:55:00)</option>
												<option value="2">第二节(09:00:00-09:45:00)</option>
												<option value="3">第三节(10:10:00-10:55:00)</option>
												<option value="4">第四节(11:00:00-11:45:00)</option>
												<option value="5">第五节(11:50:00-12:35:00)</option>
												<option value="6">中午(12:45:00-14:00:00)</option>
												<option value="7">第六节(14:10:00-14:55:00)</option>
												<option value="8">第七节(15:00:00-15:45:00)</option>
												<option value="9">第八节(16:10:00-16:55:00)</option>
												<option value="10">第九节(17:00:00-17:45:00)</option>
												<option value="11">第十节(17:50:00-18:35:00)</option>
												<option value="12">第十一节(19:10:00-19:55:00)</option>
												<option value="13">第十二节(20:00:00-20:45:00)</option>
												<option value="14">第十三节(20:50:00-21:35:00)</option>

										</select> <span class="formcheck_must" style="color: orange;">*</span></td>
									</tr>
									<tr>
										<td class="label">教学楼：</td>
										<td><select name="cr_location" class="place">
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
												<option value="10">第十教学楼</option></td>
									</tr>
									<tr>
										<td class="label">教室类型：</td>
										<td><select id="use" name="cr_type"
											class="form_element_size">
												<option value=""''="">--请选择--</option>
												<option value="1">学院专属教室</option>
												<option value="2">普通公用教室</option>
										</select> <span class="formcheck_must" style="color: orange;">*</span></td>
									</tr>
									<tr>
										<td class="label">申请教室用途：</td>
										<td><select id="applyfor" name="cr_userteach"
											class="form_element_size">
												<option value=""''="">--请选择--</option>
												<option value="1">教学活动</option>
												<option value="2">学生活动</option>
										</select> <span class="formcheck_must" style="color: orange;">*</span></td>
									</tr>
									<tr>
										<td class="label">多媒体教室：</td>
										<td><select id="isMedia" name="cr_dec"
											class="form_element_size">
												<option value=""''="">--请选择--</option>
												<option value="1">是</option>
												<option value="2">否</option>
										</select></td>
									</tr>
									<tr>
										<td class="label">座位数目：</td>
										<td><select id="chairs" name="cr_seat"
											class="form_element_size">
												<option value=""''="">--请选择--</option>
												<option value="1">0-20</option>
												<option value="2">20-40</option>
												<option value="3">40-60</option>
												<option value="4">60-80</option>
												<option value="5">80-100</option>
												<option value="6">100-120</option>
												<option value="7">120-140</option>
												<option value="8">140-160</option>
												<option value="9">160-180</option>
												<option value="10">180-200</option>
												<option value="11">200-250</option>
												<option value="12">250-300</option>
										</select></td>
									</tr>

									<tr id="tr_bantuan_note">
										<td class="label">活动内容：</td>
										<td><textarea id="txt_note"
												style="width: 383px; height: 120px;" name="cr_activecontent"></textarea>
											<span class="formcheck_must" style="color: orange">*</span></td>
									</tr>
									<tr>
										<td colspan="3"><input type="button" id="step1cancel"
											class="btn current"
											style="margin-left: 160px; background-position: -648px;">
											<input type="button" id="step1next" class="btn current"
											style="margin-left: 240px; background-position: -288px;"></td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>