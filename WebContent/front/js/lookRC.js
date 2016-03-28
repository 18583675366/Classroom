

$(function(){
	  _rcArray1=new Array();
	  _rcArray2=new Array();
	  _rcArray3=new Array();
	  _rcArray4=new Array();
	  _rcArray5=new Array();
	  _rcArray6=new Array();
	  _rcArray7=new Array();
	  _rcArray8=new Array();
	  
	  _arrayTemp=new Array();
	  _showDiv="<div id='_showDiv'  style='width:95%;height:550px;text-align:center; overflow-Y:auto; border:#144464 2px solid; background-color:#fff;position:fixed;z-index:999'></div>";
	$("#csb").click(function(e){

	});
});


function getRC(roomNo,e){
	var datestring=$("#date1").val();

	$("#_showDiv").empty();
	$.ajax({
		   type: "POST",
		   url: "Datasyncaction_getroomCourseList",
		   data: "roomNo="+$.trim(roomNo)+"&dateString="+datestring,
		   beforeSend:function(){
			   _showDivfn(roomNo,e);
			   _doing();
		   },
		   success: function(data){	
			   $.jBox.closeTip();
			   var returnJson=data.split("#");
			   
		       var datas=returnJson[0].split("_");
		       if(datas.length==7){
		    	  _rcArray1=[];
			   	  _rcArray2=[];
			   	  _rcArray3=[];
			   	  _rcArray4=[];
			   	  _rcArray5=[];
			   	  _rcArray6=[];
			   	  _rcArray7=[];

			   	  _arrayTemp=[];
		   	  
		    	 _rcArray1=jQuery.parseJSON(datas[0]);
		    	 _rcArray2=jQuery.parseJSON(datas[1]);
		    	 _rcArray3=jQuery.parseJSON(datas[2]);
		    	 _rcArray4=jQuery.parseJSON(datas[3]);
		    	 _rcArray5=jQuery.parseJSON(datas[4]);
		    	 _rcArray6=jQuery.parseJSON(datas[5]);
		    	 _rcArray7=jQuery.parseJSON(datas[6]);

		    	 $("#img").hide();
		    	 _arrayTemp.push(_rcArray1);
		    	 _arrayTemp.push(_rcArray2);
		    	 _arrayTemp.push(_rcArray3);
		    	 _arrayTemp.push(_rcArray4);
		    	 _arrayTemp.push(_rcArray5);
		    	 _arrayTemp.push(_rcArray6);
		    	 _arrayTemp.push(_rcArray7);
		    	 
		    	 showdata(roomNo,returnJson);
		    	 
		     }else{
		    	 jBox.error("无排课数据","错误信息");
		    	 $("#_showDiv").hide();
		     }
		     
		   }
		});
}

function getCurrentDayofWeek() {
	var day;
	var d = new Date();
	switch(d.getDay()) {
	case 1:
		day = "星期一";
		break;
	case 2:
		day = "星期二";
		break;
	case 3:
		day = "星期三";
		break;
	case 4:
		day = "星期四";
		break;
	case 5:
		day = "星期五";
		break;
	case 6:
		day = "星期六";
		break;
	case 0:
		day = "星期日";
		break;
	}
	return day;
}

function getTimeForJc(n){
	var val=$("#zxsj option:eq("+(n-2)+")").text();
	var t=val.split("-");
	
	return t[0].substring(0,t[0].lastIndexOf(":"))+"-"+t[1].substring(0,t[1].lastIndexOf(":"));
}

function showdata(no,returnJson){
	var thisdate=$("#date1").val();
	if(thisdate==undefined || thisdate==null || thisdate==""){
		thisdate=returnJson[returnJson.length-3];
	};
	var amp=returnJson[returnJson.length-1].split(",");
	
	var rcHtml="";
	rcHtml +="<table width='100%'  height='100%' cellpadding=5>\n";
	rcHtml +="<tr  style='background-color:#F5F5F5'>\n";
	rcHtml +="<td colspan='9' style='border-bottom:1px solid #ccc'><span style='float:left;padding:5px'>教室"+no+"  未来7天课程&nbsp;&nbsp;&nbsp;&nbsp;今天是"+thisdate+"&nbsp;&nbsp;第"+returnJson[returnJson.length-2]+"周&nbsp;&nbsp;"+getCurrentDayofWeek()+"</span><span id='_closeRc' style='float:right;border:1px solid #ccc;cursor: pointer;margin-right:10px;padding:3px;background:#144464';><font color='#FFFFFF'>关闭</font></span></td>\n";
	rcHtml +="</tr>\n";
	rcHtml +="<tr>\n";
	rcHtml +="<td width='60' colspan='2' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>课程表</td>\n";
	rcHtml +=_getxqsort(returnJson);
	
	rcHtml +="</tr>\n";
	for(var i=0;i<5;i++){
		if(i==0){
			rcHtml +="<tr>\n";
			rcHtml +="<td width='39px' rowspan='5' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>上午</td>\n";
		}else{
			rcHtml +="<tr>\n";
		}
		rcHtml +="<td width='19px' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'><div align='center'>"+(i+1)+"</div></td>\n";
		
		if(_arrayTemp[0][i]!=undefined)
		{
			rcHtml +="<td  height='30px' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>"+_arrayTemp[0][i].kcmc+"<br/><span style='color:#1155ee;'>"+_arrayTemp[0][i].jsmc+"</span></td>\n";
		}
		if(_arrayTemp[1][i] !="undefined")
		{
			rcHtml +="<td style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>"+_arrayTemp[1][i].kcmc+"<br/><span style='color:#1155ee;'>"+_arrayTemp[1][i].jsmc+"</span></td>\n";
		}
		if(_arrayTemp[2][i]!=undefined)
		{
			rcHtml +="<td style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>"+_arrayTemp[2][i].kcmc+"<br/><span style='color:#1155ee;'>"+_arrayTemp[2][i].jsmc+"</span></td>\n";
		}
		if(_arrayTemp[3][i]!=undefined)
		{
			rcHtml +="<td style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>"+_arrayTemp[3][i].kcmc+"<br/><span style='color:#1155ee;'>"+_arrayTemp[3][i].jsmc+"</span></td>\n";
		}
		if(_arrayTemp[4][i]!=undefined)
		{
			rcHtml +="<td style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>"+_arrayTemp[4][i].kcmc+"<br/><span style='color:#1155ee;'>"+_arrayTemp[4][i].jsmc+"</span></td>\n";
		}
		if(_arrayTemp[5][i]!=undefined)
		{
			rcHtml +="<td style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>"+_arrayTemp[5][i].kcmc+"<br/><span style='color:#1155ee;'>"+_arrayTemp[5][i].jsmc+"</span></td>\n";
		}
		if(_arrayTemp[6][i]!=undefined)
		{
			rcHtml +="<td style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>"+_arrayTemp[6][i].kcmc+"<br/><span style='color:#1155ee;'>"+_arrayTemp[6][i].jsmc+"</span></td>\n";
		}
	
		rcHtml +="</tr>\n";
	}
	rcHtml +="<tr height='18px' style='background-color:#F5F5F5'>\n";
	rcHtml +="<td width='39px'  style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>中午<br>"+getTimeForJc(15)+"</td>\n";
	rcHtml +="<td  style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>中     午</td>\n";
	for(var i=0;i<7;i++){
		
	//rcHtml +="<td  style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>";
	if(amp[i]!=undefined && amp[i]!="" ){
		rcHtml +="<td  style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>"+amp[i]+"</td>\n";
	}else{
		rcHtml +="<td  height='30px' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>"+_arrayTemp[i][5].kcmc+"<br/><span style='color:#1155ee;'>"+_arrayTemp[i][5].jsmc+"</span></td>\n";
	}
	
	}
	rcHtml +="</tr>\n";
	
	for(var i=5;i<10;i++){
		if(i==5){
			rcHtml +="<tr>\n";
			rcHtml +="<td width='39px' rowspan='5' style='border-left:1px solid #ccc'>下午</td>\n";
		}else{
			rcHtml +="<tr>\n";
		}
		rcHtml +="<td width='19px'  style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'><div align='center'>"+(i+1)+"</div></td>\n";
		if(_arrayTemp[0][i+1]!=undefined)
		{
			rcHtml +="<td  height='30px' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>"+_arrayTemp[0][i+1].kcmc+"<br/><span style='color:#1155ee;'>"+_arrayTemp[0][i+1].jsmc+"</span></td>\n";
		}
		if(_arrayTemp[1][i+1]!=undefined)
		{
			rcHtml +="<td style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>"+_arrayTemp[1][i+1].kcmc+"<br/><span style='color:#1155ee;'>"+_arrayTemp[1][i+1].jsmc+"</span></td>\n";
		}
		if(_arrayTemp[2][i+1]!=undefined)
		{
			rcHtml +="<td style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>"+_arrayTemp[2][i+1].kcmc+"<br/><span style='color:#1155ee;'>"+_arrayTemp[2][i+1].jsmc+"</span></td>\n";
		}
		if(_arrayTemp[3][i+1]!=undefined)
		{
			rcHtml +="<td style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>"+_arrayTemp[3][i+1].kcmc+"<br/><span style='color:#1155ee;'>"+_arrayTemp[3][i+1].jsmc+"</span></td>\n";
		}
		if(_arrayTemp[4][i+1]!=undefined)
		{
			rcHtml +="<td style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>"+_arrayTemp[4][i+1].kcmc+"<br/><span style='color:#1155ee;'>"+_arrayTemp[4][i+1].jsmc+"</span></td>\n";
		}
		if(_arrayTemp[5][i+1]!=undefined)
		{
			rcHtml +="<td style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>"+_arrayTemp[5][i+1].kcmc+"<br/><span style='color:#1155ee;'>"+_arrayTemp[5][i+1].jsmc+"</span></td>\n";
		}
		if(_arrayTemp[6][i+1]!=undefined)
		{
			rcHtml +="<td style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>"+_arrayTemp[6][i+1].kcmc+"<br/><span style='color:#1155ee;'>"+_arrayTemp[6][i+1].jsmc+"</span></td>\n";
		}
	
		rcHtml +="</tr>\n";
	}
	
//		rcHtml +="<tr height='18px' style='background-color:#F5F5F5'>\n";
//		rcHtml +="<td width='39px'  style='border-left:1px solid #ccc;border-bottom:1px solid #ccc;border-top:1px solid #ccc'>晚上<br>"+getTimeForJc(16)+"</td>\n";
//		rcHtml +="<td  style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>晚    上</td>\n";
//		for(var i=7;i<amp.length-1;i++){
//			rcHtml +="<td  style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>"+amp[i]+"</td>\n";
//			
//		}
//		rcHtml +="</tr>\n";
	
	for(var i=10;i<=12;i++){
		if(i==10){
			rcHtml +="<tr>\n";
			rcHtml +="<td width='39px'  rowspan='3' style='border-left:1px solid #ccc;border-top:1px solid #ccc'>晚上</td>\n";
		}else{
			rcHtml +="<tr>\n";
		}
		rcHtml +="<td width='19px'   style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'><div align='center'>"+(i+1)+"</div></td>\n";
		if(_arrayTemp[0][i+1]!=undefined)
		{
			rcHtml +="<td height='30px' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>"+_arrayTemp[0][i+1].kcmc+"<br/><span style='color:#1155ee;'>"+_arrayTemp[0][i+1].jsmc+"</span></td>\n";
		}
		if(_arrayTemp[1][i+1]!=undefined)
		{
			rcHtml +="<td style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>"+_arrayTemp[1][i+1].kcmc+"<br/><span style='color:#1155ee;'>"+_arrayTemp[1][i+1].jsmc+"</span></td>\n";
		}
		if(_arrayTemp[2][i+1]!=undefined)
		{
			rcHtml +="<td style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>"+_arrayTemp[2][i+1].kcmc+"<br/><span style='color:#1155ee;'>"+_arrayTemp[2][i+1].jsmc+"</span></td>\n";
		}
		if(_arrayTemp[3][i+1]!=undefined)
		{
			rcHtml +="<td style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>"+_arrayTemp[3][i+1].kcmc+"<br/><span style='color:#1155ee;'>"+_arrayTemp[3][i+1].jsmc+"</span></td>\n";
		}
		if(_arrayTemp[4][i+1]!=undefined)
		{
			rcHtml +="<td style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>"+_arrayTemp[4][i+1].kcmc+"<br/><span style='color:#1155ee;'>"+_arrayTemp[4][i+1].jsmc+"</span></td>\n";
		}
		if(_arrayTemp[5][i+1]!=undefined)
		{
			rcHtml +="<td style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>"+_arrayTemp[5][i+1].kcmc+"<br/><span style='color:#1155ee;'>"+_arrayTemp[5][i+1].jsmc+"</span></td>\n";
		}
		if(_arrayTemp[6][i+1]!=undefined)
		{
			rcHtml +="<td style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>"+_arrayTemp[6][i+1].kcmc+"<br/><span style='color:#1155ee;'>"+_arrayTemp[6][i+1].jsmc+"</span></td>\n";
		}
	
		rcHtml +="</tr>\n";
	}
	    
	
	rcHtml +="</table>\n";
	$("#_showDiv").append($(rcHtml)).find("#_closeRc").click(function(){
		$("#_showDiv").hide();
	}).parent().find("td").each(function(){
		
	});  
}

function _getxqsort(returnJson){
	var rh="";
	var n=returnJson[1];
	if(n==1){
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期一<br>"+returnJson[2]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期二<br>"+returnJson[3]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期三<br>"+returnJson[4]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期四<br>"+returnJson[5]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期五<br>"+returnJson[6]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期六<br>"+returnJson[7]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期日<br>"+returnJson[8]+"</td>\n";
	}
	if(n==2){
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期二<br>"+returnJson[2]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期三<br>"+returnJson[3]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期四<br>"+returnJson[4]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期五<br>"+returnJson[5]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期六<br>"+returnJson[6]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期日<br>"+returnJson[7]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期一<br>"+returnJson[8]+"</td>\n";
	}
	if(n==3){
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期三<br>"+returnJson[2]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期四<br>"+returnJson[3]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期五<br>"+returnJson[4]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期六<br>"+returnJson[5]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期日<br>"+returnJson[6]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期一<br>"+returnJson[7]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期二<br>"+returnJson[8]+"</td>\n";
	}
	if(n==4){
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期四<br>"+returnJson[2]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期五<br>"+returnJson[3]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期六<br>"+returnJson[4]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期日<br>"+returnJson[5]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期一<br>"+returnJson[6]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期二<br>"+returnJson[7]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期三<br>"+returnJson[8]+"</td>\n";
	}
	if(n==5){
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期五<br>"+returnJson[2]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期六<br>"+returnJson[3]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期日<br>"+returnJson[4]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期一<br>"+returnJson[5]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期二<br>"+returnJson[6]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期三<br>"+returnJson[7]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期四<br>"+returnJson[8]+"</td>\n";
		
	}
	if(n==6){
		
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期六<br>"+returnJson[2]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期日<br>"+returnJson[3]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期一<br>"+returnJson[4]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期二<br>"+returnJson[5]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期三<br>"+returnJson[6]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期四<br>"+returnJson[7]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期五<br>"+returnJson[8]+"</td>\n";
		
	}
	if(n==7){
		
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期日<br>"+returnJson[2]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期一<br>"+returnJson[3]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期二<br>"+returnJson[4]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期三<br>"+returnJson[5]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期四<br>"+returnJson[6]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期五<br>"+returnJson[7]+"</td>\n";
		rh +="<td width='150' style='border-left:1px solid #ccc;border-bottom:1px solid #ccc'>星期六<br>"+returnJson[8]+"</td>\n";
		
	}
	
	return rh;
}

function _showDivfn(roomNo,e){
	$("body").append($(_showDiv));
	var h = $(window).height();
	var w = $(window).width();
	$("#_showDiv").css({
//		"top":(scr+50)+"px",
//		"left":(w/2-475)+"px"
		"top":(h-$("#_showDiv").height())/2,
		"left":(w-$("#_showDiv").width())/2
	}).show();
	
}
function _doing(){
	
	//var doing="<img id='img' src='common/img/jbox-content-loading.gif' width='100%' height='40px'>";
	//$("#_showDiv").append($(doing));
	$.jBox.tip("系统正在努力地为您查询近一周的排课、占用、空闲数据，请稍后...","loading");
}