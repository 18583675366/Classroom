
$(document).ready(function(){
	//ajax鏌ヨ娑堟伅鏁扮洰
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
		$.jBox.confirm("查看规则", submit);
	});
	
	
	$(".apply_rule").click(function(){
		$.jBox("iframe:bulletin_loadBulletin", {
		    title: "查看规则",
		    width: 800,
		    height: 400,
		    buttons: null
		});
	});
	
});