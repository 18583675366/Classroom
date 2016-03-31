<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include.inc.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--<base href=":80/">-->
<base href=".">
<title>教室管理系统</title>

<meta http-equiv="X-UA-Compatible" content="IE=100">
<!-- IE8 mode -->
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
$(document)
.ready(
		function() {
	$("input[type='button']").each(function(){
		$(this).addClass("current");
	});
	$("input[type='submit']").each(function(){
		$(this).addClass("current");
	});	
	$("#next").click(function(){
		var url=window.location.href;
		var currentPage=url.substring(url.lastIndexOf("=")+1, url.length);
		currentPage++;
		var currentPagecount=$("#end").attr("data-end");
		if(currentPage>currentPagecount){
			currentPage=currentPagecount;
		}
		window.location.href="${pageContext.request.contextPath}/classroom/searchroom?currentPage="+currentPage;
	});
	$("#prev").click(function(){
		var url=window.location.href;
		var currentPage=url.substring(url.lastIndexOf("=")+1, url.length);
		currentPage--;
		if(currentPage<0){
			currentPage=0;
		}
		window.location.href="${pageContext.request.contextPath}/classroom/searchroom?currentPage="+currentPage;
	});
	$("#first").click(function(){
		var url=window.location.href;
		var currentPage=url.substring(url.lastIndexOf("=")+1, url.length);
		currentPage--;
		window.location.href="${pageContext.request.contextPath}/classroom/searchroom?currentPage="+0;
	});
	$("#end").click(function(){
		var url=window.location.href;
		var currentPage=$(this).attr("data-end");
		window.location.href="${pageContext.request.contextPath}/classroom/searchroom?currentPage="+currentPage;
	});
});
</script>
</head>

<body>


	<!-- 头部签 -->
	<%@include file="../../header.jsp"%>
	<!-- 内容区域 -->
	<div id="content">
		<p>我的申请单</p>
		<div id="content-body">
			<form id="searchroom" action="${pageContext.request.contextPath}/classroom/searchroom?currentPage=0" method="post">
			<input type="hidden" name="currentPage" value="0">
			<input type="hidden" name="u_Id" value="${user.u_Id}">
				教室使用日期：从<input id="useDate" class="textbox form_element_size"
					onclick="WdatePicker({dateFmt:&#39;yyyy-MM-dd&#39;,readOnly:true})"
					style="position: relative; top: 0px;" name="cr_timestart"> 到<input
					class="textbox form_element_size"
					
					onclick="WdatePicker({dateFmt:&#39;yyyy-MM-dd&#39;,readOnly:true})"
					style="position: relative; top: 0px;"
					name="cr_timeend"> 状态：<select
					name="cr_type">
					<option value=""''="">--请选择--</option>
					<option value="0">审批中</option>
					<option value="3">已终止</option>
					<option value="1">已通过</option>
					<option value="2">已完成</option>
				</select> <input id="searchbt" type="submit" value="" class="stu_btn_search current">
			</form>
			<table>
				<tbody>
					<tr class="table_th">
						<th>序号</th>
						<th>申请人</th>
						<th>教室</th>
						<th>使用时间</th>
						<th>申请时间</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
					<c:forEach var="r" items="${classroomss}" varStatus="status">
						<tr class="table_th">
							<th>${ status.index + 1}</th>
							<th>${r.cr_state}</th>
							<th>${r.cr_id}</th>
							<th>${r.cr_timestart }到${r.cr_timeend}</th>
							<th>${r.cr_usertime}</th>
							<c:if test="${r.cr_type==0}">
								<th>审核通过</th>

							</c:if>
							<c:if test="${r.cr_type==1}">
								<th>审核中</th>

							</c:if>
							<c:if test="${r.cr_type==2}">
								<th>已经完成</th>

							</c:if>
							<c:if test="${r.cr_type==3}">
								<th>终止</th>

							</c:if>
							<th><a href="#">删除</a>Ⅰ<a href="#">修改</a></th>
						</tr>
					</c:forEach>
					



				</tbody>
			</table>
			<input type="button" id="end" class="page-btn current"
				style="background-position: -576px;" data-end="${pageCounts}"> 
				<input type="button" id="prev"
				class="page-btn current" style="background-position: -360px;">
			<input type="button" id="next" class="page-btn current"
				style="background-position: -432px;"> 
				<input type="button"
				class="page-btn current" id="first" style="background-position: -504px;">
			<div style="clear: both;"></div>
		</div>
	</div>
	</div>

	<div id="footer-wrap"></div>

	</div>
	<script type="text/javascript">
		function showProcessFlowImg(executionId) {
			openModalWindow(1000, 570, "教室申请流程图", "classroomApplyApprove/getCoordinate.action?executionId="+executionId);
		}
	</script>
</body>
</html>