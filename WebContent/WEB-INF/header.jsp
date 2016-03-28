<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./include.inc.jsp"%>
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
			<!-- 导航条 -->
			<div id="nav-bar">
				<div id="nav">
					<ul>
						<li id="home"><a href="${pageContext.request.contextPath}/classroom/roomhome?u_Id=${user.u_Id}"></a></li>
						<li id="applyroom"><a
							href="${pageContext.request.contextPath}/user/applyroom?u_Id=${user.u_Id}"></a></li>
						<li id="applyform"><a
							href="${pageContext.request.contextPath}/classroom/myapplyroom?u_Id=${user.u_Id}&currentPage=0"></a></li>
						<li id="message"><a href="/message/query.action"></a></li>
					</ul>
				</div>
				<div id="msg-content">
					<ul>
						<li><a href="${pageContext.request.contextPath}/user/"><span
								id="msg" class="ico"></span><span>新消息</span><span id="newMsgNum"
								class="num" style="background-color: rgb(255, 0, 0);">消息(0)</span></a></li>
						<li><a href="#"><span id="wait" class="ico"></span><span>申请通过的教室</span><span
								class="num">${passroom }</span></a></li>
						<li><a href="#"> <span id="hold" class="ico"></span><span>审批中的教室</span><span
								class="num">${passingroom}</span></a></li>
					</ul>
				</div>
			</div>

			<div id="jiantou-box">
				<div></div>
				<div></div>
				<div class="jiantou"></div>
				<div></div>
			</div>