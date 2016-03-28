

function _queryDoing(){
	jBox.tip("查询中，请稍后...","loading");
}
function getWeak(dp){
	var date=dp.cal.getP('y')+"-"+dp.cal.getP('M')+"-"+dp.cal.getP('d');
	$.post("indexquery_dateStrToXQ?dateStrToXQ="+date,function(data){
				   $(".showxq").html("<font color='blue'>"+data+"</font>");
				   $("#xq").val(data);
				   //autofx();
				 }
	);

}

$(function(){

	$(".tiaoj").hide();
	$(".more").toggle(function(){
		$(this).text("更多查询条件-");
		$(".tiaoj").slideDown("slow");
		return;
	},function(){
		$(this).text("更多查询条件+");
		$(".tiaoj").slideUp("slow");;
		return;
	});
	

	$(".inputtext").click(function(){
		if($(this).val()=="教室编号"){
			$(this).val("");
		};	
	}).blur(function(){
		if($(this).val()==""){
			$(this).val("教室编号");	
		}
	});
});

var rooms=new Array(); 
var page=0;
var pagecount=20;//aa
var thispage=1;
var thispage=1;
var urltxt="indexquery_queryAll";
function queryAjax(){

	$.ajax({
        cache: false,
        type: "POST",
        url:urltxt, 
        data:$('#form_query').serialize(),
        async: false,  
        
        error: function(request) { 
        	jBox.error("操作失败！","错误信息");
        	$.jBox.closeTip();
        	$("#query").attr('disabled',false);
        },
        success: function(data) { 
        	$.jBox.closeTip();
        	$("#query").attr('disabled',false);
        	if(data=="" || data==null || data==undefined){
        		$("#classRoomList").html("");
        		jBox.error("未找到数据！","错误信息");
        		return;
        	}
        	thispage=1;
        	page=0;
            rooms=jQuery.parseJSON(data);
            initdata();
            
            //autofx();
        }
    });
}

$(function(){
	
	$("#startkj").change(function(){
		var val=$(this).val();
		if(val=="15" || val=="16"){
			$("#endkj").val(val);
			
		}else{
			var cc=$("#endkj").val();
			if(cc=="15" || cc=="16"){
				$("#endkj").val("");
			}
			
		}
		
	});
	$("#endkj").change(function(){
		var val=$(this).val();
		if(val=="15" || val=="16"){
			$("#startkj").val(val);
		}else{
			var cc=$("#startkj").val();
			if(cc=="15" || cc=="16"){
				$("#startkj").val("");
			}
		}
		
	});
	
	$("#query").click(function(){
		_queryDoing();
		$(this).attr('disabled',true);
		var st=$("#startkj").val();
		var en=$("#endkj").val();
		var userDate=$("#date1").val();
		if(userDate!=""){
			
				if(st=="" || st==null || st==undefined){
					jBox.error("请选择开始节次","操作错误！");
					$("#query").attr('disabled',false);
					$.jBox.closeTip();
					return false;
				}
				if(en=="" || en==null || en==undefined){
					jBox.error("请选择结束节次","操作错误！");
					$("#query").attr('disabled',false);
					$.jBox.closeTip();
					return false;
				}
				
			
		}
		
		
		if(st>=15){
			
			$("#endkj").val(st);
		}
		if(st!="" && en !=""){
			if(st*1>en*1){
				jBox.error("开始节次不能大于结束节次","操作错误！");
				$("#query").attr('disabled',false);
				$.jBox.closeTip();
				return false;
			}
		}
		
		
		
		var querytxt=$(".inputtext").val();
		
		if(querytxt!="" && querytxt!="教室编号"){
			urltxt="indexquery_queryByNo";
		}else{
			$(".inputtext").val("");
		}
		setTimeout("queryAjax()",1000);
	
		
		return false;
	});
	
	

		
	
	
	

	//末页
	$("#lastpage").click(function(){
		_doing();
		if(thispage==Math.ceil((rooms.length)/pagecount)){
			$.jBox.closeTip();
			jBox.error("已经是最后一页了","错误信息");
		}else{
			thispage=Math.ceil((rooms.length)/pagecount);
			createHtml(thispage);
		}
		
	});
	
	$("#downpage").click(function(){
		_doing();
		thispage++;
		if(thispage<=page){
			createHtml(thispage);
		}else{
			$.jBox.closeTip();
			thispage--;
			jBox.error("已经是最后一页了","错误信息");
		}
		
		//autofx();
	});
	

	$("#uppage").click(function(){
		_doing();
		thispage--;
		if(thispage>0){
			createHtml(thispage);
		}else{
			$.jBox.closeTip();
			thispage++;
			jBox.error("已经是第一页了","错误信息");
		}
		//autofx();
	});
	
	
	$("#indexpage").click(function(){
		_doing();
		if(thispage==1){
			$.jBox.closeTip();
			jBox.error("已经是第一页了","错误信息");
			return;
		}
		thispage=1;
		createHtml(thispage);
		//autofx();
	});
});


function initdata(){
	
	createHtml(thispage);
	
}

function showpage(indexpage){
	
	page=Math.ceil(rooms.length/pagecount);
	$(".showpage").text(indexpage+"/"+page);
}

function createHtml(nextpage){
	$.jBox.closeTip();
		var $crl=$("#classRoomList");
		$crl.fadeTo("fast", 0.01);
		$crl.empty();
		var begin=0;
		var end=0;
		var gotopage=pagecount*nextpage;
		if(page==nextpage){
			begin=(page-1)*pagecount;
			end=rooms.length;
		}else{
			begin=gotopage-pagecount;
			end=gotopage;
		}
		if(end>rooms.length){
			end=rooms.length;
		}
		var divHtml="";
		for(var i=begin;i<end;i++){
			var roomstate=rooms[i].status;
			var bgImg=room;
			if(roomstate=="3"){
				bgImg=state1;
			}else{
				bgImg=state3;
			}
			var roomno=rooms[i].num+"";
			divHtml+="<div class='room'><input type='hidden' value='"+roomno+"'>\n";
			divHtml+="<ul class='roomul'>\n";	
			//if($("#date1").val()) {
				divHtml+="<li class='limg' style='background-image: url("+bgImg+");'><div class='lf rn' style='margin-left:65px;'>"+rooms[i].num+"</div></li>\n";
			//} else {
			//	divHtml+="<li class='limg' style='background-image: url("+room+");'><div class='lf rn' style='padding-top:8px;margin-left:65px;'>"+rooms[i].num+"</div></li>\n";
			//}
			divHtml+="</ul>	\n";
			divHtml+="</div>\n";
		}
		$crl.append($(divHtml)).find(".room").click(function(){
			var roomno=$(this).find(":input").val();
			getRC(roomno,$(this));
			
		});
		$crl.fadeTo("slow", 0.99);
		showpage(nextpage);
}

var isSort;
var isOver=0;
function autofx(){
	isOver=0;
	var $rooms=$(".room");
	isSort=$rooms.length;
	if($rooms.length==0){
		return ;
	}
	
	var userDate=$("#date1").val();
	if(""==userDate){
		return;
	}
	var startkj=$("#startkj").val();
	var endkj=$("#endkj").val();
	var xq=$("#xq").val();
	$.each($rooms,function(i){
		isSort--;
			var roomNocode=$.trim($(this).find(".rn").text());
			//alert($(this).find("span").html());
			var datas="xq="+xq+"&roomNocode="+roomNocode+"&userDate="+userDate+"&userStart="+startkj+"&userEnd="+endkj;
			//alert(datas);
			$.ajax({
	            cache: false,
	            type: "POST",
	            url:"indexquery_checkState", 
	            data:datas,
	            async: true,  
	            error: function(request) { 
	            	jBox.error("操作失败！","错误信息");	               
	            },
	            success: function(data) { 
	            	isOver++;
	            	var $bgimg=$($(".room").get(i)).find(".limg");
	            	var $sq=$($(".room").get(i)).find(".sq");  
	            	
	            	if(data=="3"){
	            		$bgimg.css("background-image","url("+state1+")");
	            	}else{
	            		$bgimg.css("background-image","url("+state3+")");
	            	}
	            	
	            	if(isOver==$rooms.length){
	            		//roomSort();
	            	}
	            }
	        });
	}); 
	
}

function roomSort(){
	var $sortRooms=$(".room");
	var used="";
	var unused="";
	if(isSort>0){
		return;
	}
	if($sortRooms.length==0){
		return ;
	}
	$.each($sortRooms,function(i){
		var temp=$(this).html();
		var bgimg=$(this).find(".limg").css("background-image");
		if(bgimg.indexOf(state3)>0){
			temp=$(this).find(".limg").css("background-image","url("+state3+")").parent().parent().html();
			used+="<div class='room'>"+temp+"\n</div>";
		}else{
			unused+="<div class='room'>"+temp+"\n</div>";
		};
	});

 	var $crl=$("#classRoomList");
 	$("#classRoomList").html("");
		$crl.append($(unused)).find(".room").unbind("click").click(function(){
			var roomno=$(this).find(":input").val();
			getRC(roomno,$(this));
			
		});
		$crl.append($(used)).find(".room").unbind("click").click(function(){
			var roomno=$(this).find(":input").val();
			getRC(roomno,$(this));
			
		});
}


$(document).ready(function(){
	$("#resetBtn").click(function(){
		$("#form_query").find("input").val("");
		$("#form_query").find("select").val("");
		//document.getElementById("form_query").reset();
		return false;
	});
});










