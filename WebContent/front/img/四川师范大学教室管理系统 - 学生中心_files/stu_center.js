
$(document).ready(function(){
	//ajax查询消息数目
	$.get("message/getNewMsgNum.action", function(data){
		$("#newMsgNum").html(data);
		if(data!=0) {
			$("#newMsgNum").css("backgroundColor","#FF0000");
		}
	});

	$("a.cancel-href").click(function(){
		var formId = $(this).attr("formId");
		var submit = function (v, h, f) {
			if (v == 'ok')
				window.location.href = "classroomApplyForm/cancel.action?classroomApplyForm.id="+formId;
			else {
				return true;
			}
		};
		$.jBox.confirm("确定取消这个申请吗？", "操作提示", submit);
	});
	
	
	$(".apply_rule").click(function(){
		$.jBox("iframe:bulletin_loadBulletin", {
		    title: "查看信息",
		    width: 800,
		    height: 400,
		    buttons: null
		});
	});
	
});