/**
 * describtion: 模态窗口
 * author: 孙凯
 * creation date: 2012-11-20
 * updated date: 2012-11-23
 */
/**
 * 参数说明 
 **/
function ModalWindow(type, width, height, title, url) {
	this.type = type;
	this.width = width;
	this.height = height;
	this.left = ($(top).width()-width)/2;
	this.top = this._setTop();
	this.url = url;
	this.title = title;
	this.closeIco = "common/img/close_ico.png";
	this.window = this._createWindow();
	this.titleBar = this._createTitleBar();
	this.closeButton = this._createCloseButton();
	this.iframe = this._createIframe();
	this.mask = this._createMask();
	this.openWindow();
}
ModalWindow.prototype.openWindow = function() {
	var that = this;
	this.closeButton.appendTo(this.titleBar);
	this.titleBar.appendTo(this.window);
	that.iframe.appendTo(that.window);
	that.window.show();
	$(top.document).scrollTop(0);
};
ModalWindow.prototype.closeWindow = function() {
	this.mask.remove();
	this.window.remove();
};

ModalWindow.prototype._setTop = function() {
	var winHeight = $(top).height();
	if(this.height<winHeight) {
		return (winHeight-this.height)/2;
	} else {
		return 0;
	}
};


ModalWindow.prototype._createTitleBar = function() {
	var title = $("<span>"+this.title+"</span>").css({
		"float":"left",
		"font-size":14,
		"font-weight":"bold",
		"color":"#000000",
		"display":"block",
		"height":"25px",
		"margin-left":"8px",
		"line-height":"25px"
	});
	return $("<div>").css({
		"height":25,
		"background-color":"#089FFF"
	}).append(title);
};
ModalWindow.prototype._createCloseButton = function() {
	var that = this;
	var closebtn = $("<img>").attr("src", this.closeIco).css({
		"height":25,
		"float":"right",
		"cursor":"pointer"
	}).click(function(){
		that.closeWindow();
	});
	return closebtn;
};
ModalWindow.prototype._createMask = function() {
	var div = $("<div id='modal_mask'>").css({
		"position":"absolute",
		"z-index":1,
		"left":"0px",
		"top":"0px",
		"width":$(top).width(),
		"height":$(top.document).height(),
		"background-color":"#000000",
	    "opacity":0.5  
	}).appendTo(top.document.body);
	return div;
};

ModalWindow.prototype._createWindow = function() {
	var that = this;
	var div = $("<div id='modal_window'>").css({
		"width":that.width,
		"height":that.height,
		"position":that.type,
		"z-index":2,
		"left":that.left,
		"top":that.top,
		"border":"1px solid #3399FF"
	}).appendTo(top.document.body);
	return div;
};

ModalWindow.prototype._createIframe = function() {
	var that = this;
	var ifrm = $("<iframe frameborder='0' id='modalIframe' name='modalIframe'>").attr("src", that.url).css({
			"width":"100%",
			"height":"100%",
			"border":"0",
			"overflow":"hidden"
	});
	return ifrm;
};


//模态窗口不随网页滚动
function openFixedModalWindow(width, height, title, url) {
	//url = url+"&ts="+new Date().getMilliseconds();
	modalwindow = new ModalWindow("fixed", width, height, title,url);
}
//模态窗口跟随网页滚动
function openModalWindow(width, height, title, url) {
	//url = url+"&ts="+new Date().getMilliseconds();
	modalwindow = new ModalWindow("absolute", width, height,title, url);
}
//关闭模态窗口
function closeModalWindow(){
	$("#modal_mask").remove();
	$("#modal_window").remove();
}
//消息提示窗口
function openMsgBox(width, height, title, info, labels) {
	//new ModalWindow("absolute", width, height,title, url);
}



