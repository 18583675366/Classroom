package com.classroom.control;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class GolableHandler {
	
	
	/**
	 * 跳转到后台管理页面
	 */
	@RequestMapping("/manage")
	public String manageUI(Map<String, Object> map) {
		// 开始准备各种数据
		return "manage/index";
	}
	/**
	 * 
	 */
	@RequestMapping("/index")
	public String index(){
		System.out.println("index");
		return "front/index";
	}

}
