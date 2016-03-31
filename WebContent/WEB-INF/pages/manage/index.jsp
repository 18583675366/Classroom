<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../include.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>教室管理系统</title>

<link
	href="${pageContext.request.contextPath}/style/themes/default/style.css"
	rel="stylesheet" type="text/css" media="screen" />
<link
	href="${pageContext.request.contextPath}/style/themes/css/core.css"
	rel="stylesheet" type="text/css" media="screen" />
<link
	href="${pageContext.request.contextPath}/style/themes/css/print.css"
	rel="stylesheet" type="text/css" media="print" />
<link
	href="${pageContext.request.contextPath}/style/uploadify/css/uploadify.css"
	rel="stylesheet" type="text/css" media="screen" />
<!--[if IE]>
<link href="themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->

<!--[if lte IE 9]>
<script src="js/speedup.js" type="text/javascript"></script>
<![endif]-->

<script
	src="${pageContext.request.contextPath}/style/js/jquery-1.7.2.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/style/js/jquery.cookie.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/style/js/jquery.validate.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/style/js/jquery.bgiframe.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/style/xheditor/xheditor-1.2.1.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/style/xheditor/xheditor_lang/zh-cn.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/style/uploadify/scripts/jquery.uploadify.js"
	type="text/javascript"></script>


<script src="${pageContext.request.contextPath}/style/js/dwz.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/style/js/dwz.regional.zh.js"
	type="text/javascript"></script>
</head>
<script type="text/javascript">
	$(function() {
		DWZ.init("style/dwz.frag.xml", {
			loginUrl : "login_dialog.html",
			loginTitle : "登录", // 弹出登录对话框
			//		loginUrl:"login.html",	// 跳到登录页面
			statusCode : {
				ok : 200,
				error : 300,
				timeout : 301
			}, //【可选】
			pageInfo : {
				pageNum : "pageNum",
				numPerPage : "numPerPage",
				orderField : "orderField",
				orderDirection : "orderDirection"
			}, //【可选】
			keys : {
				statusCode : "statusCode",
				message : "message"
			}, //【可选】
			ui : {
				hideMode : 'offsets'
			}, //【可选】hideMode:navTab组件切换的隐藏方式，支持的值有’display’，’offsets’负数偏移位置的值，默认值为’display’
			debug : false, // 调试模式 【true|false】
			callback : function() {
				initEnv();
				$("#themeList").theme({
					themeBase : "themes"
				}); // themeBase 相对于index页面的主题base路径
			}
		});
	});
</script>
<body scroll="no">
	<div id="layout">
		<div id="header">
			<div class="headerNav">
				<a class="" href="index">教室管理系统</a>
				<ul class="nav">
					<li><a href="changepwd.html" target="dialog" width="600">
							您好${user.xgUsername },欢迎来到教室管理系统 <c:if
								test="${empty sessionScope.user }">
		        		请 <a href="manage/loginUI">登录 |</a>
							</c:if>
					</a></li>
					<li><a href="manageLogout">退出</a></li>
				</ul>
				<ul class="themeList" id="themeList">
					<li theme="default"><div class="selected">蓝色</div></li>
					<li theme="green"><div>绿色</div></li>
					<!--<li theme="red"><div>红色</div></li>-->
					<li theme="purple"><div>紫色</div></li>
					<li theme="silver"><div>银色</div></li>
					<li theme="azure"><div>天蓝</div></li>
				</ul>
			</div>
		</div>
		<!-- left -->
		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse">
						<div></div>
					</div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse">
					<h2>主菜单</h2>
					<div>收缩</div>
				</div>

				<div class="accordion" fillSpace="sidebar">
					<div class="accordionHeader">
						<h2>
							<span>Folder</span>后台管理
						</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a href="javascript:void(0)" target="" rel="">查询教室状态</a>
								<ul>
									<li><a
										href="${pageContext.request.contextPath}/dynamic/dynamicInfoUI/${l.xgLocId }"
										target="navTab" rel="dynamicInfo">审核中</a></li>
									<li><a
										href="${pageContext.request.contextPath}/dynamic/dynamicInfoUI/${l.xgLocId }"
										target="navTab" rel="dynamicInfo">审核通过</a></li>
									<li><a
										href="${pageContext.request.contextPath}/dynamic/dynamicInfoUI/${l.xgLocId }"
										target="navTab" rel="dynamicInfo">审核完成</a></li>
									<li><a
										href="${pageContext.request.contextPath}/dynamic/dynamicInfoUI/${l.xgLocId }"
										target="navTab" rel="dynamicInfo">已经完成</a></li>
								</ul></li>
							<li><a href="javascript:void(0)" target="" rel="">添加教室</a></li>
							<li><a href="javascript:void(0)" target="" rel="">查看用户</a></li>

						</ul>
					</div>

				</div>
			</div>
		</div>
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent">
						<!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span
										class="home_icon">我的主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div>
					<!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div>
					<!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">

				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">


						<div style="width: 230px; position: absolute; top: 60px; right: 0"
							layoutH="80">
							<iframe width="100%" height="430" class="share_self"
								frameborder="0" scrolling="no"
								src="http://widget.weibo.com/weiboshow/index.php?width=0&height=430&fansRow=2&ptype=1&skin=1&isTitle=0&noborder=1&isWeibo=1&isFans=0&uid=1739071261&verifier=c683dfe7"></iframe>
						</div>
					</div>

				</div>
			</div>
		</div>

	</div>

	<div id="footer">
		Copyright &copy; 2015 <a href="demo_page2.html" target="dialog">Xghome</a>
	</div>


</body>
</html>