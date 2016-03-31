/**
 * 教室申请步骤
 */

$(document).ready(function(){
	var index = 0;
	var switchStepbox = function(index){
		//全部层隐藏
		$("#classroom_apply_box .stepbox").hide(); 
		//显示指定的层
		$("#classroom_apply_box .stepbox:eq("+index+")").show();
	};
	//初始化：显示第一步
	switchStepbox(index);
	
	//第一步，下一步
	$("#step1next").click(function(){
		var userDate = $("#useDate").val();
		var startNum = $("#startClassNum").val();
		var endNum = $("#endClassNum").val();
		var use = $("#use").val();
		var applyfor = $("#applyfor").val();
		var isMedia = $("#isMedia").val();
		var chairs = $("#chairs").val();
		var tel = $("#tel").val();
		var note = $("#txt_note").val();
		
		//验证表单
		var isok = checkform(userDate, startNum, endNum, use, applyfor, tel, note);
		if(!isok) {
			return;
		}
	
		alert();
		if($("#step1next").css("backgroundPositionX")=="-288px"){
			$.jBox.tip("正在提交申请...", 'loading');
			$("#applyForm").attr("action", "/applyroom").submit();
		}
	});
	
	//第二步，返回
	$("#step2back").click(function(){
		index--;
		switchStepbox(index);
	});
	//第二步，下一步
	$("#step2next").click(function(){
		index++;
		switchStepbox(index);
	});
	
	
	//第三步，返回
	$("#step3back").click(function(){
		index--;
		switchStepbox(index);
	});
	
	//教室申请方式（系统自己选择，或者手选）
	$("input[name='isAssignClassroom']").click(function(){
		if($(this).val()==0) {
			$("#step3next").css("backgroundPosition", "-288px");
		} else if($(this).val()==1) {
			$("#step3next").css("backgroundPosition", "-216px");
		} 
		//$("#step3next").unbind("click");
//		$("#step3next").click(function() {
//			var zone = $("select[name='classroomApplyForm.classroom.zone']").val();
//			var building = $("select[name='classroomApplyForm.classroom.building']").val();
//			var isAircondition = $("select[name='classroomApplyForm.classroom.isAircondition']").val();
//			var isStep = $("select[name='classroomApplyForm.classroom.isStep']").val();
//			$("#applyForm input[name='classroomApplyForm.classroom.zone']").val(zone);
//			$("#applyForm input[name='classroomApplyForm.classroom.building']").val(building);
//			$("#applyForm input[name='classroomApplyForm.classroom.isAircondition']").val(isAircondition);
//			$("#applyForm input[name='classroomApplyForm.classroom.isStep']").val(isStep);
//			//系统选择教室
//			if($("#step3next").css("backgroundPositionX")=="-288px"){
//				$("#applyForm").attr("action", "classroomApply/applyRandom.action").submit();
//			//手动选择教室
//			} else if($("#step3next").css("backgroundPositionX")=="-216px"){
//				alert("调试中");
//				//$("#applyForm").attr("action", "classroomApply/queryClassroom.action").submit();
//			} 
//		});
		
	});
	
	$("#step3next").click(function() {
		var zone = $("select[name='classroomApplyForm.classroom.zone']").val();
		var building = $("select[name='classroomApplyForm.classroom.building']").val();
		var isAircondition = $("select[name='classroomApplyForm.classroom.isAircondition']").val();
		var isStep = $("select[name='classroomApplyForm.classroom.isStep']").val();
		$("#applyForm input[name='classroomApplyForm.classroom.zone']").val(zone);
		$("#applyForm input[name='classroomApplyForm.classroom.building']").val(building);
		$("#applyForm input[name='classroomApplyForm.classroom.isAircondition']").val(isAircondition);
		$("#applyForm input[name='classroomApplyForm.classroom.isStep']").val(isStep);
		$("#applyForm input[name='classroomApplyForm.classroom.isActivRoom']").val("exceptActivRoom");
		var start=$("#startClassNum").val();
		if(start>=15){
			$("#endClassNum").val(start);
		}
		
		
		//系统选择教室
		if($("#step3next").css("backgroundPositionX")=="-288px"){
			//$.jBox.tip("此功能未开发，请您暂时手选，谢谢！", 'error');
			$.jBox.tip("正在提交申请...", 'loading');
			$("#applyForm").attr("action", "classroomApply/applyRandom.action").submit();
		//手动选择教室
		} else if($("#step3next").css("backgroundPositionX")=="-216px"){
			//$("#applyForm").attr("action", "classroomApply/queryClassroom.action").submit();
			clearRoomNode();
			$.jBox.tip("正在查询，请稍后...", 'loading');
			$.post("classroomApply/queryClassroom.action", $("#applyForm").serialize(), function(data){
				$.jBox.closeTip();
				if(data==null || data=="" || data==undefined) {
					$.jBox.error('没查询到符合条件的空闲教室，请改变查询条件重试！', '温馨提示');
				} else {
					constructNode(data);
				}
			}, "json");
			index++;
			switchStepbox(index);
		} 
	});
	
	/**
	 * 根据json数据构造教室图标节点
	 */
	var constructNode = function(json) {
		for(var i=0; i<json.length; i++) {
			var str = '<div class="room" style="background:url('+bg+')"><div class="info">'+json[i].num+"<br/><font style='font-size:12px;'> 座位数："+json[i].chairs+'</font><input type="hidden" class="id" value="'+json[i].id+'"/></div><div class="apply_bg"></div><div class="apply_text">申&nbsp;&nbsp;请</div></div>';
			
			$(str).insertBefore("#cleardiv")
			.one("click",function(){
				$.jBox.tip("正在提交申请...", 'loading');
				var room = $(this);
				var id = $(this).children(".info").children(".id").val();
				$("#applyForm input[name='classroomApplyForm.classroomId']").val(id);
				$.post("classroomApply/apply.action", $("#applyForm").serialize(), function(data){
					if(data=="success") {
						$.jBox.tip("申请成功", "success");
						room.hide();
						if($.browser.msie) {
							window.location.href = "../classroomApplyForm/queryByUser.action";
						} else {
							window.location.href = "classroomApplyForm/queryByUser.action";
						}
						
					} else if(data=="failed") {
						$.jBox.tip("申请失败...", "error");
					}
				});
			}).hover(
				function(){
					$(this).children(".apply_bg").show();
					$(this).children(".apply_text").show();
				},
				function(){
					$(this).children(".apply_bg").hide();
					$(this).children(".apply_text").hide();
				}
			);
		}
	};
	
	var clearRoomNode = function() {
		$(".room").remove();
	}
	
	//取消申请
	$("#step1cancel,#step2cancel,#step3cancel,#step4cancel").click(function(){
		window.location.href = window.location.href;
	});
	
	$("#step4back").click(function() {
		index--;
		switchStepbox(index);
	});
	
	//申请表单验证
	var checkform = function(useDate, startClassNum, endClassNum, use, applyfor, tel, note) {
		var flag = true;
		$(".formcheck_must").html("*");
		$(".formcheck_info").html("");
		if(useDate=="") {
			$("#useDate").parent().children(".formcheck_must").html("请填写使用日期"); 
			flag = false;
		} else if(new Date(useDate)<=new Date()) {
			$("#useDate").parent().children(".formcheck_must").html("请至少提前一个工作日申请"); 
			flag = false;
		} else if(startClassNum=="-1") {
			$("#startClassNum").parent().children(".formcheck_must").html("请填写使用开始节次"); 
			flag = false;
		} else if(endClassNum=="-1") {
			$("#endClassNum").parent().children(".formcheck_must").html("请填写使用结束节次"); 
			flag = false;
		} else if(parseInt(endClassNum)<parseInt(startClassNum)) {
			$("#endClassNum").parent().children(".formcheck_must").html("节次填写有误：结束节次不能小于开始节次"); 
			flag = false;
		}
		if(use=="") {
			$("#use").next().html("请选择您申请的教室类型"); 
			flag = false;
		}
		if(applyfor=="") {
			$("#applyfor").next().html("请选择您申请教室的用途"); 
			flag = false;
		}
		if(note.length>500) {
			$("#txt_note").next().html("活动内容不要超过500字"); 
			flag = false;
		}
		return flag;
	};
	
	$("#startClassNum").change(function(){
		var val=$(this).val();
		if(val=="15" || val=="16"){
			$("#endClassNum").val(val);
			return;
		}else{
			var cc=$("#endClassNum").val();
			if(cc=="15" || cc=="16"){
				$("#endClassNum").val("-1");
			}
			
		}
		
	});
	$("#endClassNum").change(function(){
		var val=$(this).val();
		if(val=="15" || val=="16"){
			$("#startClassNum").val(val);
			
			return;
		}else{
			var cc=$("#startClassNum").val();
			if(cc=="15" || cc=="16"){
				$("#startClassNum").val("-1");
			}
		}
		
	});
	
});







