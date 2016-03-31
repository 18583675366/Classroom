//全局ajax控制，用于session超时 无权限时 提示  

$(function(){
	$.ajaxSetup({  
	    cache: false, //close AJAX cache  
	    
	    complete:function(XHR,textStatus){     
	        var resText = XHR.responseText;  
	        if(resText=='ajaxSessionTimeOut'){     
	            sessionTimeOut();  
	        }  
	                 
	    }   
	});  
	
});

  
function sessionTimeOut(){  
    alert('用户登录会话已过期，请重新登录！');  

        var url=getRootPath();
    	url +="/sso/authorize.jsp";
    window.location=url;
    
}  
function getRootPath(){  
    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp  
    var curWwwPath=window.document.location.href;  
    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp  
    var pathName=window.document.location.pathname;  
    var pos=curWwwPath.indexOf(pathName);  
    //获取主机地址，如： http://localhost:8083  
    var localhostPaht=curWwwPath.substring(0,pos);  
    //获取带"/"的项目名，如：/uimcardprj  
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);  
    return(localhostPaht+projectName);  
} 


$(document).ready(function(){
	//ajax查询消息数目
	$.post("http://localhost:8080/Classroom/user/querymsglength", function(data){
		$("#newMsgNum").html("消息("+data+")");
	},"text");
});

/**
 * 新增电话
 * @param userId
 */
function showInput(userId) {
	var i = $("<input type='text'>"); 
	var b = $("<input type='button' value='保存'>");
	$("#phoneNumber").html("");
	i.appendTo("#phoneNumber");
	b.appendTo("#phoneNumber");
	i.focus();
	b.click(function(){
		var pn = i.val();
		if((pn!=null && pn!="") && !(/^13\d{9}$/g.test(pn) || (/^15[0-9]\d{8}$/g.test(pn)) || (/^18[0-9]\d{8}$/g.test(pn)))) {
			alert("手机号码格式错误");
			return;
		}
		$.get("login/saveUser.action", {'user.id':userId, 'user.phoneNumber':pn}, function(data){
			if(data=="success") {
				$.get("login/findUser.action", {'user.id':userId}, function(data){
					//if(data) {
						$("#phoneNumber").html("手机："+data+"(<a href=\"javascript:modifyUser('"+userId+"');\">修改</a>)");
					//}
				});
			} else {
				alert("保存失败");
			}
		});
	});
}

/**
 * 修改电话
 * @param userId
 */
function modifyUser(userId) {
	
	var i = $("<input type='text'>"); 
	var b = $("<input type='button' value='修改'>");
	$("#phoneNumber").html("");
	i.appendTo("#phoneNumber");
	b.appendTo("#phoneNumber");
	i.focus();
	b.click(function(){
		var pn = i.val();
		if((pn!=null && pn!="") && pn!="" && !(/^13\d{9}$/g.test(pn) || (/^15[0-9]\d{8}$/g.test(pn)) || (/^18[0-9]\d{8}$/g.test(pn)))) {
			alert("手机号码格式错误");
			return;
		}
		if(pn=="") {
			pn = "null";
		}
		$.get("login/modifyUser.action", {'user.id':userId, 'user.phoneNumber':pn}, function(data){
			if(data=="success_update") {
				$.get("login/findUser.action", {'user.id':userId}, function(data){
					//if(data) {
						$("#phoneNumber").html("手机："+data+"(<a href=\"javascript:modifyUser('"+userId+"');\">修改</a>)");
					//}
				});
			} else if(data=="success_del") {
				$("#phoneNumber").html("您尚未设置手机号，<a href=\"javascript:showInput('"+userId+"');\">马上设置</a>");
			} else {
				alert("保存失败");
			}
		});
	});
}
  
